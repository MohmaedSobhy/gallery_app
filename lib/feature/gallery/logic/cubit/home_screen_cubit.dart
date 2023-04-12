import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gallery_app/core/helper/shared_prefrences.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/core/api/api_end_pointes.dart';
import 'package:gallery_app/feature/gallery/logic/cubit/home_screen_state.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/helper/toast_message.dart';
import '../../../../core/localization/app_string.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(InitialState());
  List<String> gallery = [];
  final _picker = ImagePicker();

  static HomeScreenCubit getInstance(context) {
    return BlocProvider.of(context);
  }

  void loadGallery() async {
    await http.get(Uri.parse(ApiEndPoints.allImages), headers: {
      'Authorization': ApiEndPoints.token,
    }).then((value) {
      if (value.statusCode == 200) {
        Map<String, dynamic> jsonData = jsonDecode(value.body);
        for (String imageUrl in jsonData['data']['images']) {
          if (imageUrl.contains("jpeg") || imageUrl.contains("png")) {
            gallery.add(imageUrl);
          }
        }
        emit(LoadingGallerySuccess());
      } else {
        emit(LoadImageFailedState());
      }
    }).catchError((error) {
      emit(LoadingGalleryFailed());
    });
  }

  void logout() {
    CacheHelper.setBool(key: CacheHelper.loginKey, value: false);
    emit(LogoutState());
  }

  void uploadImageFromGallery() async {
    // ignore: deprecated_member_use
    final pickedFile = await _picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _uploadImage(File(pickedFile.path));
    }
  }

  void uploadImageFromCamera() async {
    // ignore: deprecated_member_use
    final pickedFile = await _picker.getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      _uploadImage(File(pickedFile.path));
    }
  }

  void _uploadImage(File image) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(ApiEndPoints.uploadImage),
    );
    request.headers.addAll(
      {
        'Authorization': ApiEndPoints.token,
      },
    );
    request.files.add(await http.MultipartFile.fromPath('img', image.path));
    var response = await request.send();
    if (response.statusCode == 200) {
      showToastMessage(
        message: AppString.imageLoadedsuccess,
        color: Colors.green,
      );
      emit(LoadImagesSuccessState());
    } else {
      showToastMessage(
        message: AppString.failedtoloadImage,
        color: Colors.red,
      );
      emit(LoadImageFailedState());
    }
  }
}
