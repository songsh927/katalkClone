import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  var scroll = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 10,
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
      body: ListView.builder(itemCount: 25, controller: scroll, itemBuilder: (c, i){
        return Container(
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(2, 3, 2, 3),

          height: 50,
          child: Row(
            children: [
              Container(
                // decoration: BoxDecoration(
                //
                // ),
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                color: Colors.grey,
                height: 40,
                width: 40,
              ),
              Text(i == 0 ? '사용자': '친구')
            ],
          ),
        );
      }),
    );
  }
}