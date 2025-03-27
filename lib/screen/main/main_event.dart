part of 'main_bloc.dart';


abstract class MainEvent {}
 class MainCurrencyEvent extends MainEvent{}
 class MainCurrencyWithDayEvent extends MainEvent{
  final String day;
  MainCurrencyWithDayEvent({required this.day});
 }