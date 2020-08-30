import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  String str = "date";
  Response response;

  void web(s) async {
    response = await get("http://192.168.187.130/cgi-bin/web.py?x=$s");
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        home:Scaffold(
          appBar: AppBar(leading: Icon(
            Icons.accessibility),
            title: Title(child: Text("Linux Command"),
            color: Colors.blue,),
          ),
          body:Container(
            child:Column(
              children: <Widget>[
                TextField(onChanged: (s){
                  setState(() {
                    str=s;
                  });
                },),
                RaisedButton(onPressed: (){
                  setState(() {
                    web(str);
                  });
                },child: Text("RUN COMMAND"),),
                Text(response==null?"TEXT":response.body)
              ],
            )
          ) ,
        )
    );
  }
}
