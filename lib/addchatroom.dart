import 'package:flutter/material.dart';
import 'package:katalk/main.dart';
import 'package:provider/provider.dart';

import 'chattingpage.dart';

class AddChattingRoom extends StatefulWidget {
  AddChattingRoom({Key? key}) : super(key: key);

  @override
  State<AddChattingRoom> createState() => _AddChattingRoomState();
}

class _AddChattingRoomState extends State<AddChattingRoom> {
  var scroll = ScrollController();
  late List<bool> _isSelected;
  var count = 0;
  var index;

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    _isSelected = List<bool>.filled(context.watch<UserData>().friendList.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },
          icon: Icon(Icons.close,color: Colors.black,),),
        title: Text('대화상대 선택',style: TextStyle(color: Colors.black),),
        actions: [
          TextButton(
              onPressed: (){
                if(count == 0){
                  Navigator.pop(context);
                }else if(count == 1){
                  Navigator.pop(context);
                  context.read<UserData>().addRoom(context.read<UserData>().friendList[index]['id']);
                  Navigator.push(context, MaterialPageRoute(builder: (c) => ChattingPage(roomId: context.read<UserData>().chattingRoom.length,)));
                }
              },
              child: Text('확인',style: TextStyle(fontSize: 14),)
          )
        ],
      ),
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children :[
            Container(
              margin: EdgeInsets.all(5),
              width: double.infinity,
              height: 40,
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(8),
                  hintText: '이름, 전화번호 검색',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.black),
                  )
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(itemCount: context.watch<UserData>().friendList.length,controller: scroll, itemBuilder: (c,i){
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
                      ),
                      Text(context.watch<UserData>().friendList[i]['name'].toString()),
                      Checkbox(
                        value: _isSelected[i],
                        onChanged: (value){
                          setState(() {
                            index = i;
                            if(_isSelected[i] == false){
                              _isSelected[i] = value!;
                              count++;
                            }else{
                              _isSelected[i] = value!;
                              count--;
                            }
                          });
                          },
                      ),
                    ],
                  ),
                );
              }),
            ),
          ]
        ),
      ),
    );
  }
}
