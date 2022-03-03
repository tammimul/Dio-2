import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:let/model/model.dart';
import 'package:let/model/singleuser.dart';
import 'package:let/network/config.dart';

import 'List.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const ListUser(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    http = network();
    getUser();
    super.initState();
  }
  //instatces
  late network http;
  late SingleUSerresponse singleuser;
  late User user;
  bool isloading = false;


  Future getUser()async{
    Response res;


    try {
      isloading = true;
      res = await http.getReq("/api/users/2");
      isloading = false;
      if(res.statusCode == 200){
        setState(() {
          singleuser = SingleUSerresponse.fromJson(res.data);

          user = singleuser.user;
        });
      }else{
        print("some problem has occured");
      }
    } on Exception catch (e) {
      isloading = false;
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: isloading ?  Center(child: CircularProgressIndicator())
          : user != null ? Center(
            child: Column(
              children: [
             Image.network(user.avatar),
             Text(user.first_name),
             Text(user.last_name),
        ],
      ),
          ) : Center(child: Text('Error '),)

    );
  }
}
