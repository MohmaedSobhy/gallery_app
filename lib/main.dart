import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/core/helper/shared_prefrences.dart';
import 'package:gallery_app/feature/auth/presentation/screens/login_screen.dart';

import 'package:gallery_app/feature/gallery/presentation/screen/home_screen.dart';

import 'package:sizer/sizer.dart';

import 'feature/gallery/logic/cubit/home_screen_cubit.dart';

bool userLoginBefore = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  userLoginBefore = await CacheHelper.getBool(key: CacheHelper.loginKey);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return BlocProvider(
          create: (context) => HomeScreenCubit(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: (userLoginBefore) ? const HomeScreen() : const LoginScreen(),
          ),
        );
      },
    );
  }
}
