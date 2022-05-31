import 'package:flutter/material.dart';

class profilepage extends StatelessWidget {
  const profilepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(onPressed: (){Navigator.pop(context);},icon: Icon(Icons.close,color: Colors.black,),),
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Text('사진',style: TextStyle(color: Colors.black),),
            Text('이름'),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border(
                  top: BorderSide(color: Colors.white),
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


//BottomNavigationBarItem(icon: Icon(Icons.chat_bubble,color: Colors.white,), label: '1:1채팅'),
//           BottomNavigationBarItem(icon: Icon(Icons.call,color: Colors.white,), label: '통화하기')
//