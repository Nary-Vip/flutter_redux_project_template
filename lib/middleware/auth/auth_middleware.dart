import 'dart:convert';
import "package:http/http.dart" as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:personal_pjt/actions/actions.dart';
import 'package:personal_pjt/connector/auth_connector.dart';
import 'package:personal_pjt/data/app_repository.dart';
import 'package:personal_pjt/data/services/auth/auth_service.dart';
import 'package:personal_pjt/models/api_book.dart';
import 'package:personal_pjt/models/api_bookUser.dart';
import 'package:personal_pjt/models/app_notes.dart';
import 'package:personal_pjt/models/app_todo.dart';
import 'package:personal_pjt/models/models.dart';
import 'package:redux/redux.dart';

class AuthMiddleware {
  AuthMiddleware({required this.repository})
      : authService = repository.getService<AuthService>() as AuthService;

  final AppRepository repository;
  final AuthService authService;

  List<Middleware<AppState>> createAuthMiddleware() {
    return <Middleware<AppState>>[
      TypedMiddleware<AppState, SetAddNotesAction>(addingUserNotes),
      //TypedMiddleware<AppState, LoggedInMail>(fetchingNotes),
      //TypedMiddleware<AppState, CheckForUserInPrefs>(checkForUserInPrefs),
      TypedMiddleware<AppState, BookLoggedInUser>(loginWithPassword),
      TypedMiddleware<AppState, LogOutUser>(logOutUser),
      //TypedMiddleware<AppState, SetFetchingNotes>(fetchNotes)

      // API section MiddleWares
      //TypedMiddleware<AppState, LoggedInMail>(fetchApi),
    ];
  }

  // void fetchApi(
  //     Store<AppState> store, LoggedInMail action, NextDispatcher next) async {
  //   if (action.email == "del") {
  //     final noteId = store.state.userNotesList!.noteId;
  //     final resp = await http.delete(
  //         Uri.parse("https://jsonplaceholder.typicode.com/todos/$noteId"));

  //     if (resp.statusCode == 200) {
  //       print("delete successful");
  //     }
  //   }

  //   final resp = await http.get(Uri.parse(
  //       "https://jsonplaceholder.typicode.com/todos/${action.email}"));
  //   if (resp.statusCode == 200) {
  //     print(resp.body);
  //     AppNotesJson? res = serializers.deserializeWith(
  //         AppNotesJson.serializer, json.decode(resp.body));
  //     print(res);
  //     print("Note Id ${action.email} fetched");
  //     store.dispatch(SaveDataToGlobalData(res!));
  //   }
  // }
  // void checkForUserInPrefs(Store<AppState> store, CheckForUserInPrefs action,
  //     NextDispatcher next) async {
  //   next(action);
  //   try {
  //     final AppUser? user = await repository.getUserFromPrefs();

  //     if (user != null) {
  //       store.dispatch(SetInitializer(false));
  //       store.dispatch(SaveUser(userDetails: user));
  //     } else {
  //       store.dispatch(SetInitializer(false));
  //       store.dispatch(SaveUser(userDetails: null));
  //     }
  //   } catch (e) {
  //     return;
  //   }
  // }

  // void fetchingNotes(
  //     Store<AppState> store, LoggedInMail action, NextDispatcher next) async {
  //   try {
  //     print("Fetching mail ${action.email}");
  //     store.dispatch(SetLoader(true));
  //     final CollectionReference _usersNotes =
  //         FirebaseFirestore.instance.collection("userNotes");

  //     final isUserExists = _usersNotes.doc(action.email);
  //     print("Accesing");
  //     print({isUserExists});
  //     //print(action.email);

  //     isUserExists.get().then(
  //       (DocumentSnapshot doc) {
  //         var temp = doc.data();
  //         //json.decode(doc.data().toString());
  //         print("------$temp");
  //         AppNotes? res =
  //             serializers.deserializeWith(AppNotes.serializer, temp);
  //         print("kuriyidu $res");
  //         //print(doc.data())

  //         // res = AppNotesBuilder().build()
  //         //   ..userMail = action.email
  //         //   ..userNotes = doc.data()['noteList'];
  //         //AppNotesBuilder().userMail = action.email;

  //         //AppNotesBuilder().userNotes =
  //         //res = doc.data() as AppNotes?;
  //         //AppNotes.serializer(res);
  //         //print(res);
  //         //store.dispatch(SaveDataToGlobalData(res!));
  //       },
  //       onError: (e) => print("Error Retirieving Data"),
  //     );
  //     store.dispatch(SetLoader(true));
  //   } catch (e) {}
  // }

