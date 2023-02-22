import 'package:flutter/material.dart';
import 'package:screen_config/screen_config.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Wrap(
        children: [
          Flexible(
            child: SizedBox(
              width: ScreenConfig.blockSizeHorizontal * 60,
              height: ScreenConfig.blockSizeVertical * 30,
              child: Container(
                width: 100,
                height: 50,
                color: Colors.red,
              ),
            ),
          ),
          Flexible(
            child: SizedBox(
              width: ScreenConfig.blockSizeHorizontal * 40,
              height: ScreenConfig.blockSizeVertical * 45,
              child: Container(
                color: Colors.green,
              ),
            ),
          ),
          Flexible(
            child: SizedBox(
              width: ScreenConfig.blockSizeHorizontal * 40,
              height: ScreenConfig.blockSizeVertical * 25,
              child: Container(
                color: Colors.blue,
              ),
            ),
          ),
          Flexible(
            child: SizedBox(
              width: ScreenConfig.blockSizeHorizontal * 40,
              height: ScreenConfig.blockSizeVertical * 30,
              child: Container(
                color: Colors.orange,
              ),
            ),
          ),
          Flexible(
            child: SizedBox(
              width: ScreenConfig.blockSizeHorizontal * 40,
              height: ScreenConfig.blockSizeVertical * 25,
              child: Container(
                color: Colors.purple,
              ),
            ),
          ),
          Flexible(
            child: SizedBox(
              width: ScreenConfig.blockSizeHorizontal * 60,
              height: ScreenConfig.blockSizeVertical * 45,
              child: Container(
                color: Colors.yellow,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
