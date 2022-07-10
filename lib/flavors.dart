import 'package:flutter_dotenv/flutter_dotenv.dart';

enum Flavor {
  DEV,
  PRODUCTION,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.DEV:
        return 'Movie APP';
      case Flavor.PRODUCTION:
        return 'Movie APP';
      default:
        return 'Movie APP';
    }
  }

  static String get baseUrl{
    switch (appFlavor) {
      case Flavor.DEV:
        return dotenv.env['API_BASE_URL']!;
      case Flavor.PRODUCTION:
        return dotenv.env['API_BASE_URL']!;
      default:
        return dotenv.env['API_BASE_URL']!;
    }
  }

  static String get imageBaseUrl{
    switch (appFlavor) {
      case Flavor.DEV:
        return dotenv.env['IMAGE_BASE_URL']!;
      case Flavor.PRODUCTION:
        return dotenv.env['IMAGE_BASE_URL']!;
      default:
        return dotenv.env['IMAGE_BASE_URL']!;
    }
  }

  static String get apiKey{
    switch (appFlavor) {
      case Flavor.DEV:
        return dotenv.env['API_KEY']!;
      case Flavor.PRODUCTION:
        return dotenv.env['API_KEY']!;
      default:
        return dotenv.env['API_KEY']!;
    }
  }

}
