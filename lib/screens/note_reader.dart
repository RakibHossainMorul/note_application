import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:note_application/styles/app_style.dart';

class NoteReaderScreen extends StatefulWidget {
  NoteReaderScreen(this.doc, {super.key});
  QueryDocumentSnapshot doc;
  @override
  State<NoteReaderScreen> createState() => _NoteReaderScreenState();
}

class _NoteReaderScreenState extends State<NoteReaderScreen> {
  @override
  Widget build(BuildContext context) {
    int colorId = widget.doc['color_id'];
    return Scaffold(
      backgroundColor: AppStyle.cardsColor[colorId],
      appBar: AppBar(
        backgroundColor: AppStyle.cardsColor[colorId],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.doc['note_title'],
              style: AppStyle.title,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              widget.doc['note_date_time'],
              style: AppStyle.dateTitle,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              widget.doc['note_content'],
              style: AppStyle.content,
            ),
          ],
        ),
      ),
    );
  }
}
