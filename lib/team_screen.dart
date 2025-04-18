
import 'package:flutter/material.dart';

class TeamScreen extends StatefulWidget {
  final String userName;
  TeamScreen({required this.userName});
  @override _TeamScreenState createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
  List<String> members = [];
  String teamId = 'مدار';
  @override
  void initState(){
    super.initState();
    members.add(widget.userName);
  }
  void _invite(){
    final link = 'https://madar.app/join?team=$teamId';
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text('تم نسخ رابط الدعوة: $link')));
  }
  void _ptt(){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text('جارٍ الاتصال الصوتي...')));
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title:Text('فريق $teamId'), actions:[
        IconButton(icon:Icon(Icons.logout), onPressed:()=>Navigator.pop(context))
      ]),
      body: Padding(padding:EdgeInsets.all(16), child: Column(children:[
        Text('مرحبًا، ${widget.userName}', style:TextStyle(fontSize:20)),
        SizedBox(height:10),
        ElevatedButton(onPressed:_invite, child:Text('إرسال دعوة'), style: ElevatedButton.styleFrom(primary:Colors.green)),
        SizedBox(height:10),
        ElevatedButton(onPressed:_ptt, child:Text('اتصال مباشر'), style: ElevatedButton.styleFrom(primary:Colors.green)),
        SizedBox(height:20),
        Text('قائمة الفريق:', style:TextStyle(fontSize:18)),
        Expanded(
          child: members.isEmpty
            ? Center(child:Text('(القائمة فارغة)', style:TextStyle(color:Colors.grey)))
            : ListView.builder(itemCount:members.length, itemBuilder:(c,i)=>ListTile(title:Text(members[i])))
        )
      ])),
    );
  }
}
