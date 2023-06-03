import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/colors.dart/app_colors.dart';
import 'package:getx_mvvm/res/components/internet_exception_widget.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/utility/user_preferences/user_pref_controller.dart';
import 'package:getx_mvvm/view_models/controller/home/home_controller.dart';

import '../../data/response/status.dart';
import '../../model/home/user_list_model.dart';
import '../../res/components/general_exception_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeController = Get.put(HomeController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.userListApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Home"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                UserPreference().removeUser().then((value) {
                  Get.toNamed(RoutesName.login_screen);
                });
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: RefreshIndicator(
        color: AppColors.primaryColor,
        onRefresh: () async {
          homeController.userListApi();
        },
        child: Obx(() {
          print("error!!!!!!! ${homeController.error.value}");
          switch (homeController.requestStatus.value) {
            case Status.LOADING:
              return Center(child: CircularProgressIndicator());
            case Status.ERROR:
              if (homeController.error.value == "No internet") {
                print("if-----");
                return InternetExceptionWidget(onTap: () {
                  homeController.refreshUserApi();
                });
              } else {
                print("else-----");
                // return Center(child: Text(homeController.error.value));

                return GeneralExceptionWidget(onTap: () {
                  homeController.refreshUserApi();
                });
              }
            case Status.COMPLETED:
              return ListView.builder(
                  itemCount: homeController.userList?.value?.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    Datum? data = homeController.userList?.value?.data?[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage("${data?.avatar}"),
                      ),
                      title: Text("${data?.firstName}"),
                      subtitle: Text("${data?.email}"),
                    );
                  });

            default:
              return SizedBox();
          }
        }),
      ),
    );
  }
}
