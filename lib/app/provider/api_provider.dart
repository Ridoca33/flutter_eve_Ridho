import 'dart:async';

import 'package:get/get.dart';
import 'dart:convert';

class ApiProvider extends GetConnect {
  final String urldev = 'https://devmobileapi.gudangkripto.id';
  final String urlprod = 'https://mobileapi.gudangkripto.id';

  Future<dynamic> getData(String endpoint) async {
    try {
      final response = await get(urlprod + endpoint);
      if (response.status.hasError) {
        return Future.error(response.statusText.toString());
      } else {
        return response.bodyString;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // Future<dynamic> postData(String endpoint, String paramsjson) async {
  //   try {
  //     Map<String, dynamic> tmpdata = {
  //       "api": endpoint,
  //       "value": jsonDecode(paramsjson)
  //     };

  //     String encryptedParams =
  //         await EncryptionInfoImpl().encrypt(jsonEncode(tmpdata));

  //     final fixparams = {"data": jsonEncode(encryptedParams)};

  //     DebugLog.info(
  //       message: tmpdata.toString(),
  //     );

  //     final response = await post(urlprod, fixparams);
  //     // final response = await post(urlprod, fixparams).timeout(
  //     //   const Duration(seconds: 5),
  //     //   onTimeout: () => throw TimeoutException('TIMEOUT'),
  //     // );

  //     if (response.status.hasError) {
  //       var error = {"message": "error", "data": response.statusText};
  //       return jsonEncode(error);
  //     } else {
  //       return await EncryptionInfoImpl().decrypt(response.body);
  //     }
  //   } catch (e) {
  //     DebugLog.error(
  //       message: e.toString(),
  //     );
  //     Map<String, dynamic> error = {
  //       "message": 'error',
  //       "value": e.toString(),
  //     };
  //     return jsonEncode(error);
  //     // print(e.toString());
  //   }
  // }
}
