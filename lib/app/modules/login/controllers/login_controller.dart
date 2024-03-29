import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:petugas_perpustakaan_app/app/data/constant/endpoint.dart';
import 'package:petugas_perpustakaan_app/app/data/provider/api_provider.dart';
import 'package:petugas_perpustakaan_app/app/data/provider/storage_provider.dart';
import 'package:petugas_perpustakaan_app/app/routes/app_pages.dart';

class LoginController extends GetxController {
  //TODO: Implement loginController
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    String status = StorageProvider.read(StorageKey.status);
    log("status : $status");
    if(status == "logged"){
      Get.offAllNamed(Routes.HOME);
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  final loadingLogin = false.obs;
  void login() async{
    loadingLogin(true);
    try {
      FocusScope.of(Get.context!).unfocus();
      formkey.currentState?.save();
      if (formkey.currentState!.validate()) {
        final response = await ApiProvider.instance().post(Endpoint.login,
            data: dio.FormData.fromMap(
                {
                  "username": usernameController.text.toString(),
                  "password": passwordController.text.toString()
                }));
        if (response.statusCode == 200) {
          await StorageProvider.write(StorageKey.status, "logged");
          Get.offAllNamed(Routes.HOME);
        } else {
          Get.snackbar("Sorry", "Login Gagal", backgroundColor: Colors.orange);
        }
      }
      loadingLogin(false);
    }on dio.DioException catch (e) {
      loadingLogin(false);
      Get.snackbar("Sorry", e.toString(), backgroundColor: Colors.red);
    }catch (e)   {
      loadingLogin(false);
      Get.snackbar("Error", e.toString(), backgroundColor:  Colors.red);
      throw Exception('$e');
      }
    }
  }

