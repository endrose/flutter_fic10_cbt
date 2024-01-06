import 'package:bloc/bloc.dart';
import 'package:fic10_cbt/data/datasources/auth_remote_datasource.dart';
import 'package:fic10_cbt/data/models/request/register_request_model.dart';
import 'package:fic10_cbt/data/models/responses/auth_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_event.dart';
part 'register_state.dart';
part 'register_bloc.freezed.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const _Initial()) {
    // on<RegisterEvent>((event, emit) {
    //   // TODO: implement event handler
    //   emit(const _Loading());
    //   // resposne  remote source
    //   final response = await AuthRemoteDataSource().register(event.data);
    // });

    on<_Register>((event, emit) async {
      emit(const _Loading());
      //request remote source
      final response = await AuthRemoteDataSource().register(event.data);

      print({'blog': response});
      response.fold((l) => emit(_Error(l)), (r) => emit(_Success(r)));
    });
  }
}
