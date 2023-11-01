 import 'package:flutter/material.dart';
import 'package:flutter_application_for_web/components/desktop_view_builder.dart';
import 'package:flutter_application_for_web/components/mobile_desktop_view_builder.dart';
import 'package:flutter_application_for_web/components/mobile_view_builder.dart';
import 'package:flutter_application_for_web/experience/experiens_container.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;







// class BlogView extends StatelessWidget {
//   const BlogView
//   ({super.key});

//   static const title = 'Блог';
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: getArticles(),
//       builder:(context, snapshot) {
//         if(!snapshot.hasData) return CircularProgressIndicator();
//         print(snapshot.data);
//         return DesktopMobileViewBuilder(
//         mobileView: BlogMobileView(), 
//         desktopView: BlogDesktopView(), 
          
//       );
//       }
//     );
//   }
// }

class BlogView extends StatelessWidget {
   const BlogView ({super.key});
  static const title = 'Blog';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DesktopMobileViewBuilder(
        mobileView: BlogMobileView(),
        desktopView: BlogDesktopView(),
      ),
    );
  }
}


class BlogDesktopView extends StatelessWidget {
  const BlogDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    
    return DesktopViewBuilder(
      titleText: BlogView.title, 
      children: [
        Row(children: [
            Expanded(
              child: BlogCard(isMobile: false, title: 'Title 1',)
            ),
            Expanded(child: BlogCard(isMobile: false, title: 'Title 2',))
        ],)
      ]);
  }
}


class BlogCard extends StatelessWidget {
  const BlogCard({
    super.key, 
    required this.isMobile, 
    required this.title, 
  });
  
  final String title;
  final bool isMobile;
   @override
   Widget build(BuildContext context){
    return Card(
      // Define the shape of the card
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(4),
  ),
  // Define how the card's content should be clipped
  clipBehavior: Clip.antiAliasWithSaveLayer,
  // Define the child widget of the card
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      // Add padding around the row widget
      Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(height: 5),
                  // Add a title widget
                  Text(
                    title,
                   style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.blue
                      )
                  ),
                  // Add some spacing between the title and the subtitle
                  Container(height: 5),
                  // Add a subtitle widget
                  Text(
                    "Sub title",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.blue
                      )
                  ),
                  // Add some spacing between the subtitle and the text
                  Container(height: 10),
                  // Add a text widget to display some text
                  Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore' 
                        'magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur' 
                        'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
                    maxLines: 2,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.blue
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  ),
    );
   }
}


// class BlogCard extends StatelessWidget {
//   const BlogCard({
//     super.key, 
//     required this.isMobile,
//     required this.article,
//   });

//   final bool isMobile;
//   final RssItem article;
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 5,
//       margin: EdgeInsets.all(8),
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
                    
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//         Container(color: Colors.red,
//         width: double.infinity,
//         padding: EdgeInsets.symmetric(horizontal:8,
//         vertical: isMobile ?? false ? 20 : 40),
//         child: Text(article.title as String,
//         style: Theme.of(context).textTheme.titleMedium?.copyWith(
//          color: Colors.white
//         )
//                      ),
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                       Text('14 Сентября 2023', style: textStyle(isGray: true),),
//                       SizedBox(height: 15,),
//                       Text(article.description as String, style: textStyle())
      
//                     ],) 
//                     ],
                    
//                   ),
//       ),
//             );
//   }
// }



class BlogMobileView extends StatelessWidget {
  const BlogMobileView({super.key});

 Widget build(BuildContext context) {
    
    
    return MobileViewBuilder(
      titleText: BlogView.title,
      children: [
          BlogCard(isMobile: true, title: "Title 1",),
          BlogCard(isMobile: true, title: "Title 2",)
      ],
    );
  }
}

// getArticles() async {
//   const url = 'https://habr.com/ru/rss/flows/develop/articles/?fl=ru';
//   final responce = await http.get(url as Uri); 
//   final parsedResponce = RssFeed.parse(responce.body);
//   return parsedResponce;
// }


// Future<List<RssItem>?> getArticles() async{
  
//   final url = 'https://habr.com/ru/rss/flows/develop/articles/?fl=ru';
//   final responce = await http.get(url as Uri);
//   final parcedResponce = RssFeed.parse(responce.body);
//   final haveSomeTag = (RssItem article){
//     return article.categories?.any((category) => category.value == 'devops');
//   };
//   //final flutterArticles = parcedResponce.items?.where(haveSomeTag).take(2).toList();
//   final flutterArticles = parcedResponce.items?.where((haveSomeTag) => true).take(2).toList();
//    return flutterArticles;
//  }

