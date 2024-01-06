import 'package:bloc/bloc.dart';
import 'package:fic10_cbt/data/datasources/auth_remote_datasource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'logout_event.dart';
part 'logout_state.dart';
part 'logout_bloc.freezed.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  LogoutBloc() : super(const _Initial()) {
    on<LogoutEvent>((event, emit) async {
      // TODO: implement event handler
      emit(const _Loading());
      final response = await AuthRemoteDataSource().logout();
      response.fold((l) => emit(_Error(l)), (r) => emit(const _Success()));
    });
  }
}
