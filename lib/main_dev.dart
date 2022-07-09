import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'app.dart';
import 'flavors.dart';

void main() {
  F.appFlavor = Flavor.DEV;
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(App());
}
