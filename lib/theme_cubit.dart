import 'package:delivoo/Themes/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(appTheme);

  void selectTheme(ThemeData theme) {
    emit(theme);
  }
}
