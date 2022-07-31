import 'dart:ui';

import 'package:flutter/material.dart';

class LifeCycleWidget extends StatefulWidget {
  const LifeCycleWidget({Key? key}) : super(key: key);

  @override
  State<LifeCycleWidget> createState() => _LifeCycleWidgetState();
}

class _LifeCycleWidgetState extends State<LifeCycleWidget> {
  TextEditingController textControllerNumber1 = TextEditingController();
  TextEditingController textControllerNumber2 = TextEditingController();
  var result;

  void onPressButtonPlus(){
    var textNumber1 = textControllerNumber1.text;
    var textNumber2 = textControllerNumber2.text;
    setState() {
      if (textNumber1.isNotEmpty && textNumber2.isNotEmpty) {
        result = int.parse(textNumber1) + int.parse(textNumber2);
      }
    }
  }
  void onPressButtonMinute(){

  }
  void onPressButtonCore(){

  }
  void onPressButtonDivide(){

  }

  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("didChangeDependencies");
  }

  @override
  void didUpdateWidget(covariant LifeCycleWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  Widget build(BuildContext context) {
    print("didBuildWidget");
    return Scaffold(
      appBar: AppBar(
        title: Text("Lifecycle Widget"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        constraints: BoxConstraints.expand(),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  flex: 2,
                  child: Center(
                    child: Text("Máy tính bỏ ba lô",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 30,
                            fontWeight: FontWeight.w500)),
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        createTextFieldWidget(hintText: "Input Number 1", controller: textControllerNumber1),
                        createTextFieldWidget(hintText: "Input Number 2", controller: textControllerNumber2)
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    child: Visibility(
                      visible: result != null,
                      child: Text("Result: = ${result}", style: TextStyle(fontSize: 30, color: Colors.red),),
                    ),
                  ),
                ),
                Flexible(
                  flex: 4,
                  child: Container(
                    child: Column(
                      children: [
                        createRowButton(buttonName1: "Cộng", onPressButton1: onPressButtonPlus, buttonName2: "Trừ", onPressButton2: onPressButtonMinute),
                        createRowButton(buttonName1: "Nhân", onPressButton1: onPressButtonCore, buttonName2: "Chia", onPressButton2: onPressButtonDivide),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/**
 * @param String? hintText
 * @param Icon? preFixIcon
 * @param TextEditingController? controller
 * **/

Widget createTextFieldWidget({String? hintText, Icon? preFixIcon, TextEditingController? controller}) {
  return TextField(
    controller: controller,
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
        hintText: hintText,
        prefixIcon:preFixIcon,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 3, color: Colors.green),
        )
    ),
  );
}

Widget createRowButton({String buttonName1 = "", String buttonName2 = "", Function()? onPressButton1, Function()? onPressButton2}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      ElevatedButton(
        onPressed: onPressButton1,
        child: Text(buttonName1),
      ),
      ElevatedButton(
        onPressed: onPressButton2,
        child: Text(buttonName2)
      )
    ],
  );
}