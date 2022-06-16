import 'package:flutter/material.dart';
import 'package:katalk/main.dart';
import 'package:provider/provider.dart';

class AddFriend extends StatelessWidget {
  AddFriend({Key? key}) : super(key: key);

  var phoneController = TextEditingController();
  var nameController = TextEditingController();
  var idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          },
            icon: Icon(Icons.close,color: Colors.black,),),
          title: Text('친구추가',style: TextStyle(color: Colors.black),),
        ),

        body: Container(
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.fromLTRB(5, 20, 5, 10),
                  child: TextField(
                    controller: phoneController,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.all(8),
                      hintText:'전화번호',
                    ),
                    maxLength: 11,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.all(8),
                      hintText: '이름'
                    ),
                    maxLength: 20,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
                  child: TextField(
                    controller: idController,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.all(8),
                      hintText: 'ID'
                    ),
                    maxLength: 20,
                  ),
                ),
                OutlinedButton(
                  onPressed: (){

                    context.read<UserData>().addFriendList(phoneController.text, nameController.text, idController.text);

                    Navigator.pop(context);
                  },
                  style: OutlinedButton.styleFrom(
                    fixedSize: Size(100, 50),
                  ),
                  child: Text('찾기'),
                ),
              ],
            ),
          ),
      ),
    );
  }
}
