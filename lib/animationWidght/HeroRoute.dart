import 'package:flutter/material.dart';

import 'HeroAnimationRouteB.dart';

class HeroAnimationRoute extends StatelessWidget{
   @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(title: Text('HeroAnimationRoute'),),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
               Container(
                 alignment: Alignment.center,
                 child: InkWell(
                   child: Hero(tag: "avatar", child: Image.asset("images/avatar.png",width: 50,)),
                 onTap: (){
                     Navigator.push(context, PageRouteBuilder(pageBuilder: (context,animation,secondaryAnimation){
                       return FadeTransition(
                         opacity: animation,
                         child: Scaffold(
                           appBar: AppBar(title:Text("原图")),
                           body: HeroAnimationRouteB(),
                         ),
                       );
                     }));
                 },
                 ),
               ),
            ],
          ),
        );
      }
}
