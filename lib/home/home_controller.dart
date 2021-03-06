import 'package:devquiz/home/home_repository.dart';
import 'package:flutter/foundation.dart';

import 'package:devquiz/home/home_state.dart';
import 'package:devquiz/shared/models/quiz_model.dart';
import 'package:devquiz/shared/models/user_model.dart';
import 'package:flutter/material.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;

  final repository = HomeRespository();

  void getUser() async {
    state = HomeState.loading;

    user = await repository.getUser();
    state = HomeState.success;
  }

  void getQuizzes() async {
    state = HomeState.loading;

    quizzes = await repository.getUQuizzes();
    state = HomeState.success;
  }
}
