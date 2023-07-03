import 'package:clean_dart_github_search/app/app_module.dart';
import 'package:clean_dart_github_search/app/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() => runApp(
      ModularApp(
        module: AppModule(),
        child: AppWidget(),
      ),
    );
