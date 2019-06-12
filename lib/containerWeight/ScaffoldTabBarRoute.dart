import 'package:flutter/material.dart';

class ScaffoldTabBarRoute extends StatefulWidget {
  @override
  _ScaffoldTabBarRoute createState() => _ScaffoldTabBarRoute();
}

class _ScaffoldTabBarRoute extends State<ScaffoldTabBarRoute>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 1;
  static GlobalKey<ScaffoldState> _globalKey = new GlobalKey();

  TabController _tabController;
  List tabs = ["新闻", "历史", "图片"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        title: Text('App Name'),
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs.map((e) => Tab(text: e)).toList(),
        ),
        leading: Builder(builder: (context) {
          return IconButton(
            icon: Icon(
              Icons.dashboard,
              color: Colors.white,
            ),
            onPressed: () {
              _globalKey.currentState.openDrawer();
            },
          );
        }),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),
      drawer: new MyDrawer(),
// 一般的底部导航栏
//      bottomNavigationBar: BottomNavigationBar(
//        items: <BottomNavigationBarItem>[
//          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
//          BottomNavigationBarItem(
//              icon: Icon(Icons.business), title: Text('Business')),
//          BottomNavigationBarItem(
//              icon: Icon(Icons.school), title: Text('School'))
//        ],
//        currentIndex: _selectedIndex,
//        fixedColor: Colors.blue,
//        onTap: _onItemTapped,
//      ),
    //特殊底部导航栏
      bottomNavigationBar: BottomAppBar(
        color: Colors.greenAccent,
        shape: CircularNotchedRectangle(),
        child: Row(
          children: <Widget>[
            IconButton(icon: Icon(Icons.home),onPressed: (){},),
            SizedBox(),
            IconButton(icon: Icon(Icons.business),onPressed: (){},)
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onAdd,
        child: Icon(Icons.add),
      ),
      //嵌在底部导航栏上
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: TabBarView(
          controller: _tabController,
          children: tabs.map((e) {
            return Container(
              alignment: Alignment.center,
              child: Text(
                e,
                textScaleFactor: 5,
              ),
            );
          }).toList()),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onAdd() {}
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
          context: context, removeTop: true, child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top:38),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ClipOval(
                    child: Image.asset("images/avatar.png",width: 80,),
                  ),
                ),
                Text(
                  "Wendux",style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.add),
                  title: const Text("Add account"),
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text("Manage account"),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
