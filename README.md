# WorkerBase QR Code Scanning App

This app demostrate basic qr code scanning functionality and mainly depends on [mobile_scanner](https://pub.dev/packages/mobile_scanner) library.


# Functionalities

- QR Code Scanning
- Torch On and Off
- Switch Camera
- Save Scanned QR Code to local database
- Multi Language support
- Scave Scanned QR code as an image to local database
- Open links, phone numbers etc of the scanned QR Code
- Deleting single records
- Deleting all records

## Libraries/Plugins Used

- [auto_route](https://pub.dev/packages/auto_route)
- [easy_localization](https://pub.dev/packages/easy_localization)
- [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- [flutter_hooks](https://pub.dev/packages/flutter_hooks)
- [freezed_annotation](https://pub.dev/packages/freezed_annotation)
- [hive](https://pub.dev/packages/hive)
- [hive_flutter](https://pub.dev/packages/hive_flutter)
- [logger](https://pub.dev/packages/logger)
- [lottie](https://pub.dev/packages/lottie)
- [mobile_scanner](https://pub.dev/packages/mobile_scanner)
- [path_provider](https://pub.dev/packages/path_provider)
- [url_launcher](https://pub.dev/packages/url_launcher)
- [uuid](https://pub.dev/packages/uuid)

## Before Running

- Make sure to run the build_runner
either with 
<code>flutter pub run build_runner build</code>
or
<code>flutter pub run build_runner watch --delete-conflicting-outputs</code>
