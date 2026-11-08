import 'package:flutter/material.dart';

class customtextfeild extends StatelessWidget {
  Function(String)? onSubmitted;
   customtextfeild({required this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        hintText: 'Searching Books',
        hintStyle: TextStyle(fontSize: 20, color: Colors.white),
        suffixIcon: Opacity(
          opacity: 0.7,
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, size: 35, color: Colors.white),
          ),
        ),
        enabledBorder: outlineInputborder(),
        focusedBorder: outlineInputborder(),
      ),
    );
  }

  OutlineInputBorder outlineInputborder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: Colors.white),
    );
  }
}
