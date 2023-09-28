import 'package:url_launcher/url_launcher.dart';

Future<bool> followUrlLink({required String articleUrl})async{
  final Uri url = Uri.parse(articleUrl);
  return await launchUrl(url).catchError((error){
    throw Exception('could not launch this link');
  });
}
