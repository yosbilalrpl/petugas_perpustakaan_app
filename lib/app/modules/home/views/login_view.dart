import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:petugas_perpustakaan_app/app/modules/login/controllers/login_controller.dart';


class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginView'),
        centerTitle: true,
      ),
      body: Center(
        child: Form(
            key: controller.formkey,
            child: Column(
              children: [
                TextFormField(
                    controller: controller.usernameController,
                    decoration: InputDecoration(hintText: "Masukkan Username"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "username tidak boleh kosong";
                      }
                      return null;
                    }),
                TextFormField(
                    controller: controller.passwordController,
                    decoration: InputDecoration(hintText: "Masukkan Password"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password tidak boleh kosong";
                      }
                      return null;
                    }),
              Obx(() =>
                  controller.loadingLogin.value?
                      CircularProgressIndicator():
                  ElevatedButton(
                  onPressed: () {
                    controller.login;
                  },
                  child: Text("login"))),


              ],
            )),
      ),
    );
  }
}
