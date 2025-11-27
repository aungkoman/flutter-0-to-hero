import 'package:flutter/material.dart';

class CiscoPage extends StatefulWidget {
  const CiscoPage({super.key});

  @override
  State<CiscoPage> createState() => _CiscoPageState();
}

class _CiscoPageState extends State<CiscoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cisco"),
      ),
      body: Column(
        children: [
          ListTile(
            leading: Icon(Icons.phone),
            title: Text("09 2134234 24"),
          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text("aungko@gmail.com"),
          )
        ],
      ),
    );
  }
}
