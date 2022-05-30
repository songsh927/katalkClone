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
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Text('사진',style: TextStyle(color: Colors.black),),
            Text('이름'),
          ],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble), label: '1:1채팅'),
          BottomNavigationBarItem(icon: Icon(Icons.call), label: '통화하기')
        ],
      ),
    );
  }
}
