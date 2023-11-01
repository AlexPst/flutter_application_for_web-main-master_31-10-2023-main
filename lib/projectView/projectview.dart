

import 'package:flutter/material.dart';
import 'package:flutter_application_for_web/components/desktop_view_builder.dart';
import 'package:flutter_application_for_web/components/mobile_desktop_view_builder.dart';
import 'package:flutter_application_for_web/components/mobile_view_builder.dart';
import 'package:flutter_application_for_web/constant.dart';
import 'package:flutter_application_for_web/projectView/project_item_body.dart';
import 'package:carousel_slider/carousel_slider.dart';



class ProjectItem{
  final String image;
  final String title;
  final String description;
  final List<String> technologies;

  ProjectItem({
    required this.image,
    required this.title,
    required this.description,
    required this.technologies,
    });

}

final kProjectItem = [
  ProjectItem(
    image: 'lib/assets/project1.png', 
    title: 'Abbey Road Studios', 
    description: 'Reinventing the songwriting process with Flutter', 
    technologies: ['Flutter, Firebase']
    ),
    ProjectItem(
    image: 'lib/assets/project2.png', 
    title: 'Alibaba Group', 
    description: 'Alibaba scales China’s largest second-hand marketplace with Flutter', 
    technologies: ['Flutter, Firebase']
    ),
    ProjectItem(
    image: 'lib/assets/project3.png', 
    title: 'Beike', 
    description: 'Beike helps users solve housing problems with Flutter', 
    technologies: ['Flutter, Firebase']
    ),
    ProjectItem(
    image: 'lib/assets/project4.png', 
    title: 'BMW', 
    description: 'Scaling customer-centric product development at BMW Group with Flutter', 
    technologies: ['Flutter, Firebase']
    ),
    ProjectItem(
    image: 'lib/assets/project5.png', 
    title: 'Google Pay', 
    description: 'Going global at Google Pay with Flutter', 
    technologies: ['Flutter, Firebase']
    ),
    ProjectItem(
    image: 'lib/assets/project6.png', 
    title: 'CrowdSource', 
    description: 'Increasing developer speed at Crowdsource with Flutter', 
    technologies: ['Flutter, Firebase']
    ),
];





class ProjectView extends StatelessWidget {
  const ProjectView({super.key});

  @override
  Widget build(BuildContext context) {


    return const DesktopMobileViewBuilder(
      
      mobileView: ProjectMobileView(), 
      desktopView: ProjectDesktopView());
    
    
  }
}


class ProjectDesktopView extends StatelessWidget {
  const ProjectDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return const DesktopViewBuilder(
      titleText: 'Projects',
      children: [
        SizedBox(height: 20),
        CarouselProjectView(),
      ],
    );
  } 
}



class ProjectMobileView extends StatelessWidget {
  const ProjectMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 1720,
      width: kInitWidth,
      color: Colors.white,
      padding: const EdgeInsets.only(left: 10),
      child: MobileViewBuilder(
        titleText: 'Projects',
        children: [
          for(var item in kProjectItem) ProjectItemBody(item: item) 
        ],
      ),
    );
  }
}

class CarouselProjectView extends StatelessWidget {
  const CarouselProjectView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CarouselSlider(
          items: [ for(var item in kProjectItem)
            ProjectItemBody(item: item)], 
          options: CarouselOptions(
            height: 700,
            aspectRatio: 9/16,
            viewportFraction: 0.5,
            initialPage: 0,
      enableInfiniteScroll: true,
      reverse: false,
      autoPlay: true,
      autoPlayInterval: const Duration(seconds: 3),
      autoPlayAnimationDuration: const Duration(milliseconds: 800),
      autoPlayCurve: Curves.fastOutSlowIn,
      enlargeCenterPage: true,
      enlargeFactor: 0.3,
      //onPageChanged: callbackFunction,
      scrollDirection: Axis.horizontal,
          )
          )
      ],
    );
  }
}


