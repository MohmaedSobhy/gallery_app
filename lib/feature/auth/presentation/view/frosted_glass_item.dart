import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/feature/auth/logic/login_cubit/login_cubit.dart';
import 'package:gallery_app/feature/auth/logic/login_cubit/login_status.dart';
import 'package:gallery_app/feature/gallery/presentation/screen/home_screen.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/localization/app_string.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/frosted_glass_widget.dart';

class FrosetGlassItem extends StatelessWidget {
  const FrosetGlassItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(InitialState()),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginStateSuccess) {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) {
                return const HomeScreen();
              }),
              (route) => false,
            );
          }
        },
        builder: (context, state) {
          LoginCubit loginCubit = LoginCubit.getInstance(context);
          return Form(
            key: loginCubit.formkey,
            child: Column(
              children: [
                ForestedGlassWidget(
                  width: MediaQuery.of(context).size.width - 22.w,
                  height: 45.h,
                  childWidget: Column(
                    children: [
                      SizedBox(
                        height: 3.h,
                      ),
                      Text(
                        AppString.login,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: CustomeTextFormField(
                          controller: loginCubit.emailController,
                          hint: AppString.userName,
                          inputType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value.toString().isEmpty) {
                              return "Enter Email";
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: CustomeTextFormField(
                          controller: loginCubit.passwordController,
                          hint: AppString.password,
                          obscure: true,
                          validator: (value) {
                            if (value.toString().isEmpty) {
                              return "Enter password";
                            }
                            return null;
                          },
                          inputType: TextInputType.emailAddress,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.w),
                        child: MaterialButton(
                          onPressed: () {
                            if (loginCubit.formkey.currentState!.validate()) {
                              loginCubit.loginMethod();
                            }
                          },
                          minWidth: double.infinity,
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            AppString.submit,
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
