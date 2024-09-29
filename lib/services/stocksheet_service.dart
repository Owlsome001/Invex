import 'dart:io';
import 'dart:isolate';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:realm/realm.dart';
import 'package:sim/controllers/app_controller.dart';
import 'package:sim/models/models.dart';
import 'package:sim/screens/utils/utils.dart';
import 'package:sim/services/stock_mouvement_service.dart';
import 'package:sim/services/stock_service.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';


enum StockSheetType {
  pdf, excel
}

class StockSheetService {
   static StockMouvementService stockMouvementService = StockMouvementService();
   static StockService stockService = StockService();
  
  static Future<String> getSimStockSheetDirectory({StockSheetType type = StockSheetType.pdf}) async {
    String excelStockSheetPath = "/Fiches de stocks/";
    
    Directory rootpath = await getApplicationDocumentsDirectory();
    


    Directory excelDirectory = Directory("${rootpath.path}/$excelStockSheetPath");

  
      if(await excelDirectory.exists()){
        return excelDirectory.path;
      }else{
       await excelDirectory.create(recursive: true);
       return excelDirectory.path;
      }
  }

  pw.Row writeStockSheetRow({required String date, required String reference, required String quantity, required MoveType type, String? justification }){
    return pw.Row(
        children: [
          writeStockSheetCell(cellData: date)
        ]
    );
  }

