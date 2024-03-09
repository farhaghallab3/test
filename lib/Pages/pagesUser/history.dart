// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, library_private_types_in_public_api, must_be_immutable

import 'package:flutter/material.dart';
import 'package:grad_proj/Pages/pagesUser/toqaHistoryUser.dart';
import 'package:grad_proj/Pages/pagesUser/workerReview.dart';
import 'package:grad_proj/Pages/pagesWorker/toqaHistoryWorker.dart';


import '../../Domain/customAppBar.dart';
import '../../Domain/listItem.dart';
import '../menu.dart';
import 'BNavBarPages/workerslist.dart';

class History extends StatelessWidget {
  List<Map<String, dynamic>> worker = [
    {
      "name": "Mohamed Ahmed",
      "Type": "Air Conditioning Maintenance",
      "pic": "assets/images/profile.png",
      "Number": "0123456",
      "Description": "skilled and professional technician",
      "Review": "",
      "Rating": 4.4,
      "Date": DateTime(2024, 12, 31),
      "Commission Fee": 200,
      "emergency": false
    },
    
    
    {
      "name": "Mohamed Ahmed",
      "Type": "Air Conditioning Maintenance",
      "pic": "assets/images/profile.png",
      "Number": "0123456",
      "Description": "skilled and professional technician",
      "Review": "",
      "Rating": 4.4,
      "Date": DateTime(2024, 12, 31),
      "Commission Fee": 200,
      "emergency": false
    },
    {
      "name": "Nagy Ahmed",
      "Type": "Refrigerator Maintenance",
      "pic": "assets/images/profile.png",
      "Rating": 5.0,
      "Number": "1237568",
      "Description": "",
      "Review": "",
      "Date": DateTime(2024, 2, 15),
      "Commission Fee": 300,
      "emergency": true
    },
    {
      "name": "Ziad Ahmed",
      "Type": "Refrigerator Maintenance",
      "pic": "assets/images/profile.png",
      "Rating": 5.0,
      "Number": "1237568",
      "Description": "",
      "Review": "",
      "Date": DateTime(2024, 1, 10),
      "Commission Fee": 400,
      "emergency": false
    },
    {
      "name": "Ziad Ahmed",
      "Type": "Refrigerator Maintenance",
      "pic": "assets/images/profile.png",
      "Rating": 5.0,
      "Number": "1237568",
      "Description": "",
      "Review": "",
      "Date": DateTime(2024, 1, 10),
      "Commission Fee": 400,
      "emergency": false
    },
    {
      "name": "Ziad Ahmed",
      "Type": "Refrigerator Maintenance",
      "pic": "assets/images/profile.png",
      "Rating": 5.0,
      "Number": "1237568",
      "Description": "",
      "Review": "",
      "Date": DateTime(2024, 1, 10),
      "Commission Fee": 400,
      "emergency": false
    },
    {
      "name": "Ziad Ahmed",
      "Type": "Refrigerator Maintenance",
      "pic": "assets/images/profile.png",
      "Rating": 5.0,
      "Number": "1237568",
      "Description": "",
      "Review": "",
      "Date": DateTime(2024, 1, 10),
      "Commission Fee": 400,
      "emergency": false
    },
  ];

  //returns a list of maps, where each map has string keys and dynamic values.
  List<Map<String, dynamic>> getRecentWorkers() {
    //to get current date
    DateTime today = DateTime.now();
    //The where method filters the list based on a given condition
    return worker.where((w) {
      DateTime appointmentDate = w['Date'];
      return appointmentDate.isAfter(today);
    }).toList();
  }

  List<Map<String, dynamic>> getPreviousRequests() {
    DateTime today = DateTime.now();
    return worker.where((w) {
      DateTime appointmentDate = w['Date'];
      return appointmentDate.isBefore(today);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> recentWorkers = getRecentWorkers();
    List<Map<String, dynamic>> previousRequests = getPreviousRequests();
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        appBar: CustomAppBar(scaffoldKey: scaffoldKey,showSearchBox: false,),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8,top: 30),
                child: Text(
                  "Recent:",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Raleway",
                    color: Colors.black,
                    shadows: [
                      Shadow(
                        color: Colors.black12,
                        offset: Offset(2, 2),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: recentWorkers.length,
                itemBuilder: (context, index) {
                  final worker = recentWorkers[index];
                  return ListItem(
                    worker: worker,
                    trailingWidget: worker['emergency'] == true
                        ? Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Image.asset("assets/images/Siren.png"),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Image.asset("assets/images/Siren2.png"),
                          ),
                    onPressed: () => navigateToPage1(context, WorkerHistoryPage()),
                    pageIndex: 3,
                  );
                },
              ),
              SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.only(left:8.0),
                child: Text(
                  "Previous Requests:",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Raleway",
                    color: Colors.black,
                    shadows: [
                      Shadow(
                        color: Colors.black12,
                        offset: Offset(2, 2),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                ),
              ),
                SizedBox(height: 10,),
              ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: previousRequests.length,
                itemBuilder: (context, index) {
                  final worker = previousRequests[index];
                  return ListItem(
                    worker: worker,
                    trailingWidget: worker['emergency'] == true
                        ? Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Image.asset("assets/images/Siren.png"),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Image.asset("assets/images/Siren2.png"),
                          ),
                    onPressed: () => navigateToPage1(context, UserHistoryPage()),
                    pageIndex: 3,
                  );
                },
              ),
            ],
          ),
        ),
        drawer: Menu(scaffoldKey: scaffoldKey,),
      ),
    );
  
  }
}