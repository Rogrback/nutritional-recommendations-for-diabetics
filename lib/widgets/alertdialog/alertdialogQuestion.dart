import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertdialogQuestion extends StatefulWidget {

  final String title;
  final String content;
  final Function()? yesAction;
  final Function()? noAction;

  const AlertdialogQuestion({
    super.key,
    required this.title,
    required this.content,
    this.yesAction,
    this.noAction,
  });

  @override
  State<AlertdialogQuestion> createState() => _AlertdialogQuestionState();
}

class _AlertdialogQuestionState extends State<AlertdialogQuestion> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}