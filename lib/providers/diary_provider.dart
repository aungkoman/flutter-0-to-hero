import 'package:flutter/material.dart';
import 'package:zerohero/model/Diary.dart';

class DiaryProvider extends ChangeNotifier{
  final List<Diary> diaries = [
    Diary(content: "Content One"),
    Diary(content: "Content Two"),
    Diary(content: "Content Three"),
    Diary(content: "Content Four"),
  ];

  void addDiary(Diary newDiary){
    diaries.add(newDiary);
    notifyListeners();
  }

}