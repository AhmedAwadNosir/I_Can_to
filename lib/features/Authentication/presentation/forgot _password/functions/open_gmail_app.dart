import 'package:ican_to/core/utils/constans.dart';
import 'package:url_launcher/url_launcher_string.dart';

Future openGmail() async {
  try {
    await launchUrlString(url);
  } catch (e) {
    throw Exception("cannot open email app");
  }
}
