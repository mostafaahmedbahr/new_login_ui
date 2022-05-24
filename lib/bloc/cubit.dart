import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_intership/bloc/states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool isVisible = true;

  int currentIndex =0;
  List<bool> buttonIsSelected = [true, false];

  void changeSuffixIcon() {
    isVisible = !isVisible;
    emit(ChangeSuffixIconState());
  }
  // void toggleButton(int newIndex) {
  //   buttonIsSelected[currentIndex]=!buttonIsSelected[currentIndex];
  //   emit(ToggleButtonState());
  // }
}
