import 'package:domain/common/network/exceptions/network_exception.dart';
import 'package:domain/common/network/response.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/drugs/entity/drug_entity.dart';

abstract interface class IDrugsRepository {
  Future<Result<List<DrugEntity>, NetworkException>> getDrugs();

  Future<Result<Response<bool>, NetworkException>> addReminder(
    int drugId,
    int duration,
  );
}
