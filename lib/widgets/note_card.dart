import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:note_application/styles/app_style.dart';

Widget noteCard(Function()? onTap, QueryDocumentSnapshot doc) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppStyle.cardsColor[doc['color_id']],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            doc['note_title'],
            style: AppStyle.title,
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            doc['note_date_time'],
            style: AppStyle.dateTitle,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            doc['note_content'],
            style: AppStyle.content,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    ),
  );
}
