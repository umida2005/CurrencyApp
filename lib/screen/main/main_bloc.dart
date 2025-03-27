import 'package:bloc/bloc.dart';
import 'package:valyuta_app/data/remote/request/currency_request.dart';
import 'package:valyuta_app/domain/repo/my_repo.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final repo=MyRepository();
  MainBloc() : super(MainState(status: Status.initial, list: [])) {
    on<MainCurrencyEvent>((event, emit) async {
      emit(state.copyWith(status: Status.loading));
      var result = await repo.getCurrency();
      emit(state.copyWith(status: Status.success,list: result));

    });
    on<MainCurrencyWithDayEvent>((event, emit) async {
      emit(state.copyWith(status: Status.loading));
      var result = await repo.getCurrencyWithDay(event.day);
      emit(state.copyWith(status: Status.success,list: result));
    });
  }
}
