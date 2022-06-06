import 'package:flutter/material.dart';
import 'package:katalk/profilepage.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  var scroll = ScrollController();

  var userData = {
    'name' : '사용자',
    'picture' : '',
  };

  var friendsData = [
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
    {
      'name' : '이이이',
      'picture' : '',
    }
  ];

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
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.person_add_alt_1_outlined,color: Colors.black,),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.music_note_outlined,color: Colors.black,),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(itemCount: friendsData.length+1, controller: scroll, itemBuilder: (c, i){
        return GestureDetector(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (c) => profilepage()),
            );
          },
          child: Container(
            color: Colors.white,
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(2, 3, 2, 3),
            height: i == 0 ? 75 : 50,
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(i == 0 ? 25 : 17)),
                  ),
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  height: i == 0 ? 60 : 40,
                  width: i == 0 ? 60 : 40,
                ),
                Text(i == 0 ?
                 userData['name'].toString()
                 :friendsData[i-1]['name'].toString())
              ],
            ),
          ),
        );
      }),
    );
  }
}