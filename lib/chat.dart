import 'package:flutter/material.dart';
import 'package:katalk/chattingpage.dart';
import 'package:katalk/main.dart';
import 'package:provider/provider.dart';
import 'addchatroom.dart';

class Chat extends StatefulWidget {
  Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  var scroll = ScrollController();

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
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (c) => AddChattingRoom()));
            },
          ),
          IconButton(
            icon: Icon(Icons.music_note_outlined,color: Colors.black,),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(itemCount: context.watch<RoomData>().chattingRoom.length ,controller: scroll ,itemBuilder: (c, i){
        return GestureDetector(
          onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (c) => ChattingPage()),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(context.watch<RoomData>().chattingRoom[i]['name'].toString()),
                    Text(context.watch<RoomData>().chattingRoom[i]['text'] != null ?
                    context.watch<RoomData>().chattingRoom[i]['text'].toString() : ''),
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