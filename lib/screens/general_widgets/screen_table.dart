import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:sim/screens/utils/row_action.dart';

class ScreenTable extends StatefulWidget {
  const ScreenTable({super.key, required this.tableRows, required this.headers, required this.tableTitleWiget, this.actions});
  final List<Map<String, dynamic>> tableRows;
  final List<String> headers;
  final Widget tableTitleWiget;
  final List<RowAction>? actions;

  @override
  State<ScreenTable> createState() => _ScreenTableState();
}

class _ScreenTableState extends State<ScreenTable> {

  late Offset _tapPosition;

   @override
  void initState() {
    super.initState();
    _tapPosition = const Offset(0.0, 0.0);
  }
  @override
  Widget build(BuildContext context) {
      return Column(
        children: [
          //Table title
                Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))
                  ),
                  child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 7,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: widget.tableTitleWiget,
                            ),
                          ),
                          const Expanded(
                            flex: 3,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    child: Icon(
                                      size: 20,
                                      BootstrapIcons.funnel,
                                    ),
                                  ),
                                  Text("Filtrer"),
                                  
                                ],
                              ),
                            ),
                          )
                      ]),
                ),
          Expanded(
            child: SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child: Builder(
                  builder: (context) {
                    if(widget.tableRows.isNotEmpty) {
                      return DataTable(
                      sortColumnIndex: 0,
                      // headingRowColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.background),
                      columns: widget.actions!=null? [
                        ... List.generate(widget.headers.length, (index) => DataColumn(label: Text(widget.headers[index]))),
                        const DataColumn(label: Text(""))
                        ]:List.generate(widget.headers.length, (index) => DataColumn(label: Text(widget.headers[index]))), 
                      rows: List.generate(widget.tableRows.length, (rowIndex) => 
                      DataRow(
                        // onTap: (){
                        //   debugPrint("Clicked");
                        // },
                        cells: widget.actions!=null? [... List.generate(widget.tableRows[rowIndex].values.toList().length, (cellIndex) => 
                      DataCell(
                        Text(widget.tableRows[rowIndex].values.toList()[cellIndex]),
                        )),
                      DataCell(
                          widget.actions!.where((action) => action.toDisplay(selectedIndex:rowIndex)==true).isNotEmpty?GestureDetector(
                            child: const Icon(BootstrapIcons.three_dots_vertical),
                            onTapDown: (TapDownDetails details) async {
                              _storePosition(details);
                              await showMenu(
                                surfaceTintColor: Theme.of(context).colorScheme.surface,
                                context: context, 
                                position:  RelativeRect.fromLTRB(_tapPosition.dx,
                                            _tapPosition.dy,
                                            MediaQuery.of(context).size.width - _tapPosition.dx,
                                            MediaQuery.of(context).size.height - _tapPosition.dy// Bigger rect, the entire screen
                                  ), 
                                items: [
                                  ... widget.actions!
                                  .where((action) => action.toDisplay(selectedIndex: rowIndex)==true)
                                  .map((action) => 
                                  PopupMenuItem(
                                     onTap: ()=>action.onTap(selectedIndex: rowIndex) ,
                                    child: Row(
                                    crossAxisAlignment : CrossAxisAlignment.center,
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 5),
                                        child: Icon(
                                          action.iconData,
                                          size: 15,),
                                      ) , 
                                      Text(action.commandName)],))
                                  )
                    
                                ]);
                            },
                          ): const Text("")
                        )
                        ]:List.generate(widget.tableRows[rowIndex].values.toList().length, (cellIndex) => 
                      DataCell(
                        Text(widget.tableRows[rowIndex].values.toList()[cellIndex]),
                        )),
                        
                        )
                        
                        ) );
                    }

                    return const Center(child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 30),
                      child: Text("Aucun élement n'est encore enregister"),
                    ),);
                  }
                ),
              ),
            ),
          ),

          //  DataTable2(
          // columnSpacing: 12,
          // horizontalMargin: 12,
          // minWidth: 600,
          // columns: [
          //   DataColumn2(
          //     label: Text('Column A'),
          //     size: ColumnSize.L,
          //   ),
          //   DataColumn(
          //     label: Text('Column B'),
          //   ),
          //   DataColumn(
          //     label: Text('Column C'),
          //   ),
          //   DataColumn(
          //     label: Text('Column D'),
          //   ),
          //   DataColumn(
          //     label: Text('Column NUMBERS'),
          //     numeric: true,
          //   ),
          // ],
          // rows: List<DataRow>.generate(
          //     100,
          //     (index) => DataRow(cells: [
          //           DataCell(Text('A' * (10 - index % 10))),
          //           DataCell(Text('B' * (10 - (index + 5) % 10))),
          //           DataCell(Text('C' * (15 - (index + 5) % 10))),
          //           DataCell(Text('D' * (15 - (index + 10) % 10))),
          //           DataCell(Text(((index + 0.1) * 25.4).toString()))
          //         ]))),
        ],
      );
    // List<TableRow> tableBody=[
    //   TableRow(
    //     decoration: BoxDecoration(
    //                               border: Border(bottom: BorderSide(
    //                                 color: Theme.of(context).colorScheme.primary.withOpacity(0.2)
    //                               ))
    //                             ),
    //                             children: List.generate(headers.length, (index) => ScreenTableCell(value: headers[index], rowIndex: index,))
                                
    //   )
    // ];
    // tableBody.addAll(Iterable.generate(tableRows.length, (index){
    //     return TableRow(
    //           decoration: BoxDecoration(
    //                               border: Border(bottom: BorderSide(
    //                                 color: Theme.of(context).colorScheme.primary.withOpacity(0.2)
    //                               ))
    //                             ),
    //                             children: List.generate(tableRows[index].values.toList().length, (cellValueIndex) 
    //                             => ScreenTableCell(value: tableRows[index].values.toList()[cellValueIndex], rowIndex: cellValueIndex))
    //     );
    // })); 

    // return  Padding(
    //           padding: const EdgeInsets.symmetric(vertical: 10),
    //           child: Column(
    //             children: [
    //               Container(
    //                 padding: const EdgeInsets.symmetric(vertical: 10),
    //                 decoration:  BoxDecoration(
    //                   color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
    //                   borderRadius: const BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5))
    //                 ),

    //                 //Table title
    //                 child: Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: [
    //                     Expanded(
    //                       flex: 7,
    //                       child: Padding(
    //                         padding: const EdgeInsets.symmetric(horizontal: 20),
    //                         child: tableTitleWiget,
    //                       ),
    //                     ),
    //                     const Expanded(
    //                       flex: 3,
    //                       child: Padding(
    //                         padding: EdgeInsets.symmetric(horizontal: 20),
    //                         child: Row(
    //                           children: [
    //                             Padding(
    //                               padding: EdgeInsets.symmetric(horizontal: 10),
    //                               child: Icon(
    //                                 size: 20,
    //                                 BootstrapIcons.funnel,
    //                               ),
    //                             ),
    //                             Text("Filtrer"),
                                
    //                           ],
    //                         ),
    //                       ),
    //                     )
    //                 ]),
    //               ),
    //               Table(
    //                         children: tableBody
    //                     ),
    //             ],
    //           ),
    //         );
  }

   void _storePosition(TapDownDetails details) {
    setState(() {
      _tapPosition = details.globalPosition;
    }); 
  }
}