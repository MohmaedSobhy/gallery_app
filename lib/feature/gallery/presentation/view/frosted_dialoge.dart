import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/feature/gallery/logic/cubit/home_screen_cubit.dart';
import 'package:gallery_app/feature/gallery/logic/cubit/home_screen_state.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/localization/app_string.dart';
import '../../../../core/widgets/frosted_glass_widget.dart';
import '../widgets/custom_button.dart';

class FroastedDialogeView extends StatelessWidget {
  const FroastedDialogeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeScreenCubit, HomeScreenState>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeScreenCubit homeScreenCubit = HomeScreenCubit.getInstance(context);
        return ForestedGlassWidget(
          width: MediaQuery.of(context).size.width - 150,
          height: 220,
          childWidget: Column(
            children: [
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: CustomeButton(
                  function: () {
                    homeScreenCubit.uploadImageFromGallery();
                  },
                  backgroundColor: Colors.white,
                  imagePath: "assets/gallery.png",
                  imageWidth: 7,
                  imageHeight: 4,
                  txt: AppString.gallery,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
                child: CustomeButton(
                  function: () {
                    homeScreenCubit.uploadImageFromCamera();
                  },
                  imageWidth: 4,
                  imageHeight: 5,
                  backgroundColor: Colors.white,
                  imagePath: "assets/camera.png",
                  txt: AppString.camera,
                ),
              ),
              const Spacer(),
            ],
          ),
        );
      },
    );
  }
}
