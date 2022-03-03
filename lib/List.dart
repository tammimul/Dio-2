import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:let/model/model.dart';

import 'model/UserList.dart';
import 'network/config.dart';

class ListUser extends StatefulWidget {
  const ListUser({Key? key}) : super(key: key);

  @override
  _ListUserState createState() => _ListUserState();
}

class _ListUserState extends State<ListUser> {
  @override

  void initState() {
    http = network();
    getUser();
    super.initState();
  }



  late network http;
  late UserList userList;
  late List<User> users;
  bool isloading = false;


  Future getUser()async{
    Response res;


    try {
      isloading = true;
      res = await http.getReq("/api/users?page=2");
      isloading = false;
      if(res.statusCode == 200){
        setState(() {
          userList = UserList.fromJson(res.data);
          users = userList.users;
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
            : users != null ? Center(
              child: ListView.builder(
                itemBuilder: (context,index){

                  var user = users[index];
                  return ListTile(
                    leading: Image.network(user.avatar),
                    title: Text(user.first_name),
                    subtitle: Text(user.last_name),
                    trailing: Text(user.email),
                  );
                },
                itemCount: users.length,
              ),
        ) : Center(child: Text('Error '),)

    );
  }
}
