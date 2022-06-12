import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChattingPage extends StatefulWidget {
  ChattingPage({Key? key}) : super(key: key);

  @override
  State<ChattingPage> createState() => _chattingpageState();
}

class _chattingpageState extends State<ChattingPage> {
  var textController = TextEditingController();
  var scroll = ScrollController();
  DateTime now = DateTime.now();

  var message = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: Text('채팅',style: TextStyle(color: Colors.black),),
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios,color: Colors.black,)),
        actions: [
          IconButton(onPressed: (){

          }, icon: Icon(Icons.search,color: Colors.black,)),
          IconButton(onPressed: (){

          }, icon: Icon(Icons.menu,color: Colors.black,)),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),

      extendBodyBehindAppBar: true,

      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          color: Colors.lightBlue[200],
          child: Column(
            children: [
              Flexible(
                flex: 9,
                fit: FlexFit.tight,
                child: ListView.builder(
                      itemCount: message.length ,
                      controller: scroll ,
                      itemBuilder: (c, i){
                        return Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(DateFormat.Hm().format(now), style: TextStyle(fontSize: 12),),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),
                                height: 40,
                                margin: EdgeInsets.fromLTRB(5, 2, 5, 2),
                                padding: EdgeInsets.all(10),
                                child: Text(message[i]),
                              )
                            ],
                          );
                      }),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  alignment: Alignment.topCenter,
                        padding: EdgeInsets.fromLTRB(2, 2, 5, 2),
                          color: Colors.white,
                          width: double.infinity,
                          child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                      onPressed: (){},
                                      icon: Icon(Icons.add_box_outlined)),

                                  Flexible(
                                    fit: FlexFit.tight,
                                    child: TextField(
                                      keyboardType: TextInputType.multiline,
                                      minLines: 1,
                                      maxLines: 5,
                                      controller: textController,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        contentPadding: EdgeInsets.all(8),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(9)
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(9)
                                        )
                                      ),
                                      ),
                                  ),

                                  IconButton(
                                      onPressed: (){
                                        if(textController.text != ''){
                                          setState(() {
                                            message.add(textController.text);
                                          });
                                          textController.clear();
                                        }
                                      },
                                      icon: Icon(Icons.send))
                            ],
                          ),
                        ),
              ),
            ],
          )
        ),
      ),
    );
  }
}
