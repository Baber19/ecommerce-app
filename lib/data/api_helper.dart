import 'dart:convert';
import 'dart:io';
import 'package:ecommercer_app/app_constants.dart';
import 'package:ecommercer_app/data/api_exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiHelper {
  getApi({required String url}) async {
    try {
      http.Response res = await http.get(Uri.parse(url));
      return returnResponse(res);
    } on SocketException catch (e) {
      throw NoInternetException(exceptionMsg: e.toString());
    } catch (e) {
      throw FetchDataException(exceptionMsg: e.toString());
    }
  }

  Future<dynamic> postApi({
    required String url,
    Map<String, dynamic>? mBodyParameters,
    Map<String, String>? mHeaders,
    bool isAuth=false

  }) async {
    if(!isAuth){
      mHeaders??={};
      SharedPreferences prefs = await SharedPreferences.getInstance();
     String token = prefs.getString(AppConstants.USER_TOKEN) ?? "";
     mHeaders["Authorization"] = "Bearer $token";


    }
    try {
      http.Response res = await http.post(
        Uri.parse(url),
        body: mBodyParameters != null ? jsonEncode(mBodyParameters) : null,
        headers: mHeaders


      );
      return returnResponse(res);
    } on SocketException catch (e) {
      throw NoInternetException(exceptionMsg: e.toString());
    } catch (e) {
      throw FetchDataException(exceptionMsg: e.toString());
    }
  }

  dynamic returnResponse(http.Response res) {
    switch (res.statusCode) {
      case 200:
        {
          dynamic data = jsonDecode(res.body);
          return data;
        }

      case 400:
        {
          throw BadRequestException(exceptionMsg: res.body.toString());
        }
      case 401:
      case 403:
        {
          throw UnauthorizedException(exceptionMsg: res.body.toString());
        }

      case 500:
        {
          throw ServerException(exceptionMsg: res.body.toString());
        }
      default:
        {
          throw FetchDataException(exceptionMsg: res.body.toString());
        }
    }
  }
}
