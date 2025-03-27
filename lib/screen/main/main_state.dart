part of 'main_bloc.dart';

class MainState {
  Status? status;
  List<CurrencyModel> list;

  MainState({required this.status, required this.list});
  MainState copyWith({Status? status, List<CurrencyModel>? list}) =>
      MainState(status: status ?? this.status, list: list ?? this.list);
}
enum Status { initial, loading, success, fail, error, none }
