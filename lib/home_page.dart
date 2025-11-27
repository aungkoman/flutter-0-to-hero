import 'package:flutter/material.dart';
import 'package:zerohero/cisco_page.dart';
import 'package:zerohero/mgaye_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // variable
  List<String> nameList = ["Cisco", "Mg Aye", "Mg Ant", "Honey", "Mg Nyan", "Ma Pa Pa"];
  // List<String> majorList = ["CS", "CT", "IT", "Math", "Phtyos"]

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AU Connect"),
      ),
      body: ListView(
        children: [
          ...nameList.map((name) => ListTile(
            leading: Icon(Icons.person),
            title: Text(name),
            subtitle: Text("major"),
            trailing: Icon(Icons.arrow_forward_ios),
          ))
        ],
      ),
    );
  }
}
