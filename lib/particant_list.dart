// ignore_for_file: unnecessary_import

import 'package:flutter/material.dart';

class ParticipantList extends StatefulWidget {
  const ParticipantList({super.key});

  @override
  State<ParticipantList> createState() => _ParticipantListState();
}

class _ParticipantListState extends State<ParticipantList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: Colors.blue,
    );
  }
}
