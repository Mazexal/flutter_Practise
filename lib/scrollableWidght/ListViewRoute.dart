import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

//class ListViewRoute extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        appBar: AppBar(
//          title: Text('ListViewRoute'),
//        ),
//        body:
////              ListView(
////                shrinkWrap: true,
////                padding: const EdgeInsets.all(20),
////                children: <Widget>[
////                  const Text('I\'m dedicating every day to you'),
////                  const Text('Domestic life was never quite my style'),
////                  const Text('When you smile, you knock me out, I fall apart'),
////                  const Text('And I thought I was so smart'),
////                ],
////              ),
//
//            ListView.builder(
//                itemCount: 100,
//                itemExtent: 50,
//                itemBuilder: (BuildContext context, int index) {
//                  return ListTile(title: Text("$index"));
//                }));
//  }
//分割线
//  @override
//  Widget build(BuildContext context) {
//    Widget divider1 = Divider(color: Colors.blue);
//    Widget divider2 = Divider(color: Colors.red);
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('ListView'),
//      ),
//      body: ListView.separated(
//        itemCount: 100,
//        itemBuilder: (BuildContext context, int index) {
//          return ListTile(title: Text("$index"));
//        },
//        separatorBuilder: (BuildContext context, int index) {
//          return index % 2 == 0 ? divider1 : divider2;
//        },
//      ),
//    );
//  }
//}

class ListViewRoute extends StatefulWidget {
  @override
  _ListViewRoute createState() {
    return _ListViewRoute();
  }
}

class _ListViewRoute extends State<ListViewRoute> {
  static const loadingTag = "##loading##"; //表尾标记
  var _words = <String>[loadingTag];

  @override
  void initState() {
    super.initState();
    _retrieveData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: _words.length,
      itemBuilder: (BuildContext context,int index) {
        //如果到了表尾
        if (_words[index] == loadingTag) {
          //不足100条，继续获取数据
          if (_words.length - 1 < 100) {
            //获取数据
            _retrieveData();
            //加载时显示loading
            return Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: CircularProgressIndicator(strokeWidth: 2.0)
              ),
            );
          } else {
            //已经加载了100条数据，不再获取数据。
            return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(16.0),
                child: Text("没有更多了", style: TextStyle(color: Colors.grey),)
            );
          }
        }
        //显示单词列表项
        return ListTile(title: Text(_words[index]));
      },
      separatorBuilder: (BuildContext  context,int index) => Divider(height: .0),
    );
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      _words.insertAll(_words.length - 1,
          //每次生成20个单词
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList()
      );
      setState(() {
        //重新构建列表
      });
    });
  }
}
