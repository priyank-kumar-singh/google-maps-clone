import 'package:flutter/material.dart';

class FloatingAppBar extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();

  void handleMoreOptions() {

  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
      margin: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.view_headline),
            splashRadius: 28.0,
            onPressed: handleMoreOptions,
          ),
          Expanded(
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: 'Search here',
              ),
            ),
          ),
          InkWell(
            child: CircleAvatar(
              backgroundImage: AssetImage('images/bug.jpg'),
              maxRadius: 18.0,
            ),
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
            onTap: () {},
          ),
          SizedBox(
            width: 8.0,
          ),
        ],
      )
    );
  }
}
