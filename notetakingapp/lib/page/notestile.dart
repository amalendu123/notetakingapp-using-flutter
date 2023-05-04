import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Notetile extends StatelessWidget {
  final String titleName;
  Notetile({super.key, required this.titleName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25, top: 25),
      child: Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 193, 99, 48),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Text(
              titleName,
              style: TextStyle(),
            ),
          ],
        ),
      ),
    );
  }
}
