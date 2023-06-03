import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/data/repositories/home_repository.dart/home_repository.dart';
import 'package:getx_mvvm/model/home/user_list_model.dart';

import '../../../data/response/status.dart';

class HomeController extends GetxController {
  final _homeRepository = HomeRepository();
  final requestStatus = Status.LOADING.obs;
  final userList = UserListModel().obs;
  RxString error = "".obs;
  void setrequestStatus(Status _status) => requestStatus.value = _status;
  void setUserList(UserListModel _status) => userList.value = _status;
  void setError(String _status) => error.value = _status;

  void userListApi() {
    _homeRepository.userListApi().then((value) {
      setrequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace) {
      setrequestStatus(Status.ERROR);
      setError(error.toString());
      print("error while calling userList api ----${error.toString()}");

      debugPrint(error.toString());
    });
  }
//refresh api

  void refreshUserApi() {
    setrequestStatus(Status.LOADING);

    _homeRepository.userListApi().then((value) {
      setrequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace) {
      setrequestStatus(Status.ERROR);
      setError(error.toString());
      print("error while calling userList api ----${error.toString()}");

      debugPrint(error.toString());
    });
  }
}
