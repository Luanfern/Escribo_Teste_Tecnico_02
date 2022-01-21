import 'package:flutter/material.dart';

class GridBoard extends StatefulWidget {
  Color color;
  int position;
  GridBoard({Key? key, required this.color, required this.position}) : super(key: key);

  @override
  _GridBoardState createState() => _GridBoardState();
}

class _GridBoardState extends State<GridBoard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width - 10,
      height: MediaQuery.of(context).size.width - 10,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: GridView.count(
          crossAxisCount: 10,
          children: [
            for (int i = 100; i > 0; i--)
              /* ladders.contains(i) */
              widget.position == i
                  ? Container(
                      color: widget.color,
                    )
                  : Container(),
          ],
        ),
      ),
    );
  }
}