import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  TextEditingController emailcontroller= TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
  void login(email,password) async{
    try{
        Response response= await post(Uri.parse('https://reqres.in/api/register'),
        body: {
          'email':email,
           'password':password
        }
        );
        if(response.statusCode==200){
          print('account created Sucesfulli');
        }
        else{
          print('something wrong');
        }
    }
    catch(e){
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Signup with rest api"),

      ),
      body: Column(
        children: [
          TextFormField(
            controller: emailcontroller,
            decoration: InputDecoration(
              hintText: 'Email'
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: passwordcontroller,
            decoration: InputDecoration(
              hintText: "password",
            ),
          ),
          SizedBox(
            height: 40,
          ),
          GestureDetector(
            onTap: (){
              login(emailcontroller.text.toString(),passwordcontroller.text.toString());
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(10),

              ),
              child: Text("signup"),
            ),
          )
        ],
      ),
    );
  }
}
