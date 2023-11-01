import 'dart:async';


import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_for_web/blog/blogView.dart';
import 'package:flutter_application_for_web/drawer/drawer_view.dart';
import 'package:flutter_application_for_web/experience/experienceView.dart';
import 'package:flutter_application_for_web/headerView/headerview.dart';
import 'package:flutter_application_for_web/projectView/projectview.dart';
import 'package:flutter_application_for_web/skills/skills_view.dart';
import 'navigation_bar/navigation_bar_view.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: "montserrat",
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 60, fontWeight: FontWeight.w500, color: Colors.black,), 
          titleMedium: TextStyle(fontSize: 24, fontStyle: FontStyle.normal, color: Colors.black),
          bodyMedium: TextStyle(fontSize: 14, fontFamily: 'Hind', color: Colors.black),
         ),
      ),
      home:const PortfolioView(),
      
       
    );
  }
}

class PortfolioView extends StatefulWidget{
  const PortfolioView({
    Key? key,
  }) : super(key: key);

  @override
  State<PortfolioView> createState() => _PortfolioViewState();
}



class _PortfolioViewState extends State<PortfolioView> with AfterLayoutMixin{
    final projectKey = GlobalKey();
    final skillsKey = GlobalKey();
    final experienceKey = GlobalKey();
    final blogKey = GlobalKey();
    bool _showBackToTopButton = true;
    List<NavigationItem> navigationItems = [];
    late ScrollController _scrollController = ScrollController(
    initialScrollOffset: 0);
  
  @override
  void afterFirstLayout(BuildContext context){
      
      setState(() {
        // if(_scrollController.offset >= 400){
        //   _showBackToTopButton = true;
        // }else{
        //   _showBackToTopButton = false;
        // }
       navigationItems = [
        NavigationItem('Проекты', key: projectKey),
        NavigationItem('Навыки', key: skillsKey),
        NavigationItem('Опыт работы', key: experienceKey),
        NavigationItem('Блог', key: blogKey),
        ];
        
      });
    }
  
  





  @override
  Widget build(BuildContext context){
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return MultiProvider(
      providers:[
        ProxyProvider0<List<NavigationItem>>(update: (_, __) {
          return navigationItems;
        }),
        ChangeNotifierProvider<ScrollController>(create: (_) {
          return _scrollController;
        }),
      ],
      child: Scaffold(
        endDrawer: DrawerView(),
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              NavigatonBarView(),
              HeaderView(),
              ProjectView(key: projectKey,),
              SkillsView(key: skillsKey,),
              ExperienceView(key: experienceKey,),
              BlogView(key: blogKey),
              Container(height: height, width: width, color: Colors.blue,)
            ],
            
          ),
          
        ),
        floatingActionButton: _showBackToTopButton == false
        ? null
        : FloatingActionButton(
          onPressed: () {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if(_scrollController.hasClients){
              _scrollController.animateTo(_scrollController.position.minScrollExtent, 
              duration: const Duration(microseconds: 500), curve: Curves.linear);}
             });
          },
          child: const Icon(Icons.arrow_upward),
        ),
      ),
    );
  }
}

class NavigationItem {
  final String text;
  final GlobalKey key;
  NavigationItem(
    this.text, {
    required this.key,
  });

  double get position => _getPosition(key);
}

double _getPosition(GlobalKey key) {
  final RenderBox renderBox = key.currentContext?.findRenderObject() as RenderBox;
  final position = renderBox.localToGlobal(Offset.zero);
  final scrollOffset = position.dy;
  return scrollOffset;
}
