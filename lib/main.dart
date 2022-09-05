import 'package:flutter/material.dart';
import 'package:katalk/login.dart';
import 'home.dart';
import 'chat.dart';
import 'view.dart';
import 'shop.dart';
import 'setting.dart';
import 'package:http/http.dart' as http;

import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (c) => UserData()),
        ],
          child: MaterialApp(
            home: UserData().userInfo['isLogin'] == false ? LoginPage() : MyApp()
          )
  ));
}

class UserData extends ChangeNotifier{

  List<Map<String, dynamic>>  chattingRoom = [];
  var friendList = [];

  join(name, phone, id, password) async{
    //서버로 보내서 회원가입 로직실행
    http.Response res = await http.post(
        Uri.parse('http://localhost:8080/auth/signup'),
        headers: {"Content-type" : "application/json"},
        body: jsonEncode({
          'userName' : name,
          'phone' : phone,
          'userId' : id,
          'userPassword' : password
        })
    );

    if(res.statusCode == 400){
      print(jsonDecode(res.body)['message']);

    }

    if(res.statusCode == 201){
      return true;
    }
  }

  var userInfo = {
    'id': '',
    'name' : '',
    'phone' : '',
    'myId' : '',
    'picture' : '',
    'isLogin' : false,
    'token' : ''
  };

  login(id, password) async {
    http.Response res = await http.post(
      Uri.parse('http://localhost:8080/auth/login'),
      headers: {"Content-type" : "application/json"},
      body: jsonEncode({
        'userId':id,
        'userPassword':password
      })
    );

    if(res.statusCode == 200){

      /**
       * 기존 친구목록 랜더링
       * */
      jsonDecode(res.body)['user']['friendId'].forEach((id){
        searchFriendById(id);
      });


      userInfo['id'] = jsonDecode(res.body)['user']['id'];
      userInfo['name'] = jsonDecode(res.body)['user']['name'];
      userInfo['phone'] = jsonDecode(res.body)['user']['phone'];
      userInfo['myId'] = jsonDecode(res.body)['user']['userId'];
      userInfo['token'] = jsonDecode(res.body)['token'];
      userInfo['isLogin'] = true;
      return true;
    }
  }


  searchFriendByUserId(phoneNum, name, userId) async{
    http.Response res = await http.get(
        Uri.parse('http://localhost:8080/user/find?userId=$userId'),
        headers: {
          "Content-type" : "application/json",
          "Authorization" : "Bearer ${userInfo['token']}"
        }
    );

    if(res.statusCode == 200){
      return res.body;
    }
  }

  searchFriendById(id) async{
    http.Response res = await http.get(
        Uri.parse('http://localhost:8080/user/find?id=$id'),
        headers: {
          "Content-type" : "application/json",
          "Authorization" : "Bearer ${userInfo['token']}"
        }
    );

    if(res.statusCode == 200){
      addToList(jsonDecode(res.body));
    }
  }

  addFriendList(phoneNum, name, userId) async{
    var data = jsonDecode(await searchFriendByUserId(phoneNum, name, userId));

    if(data != null){
      http.Response res = await http.post(
        Uri.parse('http://localhost:8080/user/add?id=${data['id']}'),
        headers: {
          "Content-type" : "application/json",
          "Authorization" : "Bearer ${userInfo['token']}"
        },
      );

      if(res.statusCode ==201){
        addToList(data);
      }
    }
  }

  addToList(data){
    var friendData = {
      'id' : data['id'].toString(),
      'name' : data['name'],
      'phone' : data['phone'],
      'userId' : data['userId'],
      'picture' : data['picture'],
    };
    friendList.add(friendData);
    notifyListeners();
  }

  delFriend(){
    //친구삭제
    print(chattingRoom[1]['text'].length);
  }




  sendMessage(text, roomId, time){
    chattingRoom.forEach((room) {
      if(room['roomId'] == roomId){
        room['text'].add({
          'name': userInfo['name'],
          'text': text,
          'time': time
        });
      }
    });
    notifyListeners();
  }

  receiveMessage(){

  }


  addRoom(id){
    /**
     * 채팅방 중복검사 추가할것
     * */
    var name;

    for(int i = 0; i < friendList.length ; i++){
      if(friendList[i]['id'] == id){
        name = friendList[i]['name'];
      }
    }

    var addingRoomData = {
      'roomId' : chattingRoom.length + 1,
      'roomName' : name.toString(),
      'text' : []
    };
    chattingRoom.add(addingRoomData);
    notifyListeners();
  }

  delRoom(roomId) {
    //채팅방 삭제
    for(int i = 0 ; i < chattingRoom.length ; i++){
      if(roomId == chattingRoom[i]['roomId']){
        chattingRoom.removeAt(i);
      }
    }
    notifyListeners();
  }

}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var tab = 0;
  static final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        bottomNavigationBar: BottomNavigationBar(

          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          elevation: 10,


          onTap: (i){
            setState(() {
              tab = i;
            });
          },

          items: [
            BottomNavigationBarItem(
                icon: Icon(tab == 0 ? Icons.person : Icons.person_outline, color: Colors.black38),
                label: 'Home'
            ),
            BottomNavigationBarItem(
                icon: Icon(tab == 1 ? Icons.chat_bubble : Icons.chat_bubble_outline, color: Colors.black38),
                label: 'Chat'
            ),
            BottomNavigationBarItem(
                icon: Icon(tab == 2 ? Icons.remove_red_eye_rounded : Icons.remove_red_eye_outlined, color: Colors.black38),
                label: 'View'
            ),
            BottomNavigationBarItem(
                icon: Icon(tab == 3 ? Icons.shop : Icons.shop_outlined, color: Colors.black38),
                label: 'Shop'
            ),
            BottomNavigationBarItem(
                icon: Icon(tab == 4 ? Icons.settings : Icons.settings_outlined, color: Colors.black38),
                label: 'Setting'
            )
          ],
        ),
        body: [
          Home(),
          Chat(),
          View(),
          Shop(),
          Setting(),
        ][tab],
      );


  }
}

/*
  친구 목록 => shared preferences => provider

  채팅방 목록 => shared preferences
  채팅 => shared preferences
  사용자의 로그인 => shared preferences

  ====DB====
  - 사용자 정보 테이블
  - 사용자 친구 테이블
  - 채팅방 정보 테이블
  - 채팅 테이블
 */







