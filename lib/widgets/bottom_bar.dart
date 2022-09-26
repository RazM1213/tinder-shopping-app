import 'package:flutter/material.dart';

import 'button_widget.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 120,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buttonWidget(Icons.refresh, Colors.amber),
            buttonWidget(Icons.close, Colors.red),
            buttonWidget(Icons.star, Colors.blue),
            buttonWidget(Icons.favorite, Colors.red),
          ],
        )
    );
  }
}
