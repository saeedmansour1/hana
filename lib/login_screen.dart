
import 'package:flutter/material.dart';
import 'team_screen.dart';

class LoginScreen extends StatefulWidget {
  @override _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _nameCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('مدار', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.green[800])),
              SizedBox(height:20),
              TextField(controller: _nameCtrl, decoration: InputDecoration(labelText:'ادخل اسمك', border:OutlineInputBorder())),
              SizedBox(height:20),
              ElevatedButton(onPressed:(){
                if(_nameCtrl.text.trim().isNotEmpty){
                  Navigator.push(context, MaterialPageRoute(builder:_=>TeamScreen(userName:_nameCtrl.text.trim())));
                }
              }, child: Text('دخول'), style: ElevatedButton.styleFrom(primary:Colors.green))
            ],
          ),
        ),
      ),
    );
  }
}
