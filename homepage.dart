import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List posts;
  Future<bool> _getpost() async{
    String serviceUrl = "https://jsonplaceholder.typicode.com/posts";
    var response = await http.get(serviceUrl);
    setState(() {
      posts = json.decode(response.body.toString());
    });
  }
 @override
 void initState() {
    // TODO: implement initState
    super.initState();
    this._getpost();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test json'),
      ),
      body: new ListView.builder(padding: new EdgeInsets.all(10.0),
      itemCount: posts.length == null?0: posts.length,
        itemBuilder: (BuildContext context, int index){
        return ListTile(
          title: Text(posts[index]["title"]),
        );
        },

      ),

    );
  }
}
