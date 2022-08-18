import 'package:flutter/material.dart';
import 'package:katalk/join.dart';
import 'package:provider/provider.dart';

import 'main.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  var idController = TextEditingController();
  var pwController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Katalk'),
              Container(
                margin: EdgeInsets.all(30),
                width: double.infinity,
                height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: idController,
                      maxLength: 20,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        hintText: '아이디',
                      ),
                    ),
                    TextField(
                      keyboardType: TextInputType.multiline,
                      controller: pwController,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(8),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                        hintText: '비밀번호'
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        OutlinedButton(
                          onPressed: ()async{
                            if(await context.read<UserData>().login(idController.text,pwController.text)){
                              Navigator.push(context, MaterialPageRoute(builder: (c)=> MyApp()));
                            }
                          },
                          child: Text('확인'),
                          style: OutlinedButton.styleFrom(
                            fixedSize: Size(90, 50)
                          ),
                        ),
                        OutlinedButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (c) => JoinPage()));
                          },
                          child: Text('회원가입'),
                          style: OutlinedButton.styleFrom(
                              fixedSize: Size(90, 50)
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
      ),
    );
  }
}
