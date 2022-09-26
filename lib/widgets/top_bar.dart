import 'package:flutter/material.dart';

class TopBar extends StatefulWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          Text(
            "Quicksand",
            style: TextStyle(
                fontSize: 40,
                fontFamily: 'Quicksand'
            ),
          ),
          SizedBox(width: 120),
          Icon(
            Icons.notifications,
            size: 40,
          )
        ],
      ),
    );
  }
}
