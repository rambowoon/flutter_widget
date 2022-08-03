import 'dart:math';
import 'package:flutter/material.dart';

class DemoKeyWidget extends StatefulWidget {
  const DemoKeyWidget({Key? key}) : super(key: key);

  @override
  State<DemoKeyWidget> createState() => _DemoKeyWidgetState();
}

class _DemoKeyWidgetState extends State<DemoKeyWidget> {
  var listTile = <Widget>[Tile(key: UniqueKey()), Tile(key: UniqueKey())]; // tạo 1 list lưu trữ 2 Widget

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: listTile, // Row nhận một list Widget nên mình truyền listTile vào
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: swapTwoTileWidget,
        // thực hiện hoán đổi vị trí 2 Widget trong listTile
        child: Icon(Icons.swap_horiz),
      ),
    );
  }

  // hàm thực hiện hoán đổi 2 Widget trong listTile
  void swapTwoTileWidget() {
    setState(() {
      var tmp = listTile.removeAt(0);
      listTile.add(tmp); // (*)
    });
  }
}

class Tile extends StatefulWidget {
  @override
  Tile({Key? key}) : super(key: key);
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> {
  final Color color = generateRandomColor();
  // mỗi object sẽ có 1 random Color không thể thay đổi
  @override
  Widget build(BuildContext context) {
    // tạm hiểu Container như cái thùng có màu sắc, kích thước => khá giống viên gạch =))
    return Container(
      color: color,
      width: 100,
      height: 100,
    );
  }
}

// hàm tạo ra một Color bất kỳ
Color generateRandomColor() {
  // biến random sẽ giúp ta tạo ra 1 số ngẫu nhiên
  final Random random = Random();

  // Màu sắc được tạo nên từ RGB, là một số ngẫu nhiên từ 0 -> 255 và opacity = 1
  return Color.fromRGBO(random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
}