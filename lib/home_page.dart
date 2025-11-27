import 'package:flutter/material.dart';
import 'package:zerohero/cisco_page.dart';
import 'package:zerohero/mgaye_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AU Connect"),
      ),
      body: Column(
        children: [
          InkWell(
            onTap: (){
              print("Cisco was tapped");
              print("hello");
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (context) => const CiscoPage(),
                ),
              );
            },
            child: Row(
              children: [
                SizedBox(width: 24.0,),
                Icon(Icons.person, size: 50,),
                SizedBox(width: 24.0,),
                Text("Cisco", style: TextStyle(fontSize: 24),)
              ],
            ),
          ),
          SizedBox(height: 24,),
          InkWell(
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (context) => const MgayePage(),
                ),
              );
            },
            child: Row(
              children: [
                SizedBox(width: 24.0,),
                Icon(Icons.person, size: 50,),
                SizedBox(width: 24.0,),
                Text("Mg Aye", style: TextStyle(fontSize: 24),)
              ],
            ),
          ),
          SizedBox(height: 24,),
          Row(
            children: [
              SizedBox(width: 24.0,),
              Icon(Icons.person, size: 50,),
              SizedBox(width: 24.0,),
              Text("Mg Ant", style: TextStyle(fontSize: 24),)
            ],
          )
        ],
      ),
    );
  }
}
