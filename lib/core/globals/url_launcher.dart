import 'package:url_launcher/url_launcher_string.dart';

Future<bool> tryLaunchUrlString(String? url) async {
  if (url == null) return false;
  if (await canLaunchUrlString(url)) {
    return launchUrlString(
      url,
      mode: LaunchMode.externalApplication,
    );
  }
  return false;
}
