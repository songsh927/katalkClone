import 'dart:io';

import 'package:flutter/material.dart';
import 'package:katalk/profilepage.dart';
import 'package:provider/provider.dart';
import 'addfriend.dart';
import 'main.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  var scroll = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text('친구',style: TextStyle(color: Colors.black),),
        actions:[
          IconButton(
            icon: Icon(Icons.search,color: Colors.black,),
            onPressed: () {
              context.read<UserData>().delFriend();
            },
          ),
          IconButton(
            icon: Icon(Icons.person_add_alt_1_outlined,color: Colors.black,),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (c) => AddFriend()));
            },
          ),
          IconButton(
            icon: Icon(Icons.music_note_outlined,color: Colors.black,),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(itemCount: context.watch<UserData>().friendList.length+1, controller: scroll, itemBuilder: (c, i){
        return GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (c) => profilepage(friendId : i)),
              );
            },
            child: i == 0 ?
            UserProfileTile(img : context.read<UserData>().userInfo['profile']) :
            ListProfileTile(listIndex: i)
          );
      }),
    );
  }
}

class UserProfileTile extends StatelessWidget {
  UserProfileTile({Key? key, this.img}) : super(key: key);
  final img;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(2, 3, 2, 3),
      height: 75,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
            height: 60,
            width: 60,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: AspectRatio(
                aspectRatio: 1/1,
                child: Image.asset(img, fit: BoxFit.cover,),
              ),
            ),
          ),
          Text(context.watch<UserData>().userInfo['name'].toString())
        ],
      ),
    );
  }
}

class ListProfileTile extends StatelessWidget {
  const ListProfileTile({Key? key, this.listIndex}) : super(key: key);
  final listIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(2, 3, 2, 3),
      height: 50,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(17)),
            ),
            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
            height: 40,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: AspectRatio(
                aspectRatio: 1/1,
                //child: Image.Network(),
              ),
            ),
          ),
          Text(context.watch<UserData>().friendList[listIndex-1]['name'].toString())
        ],
      ),
    );
  }
}



