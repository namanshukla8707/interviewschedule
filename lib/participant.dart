// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class Participant extends StatefulWidget {
  const Participant({super.key});
  @override
  State<Participant> createState() => _ParticipantState();
}

class _ParticipantState extends State<Participant> {
  final ScrollController controller = ScrollController();
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  List<Map<String, dynamic>> participant = [];
  DocumentSnapshot? lastDocument;
  bool isMoreData = true;
  bool isLoading = false;
  Future<void> getdata() async {
    print('i am called');
    if (isMoreData) {
      setState(() {
        isLoading = true;
      });
      final collectionReference = _db.collection('participants');
      late QuerySnapshot<Map<String, dynamic>> querySnapshot;
      if (lastDocument == null) {
        try {
          querySnapshot = await collectionReference.limit(10).get();
        } catch (e) {
          print(e);
        }
      } else {
        try {
          querySnapshot = await collectionReference
              .limit(10)
              .startAfterDocument(lastDocument!)
              .get();
        } catch (e) {
          print(e);
        }
      }
      lastDocument = querySnapshot.docs.last;
      participant.addAll(querySnapshot.docs.map((e) => e.data()));
      isLoading=false;
      if(querySnapshot.docs.length<10){
        isMoreData=false;
      }
      if(mounted){
        setState(() {});
      }
    } else {
      print('no more data');
    }
  }

  @override
  void initState(){
    super.initState();
    getdata();
    controller.addListener(() {
      if(controller.position.pixels==controller.position.maxScrollExtent){
        getdata();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(210, 8, 8, 8),
        title: const Text("Scalar",),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
            itemCount: participant.length,
            controller: controller,
            itemBuilder: (context, index) =>Padding(
              padding:const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              child: Text(participant[index]['name']),
            ),
          ))
        ],
      ),
    );
  }
}
