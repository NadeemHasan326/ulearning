
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_and_sign_up_event.dart';
import 'login_and_sign_up_state.dart';


class LoginAndSignUpBloc extends Bloc<LoginAndSignUpEvent,LoginAndSignUpState>{
  LoginAndSignUpBloc():super(InitState()){
    on<InitEvent>((event, emit) {
    });
  }

}