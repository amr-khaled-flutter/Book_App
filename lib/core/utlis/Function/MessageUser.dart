
import 'package:flutter/material.dart';

void messageUser(context,{required String text}) {
  ScaffoldMessenger.of(
    context,
  ).showSnackBar(SnackBar(content: Text(text)));
}
