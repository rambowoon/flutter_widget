import 'package:flutter/material.dart';

class DemoInheritedWidget extends StatefulWidget {
  const DemoInheritedWidget({Key? key}) : super(key: key);

  @override
  State<DemoInheritedWidget> createState() => _DemoInheritedWidgetState();
}

class _DemoInheritedWidgetState extends State<DemoInheritedWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Inherited"),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: InheritedContainer(
          listWidget: [
            TextWidget(text: "Widget 1")
          ],
        ),
      ),
    );
  }
}

class InheritedContainer extends StatefulWidget {
  List<Widget>? listWidget;
  InheritedContainer({Key? key, this.listWidget}) : super(key: key);

  @override
  State<InheritedContainer> createState() => _InheritedContainerState();
}

class _InheritedContainerState extends State<InheritedContainer> {
  @override
  Widget build(BuildContext context) {
    final widgetParent = widget.listWidget?[0] ?? SizedBox();
    return Container(
      constraints: BoxConstraints.expand(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          widgetParent,
          ElevatedButton(
              onPressed: (){

              },
              child: Text("Change Text")
          )
        ],
      ),
    );
  }
}


class TextWidget extends StatelessWidget {
  String text = "";
  TextWidget({Key? key, String text = ""}) : super(key: key){
    this.text = text;
  }

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}
