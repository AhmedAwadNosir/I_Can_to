import 'package:url_launcher/url_launcher.dart';

sendingEmailToDevTeam() async {
  final Uri params = Uri(
    scheme: 'mailto',
    path: 'fawzimohamed830@gmail.com',
    query: 'subject=Hello%20Dev%20Team&body=We%20Want%20To%20Contact%20You%20About',
  );
  launchUrl(params);
}
