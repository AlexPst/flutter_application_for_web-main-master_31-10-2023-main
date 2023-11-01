import 'package:flutter/material.dart';
import 'package:flutter_application_for_web/components/mobile_desktop_view_builder.dart';
import 'package:flutter_application_for_web/main.dart';
import 'package:provider/provider.dart';

class DrawerView extends StatelessWidget{
  const DrawerView({super.key});


  @override
  Widget build(BuildContext context){
    return DesktopMobileViewBuilder(
      mobileView: DrawerDesktopView(), 
      desktopView: SizedBox(),);
  }
}

   
class DrawerDesktopView extends StatelessWidget {
  const DrawerDesktopView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final navigationItems = context.watch<List<NavigationItem>>();
    final scrollController = context.watch<ScrollController>();
    return Drawer(
      child: ListView(
    // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: <Widget>[
       const DrawerHeader(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.lightBlue, Colors.blue],
          tileMode: TileMode.repeated,
        ),
      ),
      child: Text('<Insert your name>'), 
    ),
    for(var item in navigationItems)
      ListTile(
        title: Text(item.text),
        onTap: () {scrollController.animateTo(
                  item.position,
                  duration: Duration(milliseconds: 700),
                  curve: Curves.easeInOut,
                  );
         Navigator.pop(context);
      },
    ),
    
    ],
  ),
    );
  }
}
