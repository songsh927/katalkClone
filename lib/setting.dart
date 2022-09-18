import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

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
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(17)),
                      ),
                      margin: EdgeInsets.fromLTRB(0, 5, 10, 5),
                      height: 40,
                      width: 40,
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

                OutlinedButton(child: Text('프로필 수정'), onPressed: (){})
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
              onTap: (){},
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