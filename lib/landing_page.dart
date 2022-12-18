// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDtPNHMgwzqG9s1UwswEqz_TQ_flJ5FjYeuN6JMkwvm-uHxk8FTagLwPPDWtCPX7L1Y9s&usqp=CAU'),
        ],
      ),
    );
  }
}
