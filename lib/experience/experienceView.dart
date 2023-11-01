import 'package:flutter/material.dart';
import 'package:flutter_application_for_web/components/desktop_view_builder.dart';
import 'package:flutter_application_for_web/components/mobile_desktop_view_builder.dart';
import 'package:flutter_application_for_web/components/mobile_view_builder.dart';
import 'package:flutter_application_for_web/experience/experiens_container.dart';

class ExperienceView extends StatelessWidget {
  const ExperienceView
({super.key});
  static const title = 'Опыт работы';
  @override
  Widget build(BuildContext context) {
    return  DesktopMobileViewBuilder(
      desktopView: ExperienceDesktopView(),
      mobileView: ExperienceMobileView(),
    );
  }
}


class ExperienceDesktopView extends StatelessWidget {
  const ExperienceDesktopView({super.key});
  @override
  Widget build(BuildContext context) {

    return  DesktopViewBuilder(
      titleText: ExperienceView.title,
      children: [
        SizedBox(height: 20,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            for(var rowIndex = 0; rowIndex<experiences.length/2; rowIndex++)
            Expanded(child: 
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
              for(var index = 0; index<experiences.length/2; index++)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ExperiensContainer(experience: experiences.elementAt(rowIndex*2 + index)),
                ),
              ],
            ))

        ]

        ),
        const SizedBox(height: 70)
      ],

    );
  }
}


class ExperienceMobileView extends StatelessWidget {
  const ExperienceMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return MobileViewBuilder(
    titleText: ExperienceView.title,
    children: [
      Column(children: [
        for(final experience in experiences)
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0, right: 10),
          child: ExperiensContainer(experience: experience),
        )
      ],)
    ],

    );
      
    
  }
}



