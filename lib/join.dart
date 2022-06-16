import 'package:flutter/material.dart';
import 'package:katalk/main.dart';
import 'package:provider/provider.dart';

class JoinPage extends StatelessWidget {
  JoinPage({Key? key}) : super(key: key);

  var phoneController = TextEditingController();
  var nameController = TextEditingController();
  var idController = TextEditingController();
  var pwController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('회원가입'),
              Container(
                margin: EdgeInsets.all(30),
                width: double.infinity,
                height: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      keyboardType: TextInputType.multiline,
                      controller: nameController,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(8),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          hintText: '이름'
                      ),
                    ),
                    TextField(
                      keyboardType: TextInputType.multiline,
                      controller: phoneController,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(8),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          hintText: '전화번호'
                      ),
                    ),
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
                          onPressed: (){
                            context.read<UserData>().join(
                                nameController.text,
                                phoneController.text,
                                idController.text,
                                pwController.text
                            );
                          },
                          child: Text('확인'),
                          style: OutlinedButton.styleFrom(
                              fixedSize: Size(90, 50)
                          ),
                        ),
                        OutlinedButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          child: Text('취소'),
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
      ),
    );
  }
}
