import 'package:flutter/material.dart';
import 'package:zerohero/cisco_page.dart';
import 'package:zerohero/mgaye_page.dart';
import 'package:zerohero/model/student.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // variable
  List<String> nameList = ["Cisco", "Mg Aye", "Mg Ant", "Honey", "Mg Nyan", "Ma Pa Pa"];

  List<Student> studentList = [
    Student(name: "Cisco", major: "CS", studentId: "AU001", birthday: "1990-12-30", address: "NPT,MM", year: 4),
    Student(name: "Mg Ant", major: "CT", studentId: "AU002", birthday: "2003-12-30", address: "MDY,MM", year: 3),
    Student(name: "Mg Aye", major: "CS", studentId: "AU003", birthday: "1003-12-30", address: "BKK,THB", year: 3),
    Student(name: "Honey", major: "CS", studentId: "AU004", birthday: "1990-12-30", address: "NPT,MM", year: 2),
  ];

  // List<String> majorList = ["CS", "CT", "IT", "Math", "Phtyos"]

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AU Connect"),
      ),
      body: ListView(
        children: List.generate(studentList.length, (index){
          return ListTile(
              leading: Icon(Icons.person),
              title: Text(studentList[index].name),
              subtitle: Text(studentList[index].major + " | " + studentList[index].birthday),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: (){
                // TODO: navigate to student detail page along with student information.
              },
          );
        }),
        // children: [

          // ...nameList.map((name) => ListTile(
          //   leading: Icon(Icons.person),
          //   title: Text(name),
          //   subtitle: Text("major"),
          //   trailing: Icon(Icons.arrow_forward_ios),
          // ))
        // ],
      ),
    );
  }
}
