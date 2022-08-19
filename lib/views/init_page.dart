import 'package:spotify/connector/auth_connector.dart';
import 'package:spotify/views/home/HomeScreen.dart';
import 'package:spotify/views/loader/app_loader.dart';
import 'package:spotify/views/auth/login_page.dart';
import 'package:flutter/material.dart';

class InitPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AuthConnector(
      builder: (BuildContext c, AuthViewModel model) {
        if (model.isInitializing) {
          return AppLoader();
        }

        return model.currentUser != null
            ? LoginPage()
            : HomeScreen(model: model);
      },
    );
  }
}
