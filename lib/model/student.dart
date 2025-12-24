// Data Model - Student
class Student {
  // properties | attributes
  String name;
  String major;
  String studentId;
  String birthday;
  String address;
  int year;

  // Constructor
  Student({
    required this.name,
    required this.major,
    required this.studentId,
    required this.birthday,
    required this.address,
    required this.year,
  });
}