import 'package:flutter/material.dart';
import 'package:flutter_application_for_web/components/mobile_desktop_view_builder.dart';
import 'package:flutter_application_for_web/constant.dart';
import 'package:flutter_application_for_web/main.dart';
import 'package:provider/provider.dart';



class NavigatonBarView extends StatelessWidget {

  @override
  Widget build(BuildContext context)
  {
        onPressed() => print('click');
        return DesktopMobileViewBuilder(
          mobileView: NavigationMobileView(),
          desktopView: NavigationDesktopView(),);
  }
  
}
    

class NavigationDesktopView extends StatelessWidget {
   NavigationDesktopView({
    super.key,
  });
 
 
  
  @override
  Widget build(BuildContext context) {
    final navigationItems = context.watch<List<NavigationItem>>();
    final scrollController = context.watch<ScrollController>();
    return  Container(
        
        height: 100,
        width: kInitWidth,
        color: Colors.blueAccent,
        padding: kScreenPadding,
        child: Row(
          children: [
            FlutterLogo(),
            Spacer(),
             for (var item in navigationItems)
             NavigationBarItem(
                  onPressed: (){
                  scrollController.animateTo(
                  item.position,
                  duration: Duration(milliseconds: 700),
                  curve: Curves.easeInOut,
                  );
                }, 
                text: item.text,
                ),
            // OutlinedButton( style: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(Colors.white)),
            //   onPressed: (){
            //   Navigator.push(context,
            //   MaterialPageRoute(builder: (context) => ProjectView()));
            // }, child: Text('Проекты'))
          ],
        ),
      );
      
  }
}

class NavigationMobileView extends StatelessWidget {
  const NavigationMobileView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kScreenPadding,
      color: Colors.blueAccent,
      height: 100,
       width: double.infinity,
      //color: Colors.blueAccent,
      //padding: kScreenPadding,
      child: Row(
        children: [
        const SizedBox(width: 20),
        const FlutterLogo(),
        const Spacer(),
        IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => Scaffold.of(context).openEndDrawer(),
            )
          ],
        ),
      );
  }
}





class NavigationBarItem extends StatelessWidget{
  
   NavigationBarItem({
    Key? key,
    required this.onPressed,
    required this.text,
    
  }) : super(key: key);

  final void Function() onPressed;
  final String text;
  
  
  
  @override
  Widget build(BuildContext context){
    final isSmall = MediaQuery.of(context).size.width <650;
      return TextButton(
        style: TextButton.styleFrom(foregroundColor: Colors.black, padding: EdgeInsets.symmetric(horizontal: 24)),
        onPressed: () {onPressed();},
        child: Text(text, style: TextStyle(color: Colors.black, fontSize: isSmall ? 17 : 24),),

      );
  }
}




