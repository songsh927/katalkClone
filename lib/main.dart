import 'package:flutter/material.dart';
import 'package:katalk/login.dart';
import 'home.dart';
import 'chat.dart';
import 'view.dart';
import 'shop.dart';
import 'setting.dart';

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

  join(name, phone, id, password){
    //서버로 보내서 회원가입 로직실행
  }

  var userInfo = {
    'id': 0,
    'name' : '사용자',
    'phone' : '01098765432',
    'myId' : 'jjamma',
    'picture' : '',
    'isLogin' : false,
  };

  login(id, password) async {
    userInfo['isLogin'] = true;
    return true;
  }

  var friendList = [
    {
      'id' : 1,
      'name' : '손흥민',
      'phone' : '01012341234',
      'friendId' : 'sonNo.7',
      'picture' : '',
    },
    {
      'id' : 2,
      'name' : '박지성',
      'phone' : '01012341234',
      'friendId' : 'jspark',
      'picture' : '',
    },
    {
      'id' : 3,
      'name' : '홍길동',
      'phone' : '01012341234',
      'friendId' : 'honggildong123',
      'picture' : '',
    },
  ];

  searchFriend(){
    //친구찾기
  }

  addFriendList(phoneNum, name, id, [profilePic]) {
    //서버로 id와 전화번호 보내서 응답코드받기

    var friendData = {
      'id' : friendList.length + 1,
      'name' : name.toString(),
      'phone' : phoneNum.toString(),
      'friendId' : id.toString(),
      'picture' : profilePic.toString(),
    };

    friendList.add(friendData);
    notifyListeners();
  }

  delFriend(){
    //친구삭제
    print(chattingRoom[1]['text'].length);
  }
  /*
  {
          'name': '손흥민',
          'text': 'asdf',
          'time': DateTime.now()
        }
   */

  List<Map<String, dynamic>>  chattingRoom = [
    {
      'roomId' : 1,
      'roomName' : '홍길동',
      'text' : []
    },
    {
      'roomId' : 2,
      'roomName' : '손흥민',
      'text' : []
    },
    {
      'roomId' : 3,
      'roomName' : '박지성',
      'text' : []
    },
  ];




  addRoom(id){
    //채팅방 중복검사 필수
    var name;

    for(int i = 0; i < friendList.length ; i++){
      if(friendList[i]['id'] == id){
        name = friendList[i]['name'];
        print(name);
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
    print(roomId);
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







