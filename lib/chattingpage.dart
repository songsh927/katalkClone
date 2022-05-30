import 'package:flutter/material.dart';

class chattingpage extends StatelessWidget {
  const chattingpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('채팅',style: TextStyle(color: Colors.black),),
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios,color: Colors.black,)),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search,color: Colors.black,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.menu,color: Colors.black,)),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
        color: Colors.lightBlue[200],
        child: Column(
          children: [
            Flexible(
              flex: 9,
              fit: FlexFit.tight,
              child: SizedBox()
            ),
            Flexible(
              child: Container(
                color: Colors.white,
                width: double.infinity,
                height: 30,
                child: TextField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))
                    )
                  ),
                  ),
              ),
            )
          ],
        )
      ),
    );
  }
}
