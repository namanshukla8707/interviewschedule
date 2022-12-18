// ignore_for_file: unused_import, unused_element, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers, unused_local_variable

// import 'dart:html';

import 'dart:ffi';

import 'package:flutter/material.dart';

class ScheduleMeet extends StatefulWidget {
  const ScheduleMeet({super.key});

  @override
  State<ScheduleMeet> createState() => _ScheduleMeetState();
}

class _ScheduleMeetState extends State<ScheduleMeet> {
  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();
  TimeOfDay time1 = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    final hours = time.hour.toString().padLeft(2, '0');
    final minutes = time.minute.toString().padLeft(2, '0');
    final hours1 = time1.hour.toString().padLeft(2, '0');
    final minutes1 = time1.minute.toString().padLeft(2, '0');
    return Container(
      padding: EdgeInsets.only(left: 18),
      // color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Select Date: ',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                width: 10,
              ),
              TextButton(
                onPressed: () async {
                  DateTime? newDate = await showDatePicker(
                    context: context,
                    initialDate: date,
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100),
                  );
                  if (newDate == null) {
                    return;
                  }
                  setState(() {
                    date = newDate;
                  });
                },
                child: Text('${date.day}/${date.month}/${date.year}'),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                'Start Time: ',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                width: 10,
              ),
              TextButton(
                onPressed: () async {
                  TimeOfDay? newTime = await showTimePicker(
                    context: context,
                    initialTime: time,
                  );
                  if (newTime == null) {
                    return;
                  }
                  setState(() {
                    time = newTime;
                  });
                },
                child: Text('$hours:$minutes'),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                'End Time:   ',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                width: 10,
              ),
              TextButton(
                onPressed: () async {
                  TimeOfDay? newTime = await showTimePicker(
                    context: context,
                    initialTime: time1,
                  );
                  if (newTime == null) {
                    return;
                  }
                  setState(() {
                    time1 = newTime;
                  });
                },
                child: Text('$hours1:$minutes1'),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SizedBox(width: 140),
              // TextButton(
              //   onPressed: () {},
              //   child:
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(width: 30),
              // ),
              // TextButton(
              //   onPressed: () {},
              //   child:
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Ok',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              // ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
