import 'package:flutter/material.dart';
import 'package:katalk/profileimagesetting.dart';
import 'package:katalk/profilesetting.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'main.dart';
import 'login.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {

  var userProfile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text('설정',style: TextStyle(color: Colors.black),),
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
        children: [
          Container(
            padding: EdgeInsets.all(5),
            width: double.infinity,
            height: 90,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        var imagePicker = ImagePicker();
                        var image = await imagePicker.pickImage(
                            source: ImageSource.gallery,
                            maxHeight: 1024,
                            maxWidth: 1024
                        );
                        if(image != null){

                          setState((){
                            userProfile = File(image.path);
                            context.read<UserData>().profileUpdate(image.path);
                            context.read<UserData>().userInfo['profile'] = userProfile;
                          });
                        }

                      },
                      child: userProfile != null ?
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 5, 15, 5),
                        width: 60,
                        height: 60,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          child: AspectRatio(
                            aspectRatio: 1/1,
                            child: Image.file(userProfile,fit: BoxFit.cover,),
                          ),
                        ),
                      )
                          :
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(17)),
                        ),
                        margin: EdgeInsets.fromLTRB(0, 5, 15, 5),
                        height: 60,
                        width: 60,
                      ),
                    ),


                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(context.read<UserData>().userInfo['name'].toString()),
                        Text(context.read<UserData>().userInfo['phone'].toString()),
                      ],
                    ),
                  ],
                ),

                OutlinedButton(child: Text('프로필 수정'), onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (c) => ProfileSetting()));
                })
              ],
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.black38,
                  width: 1.0,
                )
              )
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            alignment: Alignment.centerLeft,
            height: 50,
            child: GestureDetector(
              onTap: (){print('계정');},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('계정'),
                  Text(context.read<UserData>().userInfo['myId'].toString())
                ],
              ),
            ),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                      color: Colors.black38,
                      width: 1.0,
                    )
                )
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            alignment: Alignment.centerLeft,
            height: 50,
            child: GestureDetector(
              onTap: (){print('개인정보');},
              child: Text('개인정보'),
            ),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                      color: Colors.black38,
                      width: 1.0,
                    )
                )
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            alignment: Alignment.centerLeft,
            height: 50,
            child: GestureDetector(
              onTap: (){print('테마');},
              child: Text('테마'),
            ),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                      color: Colors.black38,
                      width: 1.0,
                    )
                )
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            alignment: Alignment.centerLeft,
            height: 50,
            child: GestureDetector(
              onTap: (){print('알림');},
              child: Text('알림'),
            ),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                      color: Colors.black38,
                      width: 1.0,
                    )
                )
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            alignment: Alignment.centerLeft,
            height: 50,
            child: GestureDetector(
              onTap: (){
                context.read<UserData>().logout();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => LoginPage()));
              },
              child: Text('로그아웃'),
            ),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                      color: Colors.black38,
                      width: 1.0,
                    )
                )
            ),
          )
        ],
      ),
    );
  }
}