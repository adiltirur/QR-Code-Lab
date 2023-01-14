enum Flavor {
  PROD,
  DEV,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.PROD:
        return 'Scanner';
      case Flavor.DEV:
        return 'Scanner Dev';
      default:
        return 'title';
    }
  }

}
