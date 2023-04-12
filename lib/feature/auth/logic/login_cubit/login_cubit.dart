import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/core/api/api_end_pointes.dart';
import 'package:gallery_app/core/helper/shared_prefrences.dart';
import 'package:gallery_app/core/helper/toast_message.dart';
import 'package:http/http.dart';
import 'login_status.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(super.initialState);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  static LoginCubit getInstance(context) {
    return BlocProvider.of(context);
  }

  void loginMethod() async {
    String email = emailController.text.toString();
    String password = passwordController.text.toString();
    //print(emailController.value);
    await post(Uri.parse(ApiEndPoints.login), body: {
      "email": '$email',
      "password": "$password",
    }).then((response) {
      if (response.statusCode == 200 &&
          (!response.body.contains("error_message"))) {
        userLoginSuccessfully();
        emit(LoginStateSuccess());
        return;
      } else {
        showToastMessage(
          message: "Check Your Email",
          color: Colors.red,
        );
        emit(LoginStateFailed());
        return;
      }
    }).catchError((error) {
      showToastMessage(
        message: "Check Your Email",
        color: Colors.red,
      );
      emit(LoginStateFailed());
      return;
    });
  }

  void userLoginSuccessfully() {
    CacheHelper.setBool(key: CacheHelper.loginKey, value: true);
  }
}
