import 'package:flutter/material.dart';
import 'package:flutter_news_mvvm/core/widgets/action_button.dart';

class DetailAppbar extends StatelessWidget {
  String title;

  DetailAppbar(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        children: [
          ActionButton('chevron.left', onTap: () => Navigator.pop(context)),
          Center(
              child: Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )),
        ],
      ),
    );
  }
}
