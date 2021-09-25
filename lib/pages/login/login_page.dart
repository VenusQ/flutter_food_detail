import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var input = '';
  int six = 6;
  int count = 0;

  void _showMaterialDialog(String title, String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(msg),
          actions: [
            // ปุ่ม OK ใน dialog
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                // ปิด dialog
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            // ไล่เฉดจากมุมบนซ้ายไปมุมล่างขวาของ Container
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            // ไล่เฉดจากสีแดงไปสีน้ำเงิน
            colors: [
              Colors.white,
              Colors.blue
            ],
          ),
        ),

        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.lock_outline,
                            size: 100.0,
                          ),
                          Text(
                            "LOGIN",
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          Text('Enter PIN to LOGIN'),
                          SizedBox(height: 50,),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for(var i=0;i<count;i++)
                            Icon(Icons.circle),
                          for(var i=0;i<six-count;i++)
                            Icon(Icons.circle,color: Colors.white,)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                /*color: Colors.pink,*/
                child: Column(
                  children: [
                    [1, 2, 3],
                    [4, 5, 6],
                    [7, 8, 9],
                    [-2, 0, -1],
                  ].map((row) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: row.map((item) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: LoginButton(
                            number: item,
                            onClick: _handleClickButton,
                          ),
                        );
                      }).toList(),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleClickButton(int num) {
    print('hello $num');

    setState(() {
      if(num == -1){
        if(count<1){
          count=1;
        }
        count--;
        if(input.length > 0)
          input = input.substring(0, input.length - 1);
      }
      else if(input == '12345' && num ==6){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      }
      else if((input.length) == 5){
        count = 0;
        print(input);
        input = "";
        _showMaterialDialog('ERROR', 'Invalid PIN Please try again!');
      }
      else{
        count++;
        input = '$input$num';
      }
    });

  }
}


class LoginButton extends StatelessWidget {
  final int number;
  final Function(int) onClick;


  const LoginButton({
    required this.number,
    required this.onClick,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: CircleBorder(),
      onTap: number == -2 ? null:(){
        onClick(number);
      },
      child: Container(
        width: 80.0,
        height: 80.0,
        decoration: number == -2 ? null :BoxDecoration(
            shape: BoxShape.circle, border: Border.all(width: 3.0)),
        child: Center(
          child: number >= 0 ? Text(
            '$number',
            style: Theme.of(context).textTheme.headline6,
          ) : (number == -1 ? Icon(Icons.backspace_outlined) : SizedBox.shrink()),
        ),
      ),
    );
  }
}