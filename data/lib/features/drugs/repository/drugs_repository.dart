import 'package:data/features/drugs/mapper/drug_model_to_entity.dart';
import 'package:data/features/drugs/model/drug_model.dart';
import 'package:data/features/drugs/request/create_reminder_request.dart';
import 'package:data/features/drugs/request/get_drugs_request.dart';
import 'package:data/network/i_base_api.dart';
import 'package:domain/common/network/exceptions/network_exception.dart';
import 'package:domain/common/network/response.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/drugs/entity/drug_entity.dart';
import 'package:domain/features/drugs/repository/i_drugs_repository.dart';

class DrugsRepository implements IDrugsRepository{
  final IAPIService _service;

  DrugsRepository(this._service);

  @override
  Future<Result<List<DrugEntity>, NetworkException>> getDrugs() async{
    var result = await _service.fetchData<List<DrugModel>>(
      GetDrugsRequest(),
      data: DrugsModel(),
    );
    switch (result) {
      case Success(data: final data):
        return Success(data.data?.map((e) => e.toEntity()).toList() ?? []);
      case Failure(exception: final exception):
        return Failure(exception);
    }
  }

  @override
  Future<Result<Response<bool>, NetworkException>> addReminder(int drugId, int duration) async{
    var result = await _service.fetchData(CreateReminderRequest(drugId: drugId, duration: duration));
    switch(result){
      case Success(data:final data):
        return Success(Response<bool>(data: true,success: true,statusCode: 200));
      case Failure(exception:final exception):
        return Failure(exception);
    }
  }
}