import 'dart:async';
import 'package:built_collection/built_collection.dart';
import 'package:personal_pjt/data/api/api_client.dart';
import 'package:personal_pjt/data/services/api_service.dart';
import 'package:personal_pjt/models/api_book.dart';
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

  Future<BookInfo> bookShopApi(String token) async {
    final ApiResponse<BookInfo> res = await client!.callJsonApi<BookInfo>(
      method: Method.GET,
      headers: <String, String>{
        'Content-Type': 'application/json',
        "Authorization": "Bearer $token"
      },
      path: '/books',
    );
    if (res.isSuccess) {
      return res.data!;
    } else {
      throw res.error;
    }
  }

  Future<Map<String, dynamic>> loginBookPage(
      String? username, String? password) async {
    final ApiResponse<ApiSuccess> res = await client!.callJsonApi<ApiSuccess>(
        method: Method.POST,
        headers: <String, String>{'Content-Type': 'application/json'},
        path: '/authenticate',
        body: {"username": username, "password": password});
    if (res.isSuccess) {
      return {"token": res.data!.token};
    } else {
      //throw res.error;
      return {"token": "failed"};
    }
  }

  void deleteBook(int? bookId, String? token) async {
    final ApiResponse<ApiSuccess> res = await client!.callJsonApi<ApiSuccess>(
        method: Method.DELETE,
        headers: <String, String>{
          'Content-Type': 'application/json',
          "Authorization": "Bearer $token"
        },
        path: '/books/$bookId');
  }

  Future<BookList> pushBookService(int? age, String? bookTitle,
      String? authorName, String? authorLastName, String? token) async {
    final ApiResponse<BookList> res = await client!.callJsonApi<BookList>(
        method: Method.POST,
        headers: <String, String>{
          'Content-Type': 'application/json',
          "Authorization": "Bearer $token"
        },
        path: '/books',
        body: {
          "book": {"title": bookTitle},
          "author": {
            "first_name": authorName,
            "last_name": authorLastName,
            "age": age
          }
        });
    if (res.isSuccess) {
      return res.data!;
    } else {
      throw res.error;
    }
  }
}
