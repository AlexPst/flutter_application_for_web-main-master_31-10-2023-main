import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';




class DesktopMobileViewBuilder extends StatelessWidget {
  const DesktopMobileViewBuilder({
    super.key,
    this.showMobile,
    required this.mobileView,
    required this.desktopView,
  }); 

  final bool? showMobile;
  final Widget mobileView;
  final Widget desktopView;

  @override    
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (_, size){
      if(showMobile ?? size.isMobile) return  mobileView;
      return desktopView;   
      
         
    }
    );
  }
}
