import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'app.dart';
import 'flavors.dart';

void main() async {
  F.appFlavor = Flavor.PRODUCTION;
  await dotenv.load();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}
