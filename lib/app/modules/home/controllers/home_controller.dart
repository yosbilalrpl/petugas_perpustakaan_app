import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petugas_perpustakaan_app/app/model/response_book.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/provider/api_provider.dart';
import '../../../data/provider/storage_provider.dart';
import '../../../routes/app_pages.dart';

class HomeController extends GetxController with StateMixin<List<DataBook>>{


  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    String status = StorageProvider.read(StorageKey.status);
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
  final loadingLogin = false.obs;
  obx(ListView Function(dynamic state) param0) {}


}
