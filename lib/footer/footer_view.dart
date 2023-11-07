
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_application_for_web/components/mobile_desktop_view_builder.dart';
import 'package:flutter_application_for_web/constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

final currentYear = DateTime.now().year;
class FooterView extends StatelessWidget{

  @override
  Widget build (BuildContext context){
    return DesktopMobileViewBuilder(
      mobileView: FooterMobileView(),
      desktopView: FooterDesctopView(),
    );
  }
}


class FooterDesctopView extends StatelessWidget
{

  //final Uri url = Uri.parse('https://github.com/');
  
  @override
  Widget build(BuildContext context)
  {
    
    return Container(
      height: 100,
      width: kInitWidth,
      padding: kScreenPadding,
      child: Row(
        children: [
          Text('© Aleksey Postupinskiy $currentYear --'),
          Spacer(),
          // InkWell(mouseCursor: MaterialStateMouseCursor.clickable,
          // splashColor: Colors.transparent,
          // highlightColor: Colors.transparent,
          // hoverColor: Colors.transparent,
          // child: Text('See the course code', style: TextStyle(decoration: TextDecoration.underline),),
          // TextButton(
          //   style: TextButton.styleFrom(),
          //   onPressed: ()=> _launchInBrowser(url),
          //   child: const Text('See the course code', style: TextStyle(decoration: TextDecoration.underline, color: Colors.black), ),),
            for (final social in socials)
             TextButton(onPressed: ()=>_launchInBrowser(Uri.parse(social.strUrl)), child: social.icon, )
            
      
        ],
      ),
    );
  }
}



class FooterMobileView extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Container(
       height: 120,
      width: kInitWidth,
      padding: kScreenPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
           for (final social in socials)
             TextButton(onPressed: ()=>_launchInBrowser(Uri.parse(social.strUrl)), child: social.icon, ),
        ]
        ),
        SizedBox(height: 20,),
         Text('© Aleksey Postupinskiy $currentYear --'),
        ]
      ),
      
    );
  }
}

final socials = [
  SocialInfo(icon: FaIcon(FontAwesomeIcons.github), strUrl: 'https://github.com/AlexPst/flutter_application_for_web-main-master_31-10-2023-main'),
  SocialInfo(icon: FaIcon(FontAwesomeIcons.vk), strUrl: 'https://vk.com/id4456895'),
  SocialInfo(icon: FaIcon(FontAwesomeIcons.instagram), strUrl: 'https://t.me/AlexDart1'),
  SocialInfo(icon: FaIcon(FontAwesomeIcons.whatsapp), strUrl: 'https://wa.me/79200676056')
];

class SocialInfo{
  final Widget icon;
  final String strUrl;
  
  SocialInfo({required this.icon, required this.strUrl});
  
 //final Uri url = Uri.parse(strUrl);
}

Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }