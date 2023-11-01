import 'package:flutter/material.dart';
import 'package:flutter_application_for_web/components/desktop_view_builder.dart';
import 'package:flutter_application_for_web/components/mobile_desktop_view_builder.dart';
import 'package:flutter_application_for_web/components/mobile_view_builder.dart';


final skills = [
  'Flutter', 
  'Firebase', 
  'Agile', 
  'Eat', 
  'Sleep', 
  'CS:GO'
          ];



class SkillsView extends StatelessWidget {
  const SkillsView({super.key});

  @override
  Widget build(BuildContext context) {
    return DesktopMobileViewBuilder(
      mobileView: SkillMobileView(),
      desktopView: SkillDesktopView(),
    );
    }
  }

   
class SkillDesktopView extends StatelessWidget {
  const SkillDesktopView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DesktopViewBuilder(
      titleText: 'Skills',
      children: [
       
        
        for (var rowIndex = 0; rowIndex < skills.length / 3; rowIndex++) ...[
        Row(
        
          children: [
            for (var index = 0; index < skills.length/2; index++)
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: index != 0 ? 8.0 : 0, right: index != 0 ? 8.0 : 0 ),
                  child: OutlineSkillsContainer(
                    index: index,
                    rowIndex: rowIndex,
                    isMobile: false,
                   
                  ),
                ),
                
              ),
              
              
          ],
          
        ),
       SizedBox(height: 20),
        ],
        SizedBox(height: 70,),
        ]
    );
  }
}

class OutlineSkillsContainer extends StatelessWidget {
  const OutlineSkillsContainer({
    super.key,
    required int this.index,
    int this.rowIndex = 0,
    bool this.isMobile = true
  });

  final int index;
  final int rowIndex;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    final parsedIndex = isMobile ? index : (index * 2) + rowIndex;
    return Container(
      width: isMobile ? double.infinity : null,
      padding: const EdgeInsets.only(left:10, right: 10, top: 10, bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(width: 3, color: Colors.amber),
        borderRadius: BorderRadius.circular(3),                                  
      ),
      child: Text(skills.elementAt(parsedIndex), style: Theme.of(context).textTheme.titleMedium,),
         
    );
    
   
  }
}

class SkillMobileView extends StatelessWidget {
  const SkillMobileView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MobileViewBuilder(
      
      titleText: 'Skills',
      children: [
        for(var index = 0; index<skills.length; ++index) ...[
            Padding(
              padding: const EdgeInsets.only(right:8.0),
              child: OutlineSkillsContainer(index: index, isMobile: true,),
            ),
            SizedBox(height: 20), 
        ]
                        
      ],
      
      
    );
  }
}