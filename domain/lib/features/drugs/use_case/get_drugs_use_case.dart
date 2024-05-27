import 'package:domain/common/network/exceptions/network_exception.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/drugs/entity/drug_entity.dart';
import 'package:domain/features/drugs/repository/i_drugs_repository.dart';

class GetDrugsUseCase {
  final IDrugsRepository _repository;

  GetDrugsUseCase(this._repository);

  Future<Result<List<DrugEntity>, NetworkException>> call() async {
    return await _repository.getDrugs();
  }

}
