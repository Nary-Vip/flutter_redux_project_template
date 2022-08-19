import 'package:flutter/material.dart';
import 'package:spotify/data/app_repository.dart';

class AppRepositoryProvider extends InheritedWidget {
  const AppRepositoryProvider(
      {Key? key, required this.repository, required Widget child})
      : assert(repository != null && child != null),
        super(key: key, child: child);

  final AppRepository repository;

  @override
  bool updateShouldNotify(AppRepositoryProvider oldWidget) {
    return oldWidget.repository != repository;
  }
}
