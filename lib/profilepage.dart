import 'package:flutter/material.dart';

class profilepage extends StatelessWidget {
  const profilepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
          },
          icon: Icon(Icons.close,color: Colors.black,),),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.card_giftcard,color: Colors.black,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.attach_money,color: Colors.black,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.stars_rounded,color: Colors.black,))
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: double.infinity,
        color: Colors.blueGrey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.all(5),
              color: Colors.white,
              child: Text('사진',style: TextStyle(color: Colors.black,),)),
            Container(
              margin: EdgeInsets.fromLTRB(0, 5, 0, 30),
              child: Text('이름',style: TextStyle(fontSize: 25),)
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 30, 0, 30),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.white, width: 1),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.chat_bubble,color: Colors.white)),
                  IconButton(onPressed: (){}, icon: Icon(Icons.call,color: Colors.white,))

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

