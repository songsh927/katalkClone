import 'package:flutter/material.dart';
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
            home: MyApp()
          )
  ));
}

class UserData with ChangeNotifier{
  var userInfo = {
    'name' : '사용자',
    'picture' : '',
    'isLogin' : false,
  };

  var friendList = [
    {
      'name' : '김김김',
      'picture' : '',
    },
    {
      'name' : '나나나',
      'picture' : '',
    },
    {
      'name' : '박박박',
      'picture' : '',
    },
  ];
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







