import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zerohero/providers/diary_provider.dart';

class DiaryListPage extends StatefulWidget {
  const DiaryListPage({super.key});

  @override
  State<DiaryListPage> createState() => _DiaryListPageState();
}

class _DiaryListPageState extends State<DiaryListPage> {


  @override
  Widget build(BuildContext context) {

    final diaryProvider = Provider.of<DiaryProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Diary List"),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return Text(diaryProvider.diaries[index].content);
          },
          separatorBuilder: (context, index) => const Divider(),
          itemCount: diaryProvider.diaries.length
      )
    );
  }
}
