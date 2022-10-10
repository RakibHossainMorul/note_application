import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:note_application/styles/app_style.dart';

class NoteEditorScreen extends StatefulWidget {
  const NoteEditorScreen({super.key});

  @override
  State<NoteEditorScreen> createState() => _NoteEditorScreenState();
}

class _NoteEditorScreenState extends State<NoteEditorScreen> {
  int colorId = Random().nextInt(AppStyle.cardsColor.length);
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _mainController = TextEditingController();
  String date = DateTime.now().toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.cardsColor[colorId],
      appBar: AppBar(
        backgroundColor: AppStyle.cardsColor[colorId],
        elevation: 0.0,
        title: const Text(
          "Add new note",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: 'Note Title'),
              style: AppStyle.title,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              date,
              style: AppStyle.dateTitle,
            ),
            const SizedBox(
              height: 28,
            ),
            TextField(
              controller: _mainController,
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: 'Content here'),
              style: AppStyle.content,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppStyle.accentColor,
        onPressed: () async {
          FirebaseFirestore.instance.collection('notes').add({
            'note_title': _titleController.text,
            'note_content': _mainController.text,
            'note_date_time': date,
            'color_id': colorId
          }).then((value) {
            //print(value.id);
            Navigator.pop(context);
          }).catchError(
              (error) => print("Failed to add data to database $error"));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
