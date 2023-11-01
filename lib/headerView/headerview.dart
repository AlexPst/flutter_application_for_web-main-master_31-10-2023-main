
import 'package:flutter/material.dart';
import 'package:flutter_application_for_web/components/mobile_desktop_view_builder.dart';
import 'package:flutter_application_for_web/constant.dart';
import 'package:flutter_application_for_web/headerView/headerbody.dart';
import 'package:responsive_builder/responsive_builder.dart';


class HeaderView extends StatelessWidget

{
  const HeaderView({super.key});



  @override
  Widget build(BuildContext context)
  {
    return DesktopMobileViewBuilder(
      
      mobileView: HeaderMobileView(), 
      desktopView: HeaderDesctopView());
    
  }
}
  
    

    

class HeaderDesctopView extends StatelessWidget {
  const HeaderDesctopView({
    Key? key, 
  }):super(key: key);
  

  @override
  Widget build(BuildContext context){
    final width = MediaQuery.of(context).size.width;
    final imageWidth = width * 0.47;
    final isSmall = width < 950;
    
    return Container(
       decoration: const BoxDecoration(
               
                 boxShadow: [
                   BoxShadow(
                     color: Colors.black45,
                     spreadRadius: 2,
                     blurRadius: 15,
                     offset: Offset(2, 2)
                   ),
                 ]
               ),
      height: 864,
      width: kInitWidth,
      //padding: kScreenPadding,
      child: Container(
      decoration: const BoxDecoration(
        
        image: DecorationImage(
          image: AssetImage("lib/assets/header_img_01.jpg"),
          fit: BoxFit.cover
        ),
        
        
      ),
    
        
        child: Column(
          children: [
            const SizedBox(height: 20,),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(200)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45,
                    spreadRadius: 5,
                    blurRadius: 20,
                    offset: Offset(2, 2)
                  ),
                ]
              ),
            child: Image.asset('lib/assets/portrait_for_header.png', height: isSmall ? imageWidth : 400,),
            ),
           const Expanded(
              child:
              HeaderBody(isMobile: false,),
            ),
                      
          ],
        ),
      ),
      );
  }
}

class HeaderMobileView extends StatelessWidget {
  const HeaderMobileView({
    Key? key,
  }):super(key:key);

  @override
  Widget build(BuildContext context){
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    //final width = kInitWidth - 40;
    return Container(
        padding: kScreenPadding,
        height: height * 0.9,
        width: width,
        //padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
         decoration: const BoxDecoration(
          
        image: DecorationImage(
          image: AssetImage("lib/assets/header_img_01.jpg"),
          fit: BoxFit.cover
          
        ),
        
      ),
      
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(200)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    spreadRadius: 5,
                    blurRadius: 20,
                    offset: Offset(2, 2)
                  ),
                ]
              ),
            
            child: Image.asset('lib/assets/portrait_for_header.png', height: 200,),
            ),
            //FlutterLogo(size: height * 0.3,),
            const Spacer(),
            const HeaderBody(isMobile:true)
          ],
        ),
    );
  }
}

