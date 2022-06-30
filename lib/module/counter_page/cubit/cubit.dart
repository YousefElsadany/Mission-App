import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mission_app/module/CounterPage/Cubit/States.dart';

class CounterCubit extends Cubit<CounterStates> {
  CounterCubit() : super(CounterInitialState());
  static CounterCubit get(context) => BlocProvider.of(context);

  int counter = 1;
  void minus() {
    counter--;
    emit(CounterminusState());
  }

  void plus() {
    counter++;
    emit(CounterplusState());
  }
}
