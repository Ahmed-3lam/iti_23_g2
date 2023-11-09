import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iti_23_g2/ecommerce/helper/api_url.dart';
import 'package:iti_23_g2/ecommerce/helper/dio_helper.dart';
import 'package:iti_23_g2/ecommerce/login/model/LoginModel.dart';
import 'package:iti_23_g2/ecommerce/main/main_screen.dart';
import 'package:iti_23_g2/note_app/hive_helper.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  DioHelper _dioHelper = DioHelper();
  LoginModel loginModel = LoginModel();

  void login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    try {
      final response = await _dioHelper.postData(
        path: ApiUrl.login,
        body: {
          "email": email,
          "password": password,
        },
      );
      loginModel = LoginModel.fromJson(response.data);
      if (loginModel.status == true) {
        HiveHelper.setToken(loginModel.data!.token!);
        DioHelper.headers["Authorization"] = loginModel.data?.token!;
        Get.offAll(MainScreen());
        emit(LoginSuccessState());
      } else {
        Get.snackbar("Error", loginModel.message ?? "",
            backgroundColor: Colors.red);
        emit(LoginErrorState());
      }
    } catch (e) {
      emit(LoginErrorState());
    }
  }
}
