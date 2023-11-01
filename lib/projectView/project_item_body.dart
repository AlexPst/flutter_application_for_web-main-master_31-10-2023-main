
import 'package:flutter/material.dart';
import 'package:flutter_application_for_web/projectView/projectview.dart';
import 'package:google_fonts/google_fonts.dart';

class ProjectItemBody extends StatelessWidget {

  const ProjectItemBody({
    super.key,
    required this.item,
  });

  final ProjectItem item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Expanded(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(item.image),
           Text(
             item.title,
             style: GoogleFonts.montserrat(textStyle:Theme.of(context).textTheme.titleMedium)),
           Text(
            item.description,
             style: GoogleFonts.montserrat(textStyle:Theme.of(context).textTheme.bodyMedium)),
           Row(children: [
             for(var tech in item.technologies)
             Chip(label: Text(tech),)
           ],
           )
        ],
      )),
    );
  }
}

