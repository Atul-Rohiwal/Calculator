import 'package:flutter/material.dart';
import 'package:calculator/UI/Home.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CalculatorHomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: Image.asset("Assets/helo.jpg", fit: BoxFit.cover),
          ),
        ),
        Container(
          height: 150,
          width: double.infinity,
          color: Colors.green,
          child: TextButton(
            onPressed: () {
              Future.delayed(Duration(seconds: 5), () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CalculatorHomePage()));
              });
            },
            child: Text(
              "Continue ==>",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
