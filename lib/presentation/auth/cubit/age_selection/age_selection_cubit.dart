import 'package:bloc/bloc.dart';

class AgeSelectionCubit extends Cubit<String> {
  AgeSelectionCubit() : super("Age Ranges");

  int ageSelected = 0;
  void changeAge(int age) {
    ageSelected = age;
    emit("$ageSelected");
  }
}
