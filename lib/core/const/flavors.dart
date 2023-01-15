enum Flavor {
  prod,
  dev,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static bool get canDebugPrint => appFlavor == Flavor.dev;

  static String get title {
    switch (appFlavor) {
      case Flavor.prod:
        return 'WorkerBase Scanner';
      case Flavor.dev:
        return 'WorkerBase Scanner Dev';
      default:
        return 'Scanner';
    }
  }
}
