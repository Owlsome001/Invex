import 'package:sim/models/models.dart';
import 'package:sim/repositories/measurement_unit_repository.dart';

class MeasurementUnitService {
  final MeasurementUnitRepository _measurementUnitRepository = MeasurementUnitRepository();

  List<MeasurementUnit> get allMeasurementUnits{
    return _measurementUnitRepository.findAll().toList();
  }
}