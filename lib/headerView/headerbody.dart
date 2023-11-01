import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_for_web/constant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_application_for_web/utils/teleBot_plug.dart';
import 'package:flutter_application_for_web/utils/email_sender.dart';



class HeaderBody extends StatefulWidget {

  final bool isMobile;


  const HeaderBody({
    Key? key,
    required this.isMobile ,
  }):super (key:key);

  @override
  State<HeaderBody> createState() => _HeaderBodyState();
}
  

class _HeaderBodyState extends State<HeaderBody> {

  late final List<String> attachments = [];
  final _emailSenderController = TextEditingController(text: '154533@mail.ru',);

  var _subjectController = TextEditingController(text: 'The subject');
  var _messageTextController = TextEditingController(text: 'Message text');

  

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> send() async{
    final Email email = Email(
      body: _messageTextController.text,
      subject: _subjectController.text,
      recipients: [_emailSenderController.text],
      isHTML: false,
      //attachmentPaths: attachments
    );

     String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'success';
    } catch (error) {
      print(error);
      platformResponse = error.toString();
    }

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(platformResponse),
      ),
    );
  }


  @override
  void dispose(){
    super.dispose();
    _emailSenderController.dispose();
    _subjectController.dispose();
    _messageTextController.dispose();
  }



  @override
  Widget build(BuildContext context) {
   
   
    return Column(
    
      mainAxisAlignment: MainAxisAlignment.center, 
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        

        Padding(padding: kScreenPadding,
        child: AutoSizeText('Этот сайт написан на Flutter',
          style: GoogleFonts.montserrat(textStyle: Theme.of(context).textTheme.displayLarge), 
          maxLines: 1,
          ), 
          ),

         Padding(padding: kScreenPadding, 
        child: AutoSizeText('Это мой тестовый проект',
        style: GoogleFonts.montserrat(textStyle: Theme.of(context).textTheme.titleLarge),
        maxLines: 2,
        ),
         ),

        SizedBox(height: widget.isMobile ? 20 : 40,),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: widget.isMobile ? 10 : 17, 
            horizontal: widget.isMobile ? 10 : 20),

          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 26, 92, 146),
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(7))),
            ),
            onPressed: (){
              _dialogBuilder(context);
            },
            child: Text('Contact Me', 
              style: GoogleFonts.montserrat(
                fontSize: widget.isMobile ? 20 : 24, 
                color: Colors.white),),
          ),
        )
        
      ],
    );
  }

  Future<void> _dialogBuilder(BuildContext context){
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Contact form'),
        actions: <Widget>[
           Padding(padding: EdgeInsets.all(8.0),
          child: TextField(
            controller: _emailSenderController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Your email',
            ),
          ),
          ),
           Padding(padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: _subjectController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Subject',
              ),
            ),
            ),
             Padding(padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: _messageTextController,
              maxLines: 10,
              decoration: InputDecoration(
                labelText: 'Message',
                border: OutlineInputBorder()
              ),
            ),),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Send'),
            onPressed: (){sendEmail();},
          )
        ],
      );
    },
  );
}

}










