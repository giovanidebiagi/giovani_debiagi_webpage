import 'package:dartz/dartz.dart';
import '../../../../core/errors/exceptions/i_exception.dart';
import '../../domain/entities/flutter_project.dart';

abstract class IFlutterProjectsDataLocalDatasource {
  Future<List<FlutterProject>> getFlutterProjects();
}
