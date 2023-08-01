# QR Code Scanning App

This app demonstrate basic qr code scanning functionality and mainly depends on [mobile_scanner](https://pub.dev/packages/mobile_scanner) library.

[![Codemagic build status](https://api.codemagic.io/apps/63fdd213d0185cf1058e3a57/63fdd213d0185cf1058e3a56/status_badge.svg)](https://codemagic.io/apps/63fdd213d0185cf1058e3a57/63fdd213d0185cf1058e3a56/latest_build)

## Functionalities

- QR Code Scanning
- Torch On and Off
- Switch Camera
- Create QR Code
- Share Created QR Code
- Multi Language support
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
- [qr_flutter](https://pub.dev/packages/qr_flutter)
- [share_plus](https://pub.dev/packages/share_plus)

## Before Running

- Make sure to run the build_runner
either with
<code>flutter pub run build_runner build</code>
or
<code>flutter pub run build_runner watch --delete-conflicting-outputs</code>



## Running Dev App

- If you are using VSCode, go to Run and Debug tab and choose the flavour from dropdown and click on start debugging button.
- If you want to run from terminal, use <code>flutter run --flavor dev -t lib/main_dev.dart</code>

#### Note:- If you run in VSCode from a keyboard shortcut, it will by default run dev flavour.