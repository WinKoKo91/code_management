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
        return 'GetxTemplateDev';
      case Flavor.PRODUCTION:
        return 'GetxTemplate';
      default:
        return 'title';
    }
  }

  static String get baseUrl{
    switch (appFlavor) {
      case Flavor.DEV:
        return 'https://dog.ceo/api/breeds/image';
      case Flavor.PRODUCTION:
        return 'https://dog.ceo/api/breeds/image';
      default:
        return 'https://dog.ceo/api/breeds/image';
    }
  }

}
