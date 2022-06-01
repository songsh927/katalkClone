import 'package:flutter/material.dart';
import 'package:katalk/chattingpage.dart';

class Chat extends StatelessWidget {
  Chat({Key? key}) : super(key: key);
  var scroll = ScrollController();

  var roomData = [
    {
      'roomId' : '1',
      'name' : '홍길동',
      'text' : 'asdf'
    },
    {
      'roomId' : '2',
      'name' : '손흥민',
      'text' : '득점왕 ㅊㅊ'
    },
    {
      'roomId' : '3',
      'name' : '박지성',
      'text' : '지송빠레'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
        title: Text('채팅',style: TextStyle(color: Colors.black),),
        actions:[
          IconButton(
            icon: Icon(Icons.search,color: Colors.black,),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.mark_chat_read_outlined,color: Colors.black,),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.music_note_outlined,color: Colors.black,),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(itemCount: roomData.length ,controller: scroll ,itemBuilder: (c, i){
        return GestureDetector(
          onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (c) => chattingpage()),
            );
          },
          child: Container(
            color: Colors.white,
            margin: EdgeInsets.fromLTRB(2, 3, 2, 3),
            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
            width: double.infinity,
            height: 70,
            child: Row(
              children: [
                Container(//사진
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(13))
                  ),
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  width: 50,
                  height: 50,
                ),
                Column(//채팅방 이름, 내용
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(roomData[i]['name'].toString()),
                    Text(roomData[i]['text'].toString()),
                  ],
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}