import 'package:data/common/response_entity_mapper.dart';
import 'package:data/features/reminder/mapper/add_reminder_model_mapper.dart';
import 'package:data/features/reminder/mapper/reminder_model_to_entity_mapper.dart';
import 'package:data/features/reminder/mapper/update_reminder_model_mapper.dart';
import 'package:data/features/reminder/model/reminder_model.dart';
import 'package:data/features/reminder/model/reminders_model.dart';
import 'package:data/features/reminder/request/create_reminder_request.dart';
import 'package:data/features/reminder/request/delete_reminder_request.dart';
import 'package:data/features/reminder/request/get_reminders_request.dart';
import 'package:data/features/reminder/request/update_reminder_request.dart';
import 'package:data/network/i_base_api.dart';
import 'package:domain/common/network/exceptions/network_exception.dart';
import 'package:domain/common/network/response.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/product/entity/add_reminder_entity.dart';
import 'package:domain/features/reminder/entity/reminder_entity.dart';
import 'package:domain/features/reminder/entity/update_reminder_entity.dart';
import 'package:domain/features/reminder/repository/i_reminder_repository.dart';

class ReminderRepository implements IReminderRepository{
  final IAPIService _service;

  ReminderRepository(this._service);

  @override
  Future<Result<Response<ReminderEntity>, NetworkException>> addReminder(AddReminderEntity reminder) async{
    var requestDate = reminder.toModel.toJson();
    var result = await _service.fetchData<ReminderModel>(CreateReminderRequest(data: requestDate),data: ReminderModel());
    switch(result){
      case Success(data:final data):
        return Success(data.toEntity(data.data.toEntity()));
      case Failure(exception:final exception):
        return Failure(exception);
    }
  }

  @override
  Future<Result<List<ReminderEntity>, NetworkException>> getReminders() async {
    var result = await _service.fetchData<List<ReminderModel>>(GetRemindersRequest(),data: RemindersModel());
    switch(result){
      case Success(data:final data):
        return Success(data.data?.map((e) => e.toEntity()).toList() ?? []);
      case Failure(exception:final exception):
        return Failure(exception);
    }
  }

  @override
  Future<Result<Response<ReminderEntity>, NetworkException>> updateReminder(UpdateReminderEntity reminder) async{
    var requestDate = reminder.toModel.toJson();
    var request = UpdateReminderRequest(data: requestDate);
    var result = await _service.fetchData<ReminderModel>(request,data: ReminderModel());
    switch(result){
      case Success(data:final data):
        return Success(data.toEntity(data.data.toEntity()));
      case Failure(exception:final exception):
        return Failure(exception);
    }
  }

  @override
  Future<Result<Response<bool>, NetworkException>> deleteReminder(UpdateReminderEntity reminder) async{
    var requestDate = reminder.toModel.toJson();
    var request = DeleteReminderRequest(data: requestDate);
    var result = await _service.fetchData<bool>(request);
    switch(result){
      case Success(data:final data):
        return Success(data.toEntity(data.data ?? false));
      case Failure(exception:final exception):
        return Failure(exception);
    }
  }
}