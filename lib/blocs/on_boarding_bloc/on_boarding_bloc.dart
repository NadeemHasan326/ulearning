
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'on_boarding_event.dart';
import 'on_boarding_state.dart';

class OnBoardingBloc extends Bloc<OnBoardingEvent,OnBoardingState>{
  int sliderIndex = 0;
  OnBoardingBloc():super(InitState()){
    on<InitEvent>((event, emit) {
    });
  }

}