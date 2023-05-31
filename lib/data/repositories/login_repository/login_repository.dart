import 'package:getx_mvvm/data/network/network_api_services.dart';

import '../../../res/app_url/app_url.dart';

class LoginRepository {
  final _apiServices = NetworkApiServices();
  Future<dynamic> loginApi(var data) async {
    dynamic response = await _apiServices.postApi(AppUrl.loginUrl, data);
    return response;
  }
}
