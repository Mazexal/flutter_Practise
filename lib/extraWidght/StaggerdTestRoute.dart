import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';

class StaggerdTestRoute extends StatelessWidget{
   @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(title: Text('瀑布式布局'),),
          body:   new StaggeredGridView.countBuilder(
            crossAxisCount: 4,
            itemCount: 8,
            itemBuilder: (BuildContext context, int index) => new Container(
                color: Colors.green[400],
                child: new Center(
                  child: new CircleAvatar(
                    backgroundColor: Colors.white,
                    child: new Text('$index'),
                  ),
                )),
            staggeredTileBuilder: (int index) =>
            new StaggeredTile.count(2, index.isEven ? 2 : 1),
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
          )
        );
      }
}
