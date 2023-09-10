import 'package:flutter_app/common/entities/entities.dart';

import '../utils/http_util.dart';

class UserRepositry {
  static login({LoginRequestEntity? params, required LoginRequestEntity param}) async {
    var response =
        await HttpUtil().post('api/login', queryParams: params?.toJson());
  }
}
