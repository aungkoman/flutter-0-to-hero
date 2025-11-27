import 'package:flutter/material.dart';

class MgayePage extends StatefulWidget {
  const MgayePage({super.key});

  @override
  State<MgayePage> createState() => _MgayePageState();
}

class _MgayePageState extends State<MgayePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mg Aye"),
      ),
      body: Column(
        children: [
          ListTile(
            leading: Icon(Icons.phone),
            title: Text("09 54645 345"),
          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text("asdfasdf@gmail.com"),
          )
        ],
      ),
    );
  }
}
