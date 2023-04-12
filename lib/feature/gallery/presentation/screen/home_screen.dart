import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/core/localization/app_string.dart';
import 'package:gallery_app/feature/auth/presentation/screens/login_screen.dart';
import 'package:gallery_app/feature/gallery/logic/cubit/home_screen_cubit.dart';
import 'package:gallery_app/feature/gallery/logic/cubit/home_screen_state.dart';
import 'package:gallery_app/feature/gallery/presentation/view/frosted_dialoge.dart';
import 'package:gallery_app/feature/gallery/presentation/widgets/custom_button.dart';
import 'package:gallery_app/feature/gallery/presentation/view/custome_app_bar.dart';
import 'package:sizer/sizer.dart';

import '../widgets/image_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeScreenCubit homeScreenCubit = HomeScreenCubit.getInstance(context);
    return BlocConsumer<HomeScreenCubit, HomeScreenState>(
      listener: (context, state) {
        bool canPop = ModalRoute.of(context)?.canPop ?? false;
        if (state is LogoutState) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const LoginScreen()),
            (route) => false,
          );
        }
        if (state is LoadImagesSuccessState && canPop) {
          Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
        if (state is InitialState) {
          homeScreenCubit.loadGallery();
        }
        return Scaffold(
          body: SafeArea(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(221, 205, 255, 1),
                    Color.fromRGBO(255, 218, 218, 1),
                    Color.fromRGBO(234, 148, 215, 1)
                  ],
                ),
              ),
              child: Column(
                children: [
                  const CustomeAppBar(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomeButton(
                        function: () {
                          homeScreenCubit.logout();
                        },
                        imageHeight: 4,
                        backgroundColor: Colors.white,
                        imagePath: "assets/logout.png",
                        txt: AppString.logout,
                      ),
                      CustomeButton(
                        function: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const Center(child: FroastedDialogeView());
                            },
                          );
                        },
                        backgroundColor: Colors.white,
                        imagePath: "assets/upload.png",
                        txt: AppString.upload,
                        imageHeight: 4,
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 3.5.w, vertical: 3.h),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 1,
                        ),
                        itemCount:
                            HomeScreenCubit.getInstance(context).gallery.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ImageCard(
                              imageUrl: HomeScreenCubit.getInstance(context)
                                  .gallery[index],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
