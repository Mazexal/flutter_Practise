import 'package:flutter/material.dart';

//class GridViewRoute extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        appBar: AppBar(
//          title: Text('GridViewRoute'),
//        ),
//        body:
////        GridView(
//////            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//////                crossAxisCount: 3, //横轴三个子widget
//////                childAspectRatio: 1.0 //宽高比为1时，子widget
//////                ),
//////            children: <Widget>[
//////              Icon(Icons.ac_unit),
//////              Icon(Icons.airport_shuttle),
//////              Icon(Icons.all_inclusive),
//////              Icon(Icons.beach_access),
//////              Icon(Icons.cake),
//////              Icon(Icons.free_breakfast)
//////            ]));
////            GridView.count(
//////          crossAxisCount: 3,
//////          childAspectRatio: 1.0,
//////          children: <Widget>[
//////            Icon(Icons.ac_unit),
//////            Icon(Icons.airport_shuttle),
//////            Icon(Icons.all_inclusive),
//////            Icon(Icons.beach_access),
//////            Icon(Icons.cake),
//////            Icon(Icons.free_breakfast),
//////          ],
//////        )
////            GridView(
//////          padding: EdgeInsets.zero,
//////          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//////              maxCrossAxisExtent: 300.0, childAspectRatio: 2.0 //宽高比为2
//////              ),
//////          children: <Widget>[
//////            Icon(Icons.ac_unit),
//////            Icon(Icons.airport_shuttle),
//////            Icon(Icons.all_inclusive),
//////            Icon(Icons.beach_access),
//////            Icon(Icons.cake),
//////            Icon(Icons.free_breakfast),
//////          ],
//////        )
//            GridView.extent(
//          maxCrossAxisExtent: 120.0,
//          childAspectRatio: 2.0,
//          children: <Widget>[
//            Icon(Icons.ac_unit),
//            Icon(Icons.airport_shuttle),
//            Icon(Icons.all_inclusive),
//            Icon(Icons.beach_access),
//            Icon(Icons.cake),
//            Icon(Icons.free_breakfast),
//          ],
//        ));
//  }
//}

class GridViewRoute extends StatefulWidget {
  @override
  _GridViewRoute createState() => new _GridViewRoute();
}

class _GridViewRoute extends State<GridViewRoute> {

  List<IconData> _icons = []; //保存Icon数据

  @override
  void initState() {
    super.initState();
    // 初始化数据
    _retrieveIcons();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, //每行三列
            childAspectRatio: 1.0 //显示区域宽高相等
        ),
        itemCount: _icons.length,
        itemBuilder: (context, index) {
          //如果显示到最后一个并且Icon总数小于200时继续获取数据
          if (index == _icons.length - 1 && _icons.length < 200) {
            _retrieveIcons();
          }
          return Icon(_icons[index]);
        }
    );
  }

  //模拟异步获取数据
  void _retrieveIcons() {
    Future.delayed(Duration(milliseconds: 200)).then((e) {
      setState(() {
        _icons.addAll([
          Icons.ac_unit,
          Icons.airport_shuttle,
          Icons.all_inclusive,
          Icons.beach_access, Icons.cake,
          Icons.free_breakfast
        ]);
      });
    });
  }
}
