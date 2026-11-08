import 'package:bookly_app/core/utlis/Function/MessageUser.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> lanch_url(context, String? url) async {
  if (url != null) {
    Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      messageUser(context,text: 'Not lanched URL');
    }
  }
}

