import 'dart:async';
import 'package:personal_pjt/data/api/api_client.dart';
import 'package:personal_pjt/data/services/api_service.dart';
import 'package:personal_pjt/models/api_book.dart';
import 'package:personal_pjt/models/api_bookUser.dart';
import 'package:personal_pjt/models/models.dart';

class AuthService extends ApiService {
  AuthService({required ApiClient client}) : super(client: client);

//************************************ log-in *********************************//
  Future<Map<String, dynamic>> loginWithPassword(
      {Map<String, dynamic>? objToApi}) async {
    final ApiResponse<ApiSuccess> res = await client!.callJsonApi<ApiSuccess>(
        method: Method.POST,
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        path: '/user_management/customer/sign_in',
        body: objToApi);
    if (res.isSuccess) {
      return {'customer': res.data!.user};
    } else {
      throw res.error;
    }
  }

  /////////

  Future<ApiBook> bookShopApi(String token) async {
    final ApiResponse<ApiBook> res = await client!.callJsonApi<ApiBook>(
      method: Method.GET,
      headers: <String, String>{
        'Content-Type': 'application/json',
        "authorisation_token": token
      },
      path: '/books',
      queryParams: {"limit": 1, "offset": 1},
    );
    if (res.isSuccess) {
      return res.data!;
    } else {
      throw res.error;
    }
  }

  Future<ApiBookUser> loginBookPage(String? username, String? password) async {
    final ApiResponse<ApiBookUser> res = await client!.callJsonApi<ApiBookUser>(
        method: Method.POST,
        headers: <String, String>{'Content-Type': 'application/json'},
        path: '/authenticate',
        body: {"username": username, "password": password});
    if (res.isSuccess) {
      return res.data!;
    } else {
      throw res.error;
    }
  }
}