  pw.Container writeStockSheetCell({required String cellData}){
    return pw.Container(
      height: 20,
      width: 50,
      child: pw.Text(
          cellData,
          style: const pw.TextStyle(
            color: PdfColors.black
          )
      )
    );
  }
  Future<void> generatePdfStockSheet({required Stock stock, required DateTime startingDate, required  DateTime endDate, required String path}) async{
   
      List<StockMovement> mouvements = stock.getBacklinks<StockMovement>("stock")
      .where((move) => move.recordedAt.isAfter(startingDate)&& move.recordedAt.isBefore(endDate)).toList();
      final pdf = pw.Document(
        pageMode: PdfPageMode.fullscreen
      );

      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.a4,
          orientation: pw.PageOrientation.landscape,
          margin: const pw.EdgeInsets.all(2.5),
          build: (pw.Context context) {
            return 
            pw.Center(
                child: pw.Column(
                children: [
                  // pw.Table(
                  //   border: pw.TableBorder.all(),
                  //   children: [
                  //     ... mouvements.map((mouve) => pw.TableRow(
                  //       decoration: pw.BoxDecoration(border: pw.Border.all()),
                  //       children: [
                  //       writeStockSheetCell(cellData: dateFormater(date: mouve.recordedAt)),
                  //       pw.Text("Data"),
                  //     ]
                  //     ))
                  //   ]
                  // )

                  ... mouvements.map((mouve) => writeStockSheetRow(date: dateFormater(date: mouve.recordedAt), reference: mouve.reference, quantity: mouve.quantity.toString(), type: MoveType.values[mouve.moveType]))
            ]
          ));
          },
        ),
  );

  final file = File('$path/example.pdf');
  await file.writeAsBytes(await pdf.save());

  }

  // void setExcelCellSize({required Sheet sheet, required int rowIndex, required int columnIndex}){
    

  // }

  Future<void> generateExcelStockSheet({required Stock stock, required DateTime startingDate, required DateTime endDate, required String path}) async {
    List<StockMovement> mouvements = stock.getBacklinks<StockMovement>("stock")
    .where((move) => move.recordedAt.isAfter(startingDate)&& move.recordedAt.isBefore(endDate.add( const Duration(days: 1))) && move.status == MoveStatus.validated.index).toList();
    
    List<double> listInQuantities = mouvements.where((move) => move.moveType == MoveType.input.index)
    .map((mouve) => mouve.quantity).toList();

    double totalIn = listInQuantities.isNotEmpty?listInQuantities.reduce((value, element) => value+element):0.0;

    List<double> listOutQuantities = mouvements.where((move) => move.moveType == MoveType.output.index)
    .map((mouve) => mouve.quantity).toList();

    double totalOut = listOutQuantities.isNotEmpty?listInQuantities.reduce((value, element) => value+element):0.0;

    double initialQuantityValue = stockMouvementService.getStockQuantityBeforeMove(mouvements.first);
    
    double finalQuantityValue = mouvements.last.quantityAfterMouvement!;

    

    int startDataTableColumn=1;
     int dataRowIndex =9;
     //Creating a workbook
    var stockWorkBook = Workbook();
    //Selecting the worksheet
    Worksheet sheet = stockWorkBook.worksheets[0];

    sheet.pageSetup .paperSize = ExcelPaperSize.paperA4;
    sheet.pageSetup .isCenterHorizontally=true;
    sheet.pageSetup .orientation = ExcelPageOrientation.landscape;

    sheet.pageSetup .showGridlines =false;
    
    Style style = stockWorkBook.styles.add("Default Style");
    Style style1 = stockWorkBook.styles.add("DataCell Style");
      style1.borders.all.lineStyle = LineStyle.thin;
      style1.borders.all.color = "#000000";
    Style headerStyle = stockWorkBook.styles.add("Header Style");
      headerStyle.borders.all.lineStyle = LineStyle.thin;
      headerStyle.borders.all.color = "#000000";
      headerStyle.locked=true;
      headerStyle.vAlign= VAlignType.center;

    
    
    //Setup column widths
    sheet.setColumnWidthInPixels (startDataTableColumn, 80);
    sheet.setColumnWidthInPixels (startDataTableColumn+1, 250);
    sheet.setColumnWidthInPixels(startDataTableColumn+2, 80);
    sheet.setColumnWidthInPixels(startDataTableColumn+3, 80);
    sheet.setColumnWidthInPixels(startDataTableColumn+4, 80);
    sheet.setColumnWidthInPixels(startDataTableColumn+5, 250);

    //Writting the title in big
    Range centeredBigTitle = sheet.getRangeByIndex(dataRowIndex-8, startDataTableColumn,dataRowIndex-8,StockSheetData.headerRows.length);
    centeredBigTitle.merge();
    centeredBigTitle.rowHeight=30;
    centeredBigTitle.setText("Fiche de stock");
    centeredBigTitle.cellStyle=style;
    centeredBigTitle.cellStyle.fontSize=18;
    centeredBigTitle.cellStyle.hAlign=HAlignType.center;
    centeredBigTitle.cellStyle.vAlign=VAlignType.center;

    //Stock information
    Range stockNameCell = sheet.getRangeByIndex(dataRowIndex-6, startDataTableColumn,dataRowIndex-6,StockSheetData.headerRows.length-3);
    stockNameCell.merge();
    // stockNameCell.rowHeight=30;
    stockNameCell.setText("Nom de l'article \t: ${stock.stockName}");
    stockNameCell.cellStyle=style;
    stockNameCell.cellStyle.fontSize=12;

    Range stockMeasure = sheet.getRangeByIndex(dataRowIndex-5, startDataTableColumn,dataRowIndex-5,StockSheetData.headerRows.length-3);
    stockMeasure.merge();
    // stockMeasure.rowHeight=30;
    stockMeasure.setText("Unité de mesure \t: ${stock.measurementUnit!.title} ");
    stockMeasure.cellStyle=style;
    stockMeasure.cellStyle.fontSize=12;


     Range initialQuantity = sheet.getRangeByIndex(dataRowIndex-7, startDataTableColumn+4,dataRowIndex-7,StockSheetData.headerRows.length);
    initialQuantity.merge();
    // stockMeasure.rowHeight=30;
    initialQuantity.setText("Stock Initial \t: $initialQuantityValue ");
    initialQuantity.cellStyle=style;
    initialQuantity.cellStyle.fontSize=12;

    Range finalQuantity = sheet.getRangeByIndex(dataRowIndex-6, startDataTableColumn+4,dataRowIndex-6,StockSheetData.headerRows.length);
    finalQuantity.merge();
    // stockMeasure.rowHeight=30;
    finalQuantity.setText("Stock final \t: $finalQuantityValue ");
    finalQuantity.cellStyle=style;
    finalQuantity.cellStyle.fontSize=12;


     Range totalInput = sheet.getRangeByIndex(dataRowIndex-5, startDataTableColumn+4,dataRowIndex-5,StockSheetData.headerRows.length);
    totalInput.merge();
    // stockMeasure.rowHeight=30;
    totalInput.setText("Quantité entrées \t: $totalIn ");
    totalInput.cellStyle=style;
    totalInput.cellStyle.fontSize=12;

     Range totalOutput = sheet.getRangeByIndex(dataRowIndex-4, startDataTableColumn+4,dataRowIndex-4,StockSheetData.headerRows.length);
    totalOutput.merge();
    // stockMeasure.rowHeight=30;
    totalOutput.setText("Quantité sorties \t: $totalOut ");
    totalOutput.cellStyle=style;
    totalOutput.cellStyle.fontSize=12;


    sheet.importList(StockSheetData.headerRows, dataRowIndex-1, startDataTableColumn, false);



    
    List<StockSheetData> rows = mouvements.map((move){
      return  StockSheetData(
        dateTime: move.recordedAt, 
        reference: move.reference, 
        inputQuantity: move.moveType==MoveType.input.index?move.quantity:0.0, 
        outputQuantinty: move.moveType==MoveType.output.index?move.quantity:0.0, 
        quantityAfterMouvement: move.quantityAfterMouvement!=null?move.quantityAfterMouvement!:0.0, 
        justification: move.justification??"-");
    }).toList();

  

 
  
  int currentRowIndex =dataRowIndex;
  for (StockSheetData data in rows) {
    sheet.importList(data.arrayField, currentRowIndex, startDataTableColumn,false); 
    currentRowIndex+=1;
  }
  sheet.getRangeByIndex(dataRowIndex-2, startDataTableColumn, startDataTableColumn,StockSheetData.headerRows.length+2).cellStyle = headerStyle;

  Range dataRange =sheet.getRangeByIndex(
    dataRowIndex, 
    startDataTableColumn,
    dataRowIndex+rows.length-1, 
    StockSheetData.headerRows.length);
  dataRange.cellStyle = style1;

  Range dateRange =sheet.getRangeByIndex(
    dataRowIndex-2, 
    startDataTableColumn,
    dataRowIndex-1, 
    startDataTableColumn);

  Range referenceRage =sheet.getRangeByIndex(
    dataRowIndex-2, 
    startDataTableColumn+1,
    dataRowIndex-1, 
    startDataTableColumn+1);

  Range justificationRange =sheet.getRangeByIndex(
    dataRowIndex-2, 
    startDataTableColumn+5,
    dataRowIndex-1, 
    startDataTableColumn+5);

   Range quantityRange =sheet.getRangeByIndex(
    dataRowIndex-2, 
    startDataTableColumn+2,
    dataRowIndex-2, 
    startDataTableColumn+4);

    Range quantitiesRange =sheet.getRangeByIndex(
    dataRowIndex-1, 
    startDataTableColumn+2,
    dataRowIndex-1, 
    startDataTableColumn+4);
      quantitiesRange.cellStyle=headerStyle;
      quantitiesRange.cellStyle.bold=true;
      quantitiesRange.cellStyle.vAlign =VAlignType.center;
      quantitiesRange.cellStyle.hAlign =HAlignType.center;
    
    quantityRange.merge();
    quantityRange.setText("Quantité");
    quantityRange.cellStyle=headerStyle;
    quantityRange.cellStyle.bold=true;
    quantityRange.cellStyle.vAlign =VAlignType.center;
    quantityRange.cellStyle.hAlign =HAlignType.center;
    quantityRange.cellStyle.locked=true;



    justificationRange.merge();
    justificationRange.setText(StockSheetData.headerRows[5]);
    justificationRange.cellStyle=headerStyle;
    justificationRange.cellStyle.bold=true;
    justificationRange.cellStyle.vAlign =VAlignType.center;
    justificationRange.cellStyle.hAlign =HAlignType.center;
  
    referenceRage.merge();
    referenceRage.setText(StockSheetData.headerRows[1]);
    referenceRage.cellStyle=headerStyle;
    referenceRage.cellStyle.bold=true;
    referenceRage.cellStyle.vAlign =VAlignType.center;
    referenceRage.cellStyle.hAlign =HAlignType.center;
  
    dateRange.merge();
    dateRange.setText(StockSheetData.headerRows[0]);
    dateRange.cellStyle=headerStyle;
    dateRange.cellStyle.bold=true;
    dateRange.cellStyle.vAlign =VAlignType.center;
    dateRange.cellStyle.hAlign =HAlignType.center;


  

    
    //Saving the excel file
    sheet.name =  "Fiche de stock (${stock.stockName})";
    List<int> fileBytes = stockWorkBook.saveAsStream();
    stockWorkBook.dispose();
    final file = File('$path/Fiche de stock ${stock.stockName} ${dateFormater(date:DateTime.now(),isUTC: false)}.xlsx');
    await file.writeAsBytes(fileBytes);
    
  }

  Future<ReceivePort> generateStockSheet({required DateTime startingDate, required DateTime endingDate, required Stock stock, required StockSheetType sheetformat, required String path}) async {
      final ReceivePort generationPort = ReceivePort();
      final String endingDateValue = dateFormater(date: endingDate, isUTC: false);
      final String startingDateValue = dateFormater(date: startingDate, isUTC: false);
      final int sheetType = sheetformat.index;

      await Isolate.spawn(generateStockSheetIsolateProcess, [generationPort.sendPort, stock.id, startingDateValue, endingDateValue, sheetType, path]);
      return generationPort;
  }

  static generateStockSheetIsolateProcess(List<dynamic> args) async{
      SendPort sendPort= args[0];
      sendPort.send("Preparing Generation");
      
      await AppController.initAppController(fromAnIsolate: true);
      await AppController.initApp();
      
      StockSheetService stockSheetService = StockSheetService();
      Stock stock = stockService.findById(args[1] as ObjectId)!;
      DateTime startingDate = getDateTimeFomFormattedString(args[2]);
      DateTime endingDate = getDateTimeFomFormattedString(args[3]);
      StockSheetType sheetType = StockSheetType.values[args[4]];
      
    switch (sheetType) {
      case StockSheetType.pdf:
        await stockSheetService.generatePdfStockSheet(stock: stock, startingDate: startingDate, endDate: endingDate, path: args[5]);
        break;
      case StockSheetType.excel:
        try{

        await stockSheetService.generateExcelStockSheet(stock: stock, startingDate: startingDate, endDate: endingDate, path: args[5]);
        sendPort.send("Done");
        } on Exception catch(e) {
          if(e is PathAccessException){
            sendPort.send("Access to file is denied");
          }else{
            sendPort.send("Error occured");
          }
        }
        break;
      default:
    }


      
      Isolate.exit(sendPort, "Terminated");
    
  }

  static DateTime getDateTimeFomFormattedString(String string){
    List<int> dateValues = string.split(".").map((value)=> int.parse(value)).toList();
    return DateTime(dateValues.last,dateValues[1], dateValues.first);
  }
  
  
}

class StockSheetData {
  final DateTime dateTime;
  final String reference;
  final double inputQuantity;
  final double outputQuantinty;
  final double quantityAfterMouvement;
  final String justification;
  late List<Object> arrayField;
  static List<String> headerRows =["Date", "Référence","Entrée","Sortie","Stock","Justification"];

  StockSheetData({required this.dateTime, required this.reference, required this.inputQuantity, required this.outputQuantinty, required this.quantityAfterMouvement, required this.justification}){
    arrayField =[
      dateFormater(date: dateTime),reference,inputQuantity,outputQuantinty, quantityAfterMouvement, justification
    ];
  }
}