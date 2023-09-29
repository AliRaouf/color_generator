import 'package:flutter/material.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String hexCode = "0xffFFFFFF";
  Color rndcolor = Color(0xffFFFFFF);
  RandomColor(){
    setState(() {
      rndcolor=Color(Random().nextInt(0xffffffff));
      hexCode="#${rndcolor.value.toRadixString(16)}";
      print("$rndcolor and $hexCode");
    });
  }
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xffADD7EE),
          centerTitle: true,
          shadowColor: Colors.transparent,
          title: Text("Random Color Generator")),
      backgroundColor: Color(0xff8B9EB7),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
              child: Container(
            width: screenwidth * 0.65,
            height: screenheight * 0.1,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(45)),
            child: Center(
                child: Text("$hexCode",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
          )),
          Container(
            width: screenwidth * 0.8,
            height: screenheight * 0.25,
            decoration: BoxDecoration(
                color: rndcolor, borderRadius: BorderRadius.circular(20)),
          ),
          ElevatedButton(
            onPressed: () {
              RandomColor();
            },
            child: Text(
              "Generate a Color",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            style: ButtonStyle(
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(45))),
                minimumSize: MaterialStatePropertyAll(
                    Size(screenwidth * 0.65, screenheight * 0.12)),
                backgroundColor: MaterialStatePropertyAll(Color(0xff0A122A))),
          )
        ],
      ),
    );
  }
}
