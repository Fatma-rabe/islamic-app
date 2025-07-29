import 'package:flutter/material.dart';
import 'package:islamic_app/core/prefs_manager/prefs_manager.dart';
import 'package:islamic_app/islami_app.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await PrefsManager.init();
  runApp(const IslamiApp());
}
