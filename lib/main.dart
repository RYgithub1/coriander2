import 'dart:ui';

import 'package:coriander/next_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

//【レス】アプリ全体＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

//【フル＿ウィジェット＿ビュー】ーーーーーーーーーーーーー
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

//【フル＿ステート＿コントローラー】ーーーーーーーーーーーーー
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }



  // 画面遷移からの戻りときのコメント用変数定義
  String text = "NEXT page";

  final myFocusNode = FocusNode();

  //  つどつど入力の場合
  String name;
  //  後から入力していたデータを持ってくる、表示する場合）単発表示以外はこっちが基本
  final myController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Strength Rec"), // テキストwidget
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            TextField(
              autofocus: true,  // 入力位置の明確化ゆえ１行つけとく
              decoration: InputDecoration(
                hintText: "名前",
              ),
              onChanged: (text) {
                // print("First text field: $text");
                name = text;  // onChangedでStringで作った変数に代入して、SVに保存へ
              },
            ),
            TextField(
              controller: myController,
              autofocus: true,
              decoration: InputDecoration(
                hintText: "説明",
              ),
            ),
            TextField(
              autofocus: true,
              decoration: InputDecoration(
                hintText: "動画",
              ),
            ),
            TextField(
              focusNode:  myFocusNode,
            ),
            RaisedButton(
              child: Text("プロフィール新規登録"),
                onPressed: (){
                // TODO:ボタンタップしたらフォーカス
                //   myFocusNode.requestFocus();
                //   print(myController.text);
                //   入力値とダイアログ表示
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        // Retrieve the text the user has entered by using the
                        // TextEditingController.
                        content: Text(myController.text),
                      );
                    },
                  );
                }
            ),
          ],
        ),
      ),
    );
  }
}
