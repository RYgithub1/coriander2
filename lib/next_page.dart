// import 'dart:html';

import 'package:flutter/material.dart';

class NextPage extends StatelessWidget {

//  データを渡すときは、贈り側メソッドから、引数受け取る記載して、body)nameへ
  NextPage(this.name); //nextPageに来る際にnameを渡すルールへ
  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // appBarヘッダー
        // title: Text(widget.title),
        title: Text("遷移後画面"), // テキストwidget
        // actions: <Widget>[
        //   Icon(Icons.add),
        //   Icon(Icons.share),
        //   Icon(Icons.login),
        //   Icon(Icons.logout),
        //   Icon(Icons.home),
        // ], // ヘッダーにアイコンのせる簡単
      ),
      body: Container(
        height: double.infinity,
        color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(name),
            Center(
              child: RaisedButton(
                child: Text("go back"),
                onPressed: () {
                  // 画面遷移はnavigater。push()で進みpop()で戻る。
                  Navigator.pop(context, "President Abe retire.");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
