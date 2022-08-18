import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:katalk/main.dart';
import 'package:provider/provider.dart';

class ChattingPage extends StatefulWidget {
  ChattingPage({Key? key, this.roomId}) : super(key: key);

  final roomId;
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
                      itemCount: context.read<UserData>().chattingRoom[widget.roomId-1]['text'].length,//message.length ,
                      controller: scroll ,
                      itemBuilder: (c, i){
                        return Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(context.read<UserData>().chattingRoom[widget.roomId-1]['text'][i]['time'].toString(), style: TextStyle(fontSize: 12),),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),
                                height: 40,
                                margin: EdgeInsets.fromLTRB(5, 2, 5, 2),
                                padding: EdgeInsets.all(10),
                                child: Text(context.read<UserData>().chattingRoom[widget.roomId-1]['text'][i]['text'].toString()),
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
                                          context.read<UserData>().chattingRoom[widget.roomId-1]['text']
                                              .add({
                                            'name':context.read<UserData>().userInfo['name'],
                                            'text':textController.text,
                                            'time': DateFormat.Hm().format(now)
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
