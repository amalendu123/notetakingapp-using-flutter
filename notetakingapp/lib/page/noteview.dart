import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Noteview extends StatelessWidget {
  final String notess;
  Noteview({super.key, required this.notess});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Note"),
      ),
      body: SafeArea(
        child: Container(
          child: Text(notess),
        ),
      ),
    );
  }
}
