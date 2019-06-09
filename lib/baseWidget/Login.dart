import 'package:flutter/material.dart';

class LoginRoute extends StatefulWidget {
  @override
  _LoginRoute createState() {
    return _LoginRoute();
  }
}

class _LoginRoute extends State<LoginRoute> {
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusScopeNode focusScopeNode;

  TextEditingController _unameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              TextField(
                autofocus: true,
                focusNode: focusNode1,
                decoration: InputDecoration(
                    labelText: "用户名",
                    hintText: "用户名或邮箱",
                    prefixIcon: Icon(Icons.person)),
                onChanged: (item) {
                  print(item);
                },
                controller: _unameController,
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: "密码",
                    hintText: "您的登陆密码",
                    prefixIcon: Icon(Icons.lock)),
                obscureText: true,
                focusNode: focusNode2,
                onChanged: (item) {
                  print(item);
                },
              ),
              FlatButton(
                child: Text('print'),
                onPressed: () {
                  print(_unameController.text);
                },
              ),
              Builder(
                builder: (ctx) {
                  return Column(
                    children: <Widget>[
                      RaisedButton(
                        child: Text('移动焦点'),
                        onPressed: () {
                          if (null == focusScopeNode) {
                            focusScopeNode = FocusScope.of(context);
                          }
                          focusScopeNode.requestFocus(focusNode2);
                        },
                      ),
                      RaisedButton(
                        child: Text('隐藏键盘'),
                        onPressed: () {
                          focusNode1.unfocus();
                          focusNode2.unfocus();
                        },
                      )
                    ],
                  );
                },
              )
            ],
          ),
        ));
  }
}
