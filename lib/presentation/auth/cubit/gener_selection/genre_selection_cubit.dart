import 'package:bloc/bloc.dart';

class GenreSelectionCubit extends Cubit<int> {
  GenreSelectionCubit() : super(0);

  int index = 0;
  void changeGener(int value) {
    index = value;
    emit(index);
  }
}
