import 'dart:convert';
import 'dart:io';
import 'package:ecommercer_app/app_constants.dart';
import 'package:ecommercer_app/data/api_exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class APIHelper {
  Future<dynamic> getAPI({required String url, Map<String, String>? mHeaders}) async {
    mHeaders ??= {};

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString(AppConstants.USER_TOKEN) ?? "";

    mHeaders["Authorization"] = "Bearer $token";

    try {
      http.Response res = await http.get(Uri.parse(url), headers: mHeaders);
      return returnResponse(res);
    } on SocketException catch (e) {
      throw NoInternetException(msg: e.toString());
    } catch (e) {
      throw FetchDataException(msg: e.toString());
    }
  }

  Future<dynamic> postAPI({
    required String url,
    Map<String, dynamic>? mBodyParams,
    Map<String, String>? mHeaders,
    bool isAuth = false,
  }) async {
    if (!isAuth) {
      mHeaders ??= {};

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString(AppConstants.USER_TOKEN) ?? "";

      mHeaders["Authorization"] = "Bearer $token";
    }

    try {
      http.Response res = await http.post(
        Uri.parse(url),
        body: mBodyParams != null ? jsonEncode(mBodyParams) : null,
        headers: mHeaders,
      );
      return returnResponse(res);
    } on SocketException catch (e) {
      throw NoInternetException(msg: e.toString());
    } catch (e) {
      throw FetchDataException(msg: e.toString());
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
          throw BadRequestException(msg: res.body.toString());
        }
      case 401:
      case 403:
        {
          throw UnauthorisedException(msg: res.body.toString());
        }
      case 404:
        {
          throw NotFoundException(msg: res.body.toString());
        }
      case 500:
        {
          throw ServerException(msg: res.body.toString());
        }
      default:
        {
          throw FetchDataException(msg: res.body.toString());
        }
    }
  }
}