  void addingUserNotes(Store<AppState> store, SetAddNotesAction action,
      NextDispatcher next) async {
    try {
      print("middleware ${action.email}");
      print(action.note);
      store.dispatch(SetLoader(true));
      final CollectionReference _usersNotes =
          FirebaseFirestore.instance.collection("userNotes");
      final isUserExists = _usersNotes.where("email", isEqualTo: action.email);
      final doc = await isUserExists.get();
      if (doc.docs.isEmpty) {
        final List<Map<String, dynamic>> noteList = [action.note];
        _usersNotes
            .doc(action.email)
            .set({"email": action.email, "noteList": noteList});
      } else {
        _usersNotes.doc(action.email).update({
          "noteList": FieldValue.arrayUnion([action.note])
        });
      }
    } catch (e) {}
  }

  // void loginWithPassword(Store<AppState> store, LoginWithPassword action,
  //     NextDispatcher next) async {
  //   try {
  //     //String registrationToken = '';
  //     store.dispatch(SetLoader(true));

  //     final instance = FirebaseAuth.instance;
  //     print(action.email);
  //     print(action.password);
  //     await instance.signInWithEmailAndPassword(
  //         email: action.email, password: action.password);
  //     action.onSuccess("success");
  //     //store.dispatch(SaveUser(userDetails: AppUser(action.email)));
  //     store.dispatch(SetIsLoginError(isLoginError: "ok"));
  //     store.dispatch(SetLoader(false));
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       print('No user found for that email.');

  //       store.dispatch(
  //           SetIsLoginError(isLoginError: "No user found for that email."));
  //       store.dispatch(SetLoader(false));
  //     } else if (e.code == 'wrong-password') {
  //       print('Wrong password provided for that user.');
  //       store.dispatch(SetIsLoginError(
  //           isLoginError: "Wrong password provided for that user."));
  //       store.dispatch(SetLoader(false));
  //     }

  // final Map<String, dynamic> objToApi = <String, dynamic>{
  //   'customer': <String, String>{
  //     'mobile': "9090902020",
  //     'password': "Password@123",
  //     'grant_type': 'password'
  //   }
  // };
  //final ApiSuccess response = await authService.jsonAPI();
  //print('-----${response.toString()');

  //final Map<String, dynamic> response =
  //await authService.loginWithPassword(objToApi: objToApi);
  //final AppUser user = response['customer'];
  // print("==========first==============${user.toString()}");
  // print(
  //     "=========second===================${response['customer'].toString()}");
  // if (user != null) {
  //   store.dispatch(SaveUser(userDetails: user));
  //   store.state.navigator.currentState!
  //       .push(MaterialPageRoute(builder: (context) => HomePage()));
  //   print(
  //       "=============in state =========${store.state.currentUser.toString()}");
  // }
  //     action.onError("error");
  //   } on ApiError catch (e) {
  //     debugPrint('============ login error block ========== ${e.toString()}');
  //     store.dispatch(SetLoader(false));
  //     //  globalErrorAlert(
  //     //      store.state.navigator.currentContext, e?.errorMessage, null);
  //     return;
  //   } catch (e) {
  //     store.dispatch(SetLoader(false));
  //     debugPrint('============ login catch block ========== ${e.toString()}');
  //   }

  //   next(action);
  // }

  void logOutUser(
      Store<AppState> store, LogOutUser action, NextDispatcher next) async {
    repository.setUserPrefs(appUser: null);
    store.dispatch(SaveUser(userDetails: null));
    //
    store.dispatch(SetIsLoginError(isLoginError: "none"));
    next(action);
  }

  // Books Application MiddleWares

  void fetchBook(
      Store<AppState> store, LogOutUser action, NextDispatcher next) async {
    store.dispatch(SetLoader(true));
    String? token = store.state.bookStoreLoggedInUser.token;
    final ApiBook response = await authService.bookShopApi(token!);
    store.dispatch(GetBookForTheUsers(response));
    store.dispatch(SetLoader(false));
    //print('-----${response.toString()');
  }

  void loginWithPassword(Store<AppState> store, BookLoggedInUser action,
      NextDispatcher next) async {
    store.dispatch(SetLoader(true));
    print("Login in process");
    final username = action.loggedInBookStoreUser.username;
    final password = action.loggedInBookStoreUser.password;
    final ApiBookUser response =
        await authService.loginBookPage(username, password);

    action.onSuccess("success");

    response.username = action.loggedInBookStoreUser.username;
    response.password = action.loggedInBookStoreUser.password;

    store
        .dispatch(BookLoggedInUser(response, action.onSuccess, action.onError));

    store.dispatch(SetLoader(false));
  }
}
