import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  Chat({Key? key}) : super(key: key);
  var scroll = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 10,
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
      body: ListView.builder(itemCount: 18,controller: scroll ,itemBuilder: (c, i){
        return Container(
          margin: EdgeInsets.fromLTRB(2, 3, 2, 3),
          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
          width: double.infinity,
          height: 70,
          child: Row(
            children: [
              Container(//사진
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                width: 50,
                height: 50,
                color: Colors.grey,
              ),
              Column(//채팅방 이름, 내용
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('name'),
                  Text('text'),
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}