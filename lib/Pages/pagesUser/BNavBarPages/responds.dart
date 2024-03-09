// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grad_proj/Pages/pagesUser/BNavBarPages/workerslist.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../../../Domain/customAppBar.dart';
import '../../../Domain/listItem.dart';
import '../workerReview.dart';

class Responds extends StatefulWidget {
  const Responds({Key? key}) : super(key: key);

  @override
  _RespondsState createState() => _RespondsState();
}

class _RespondsState extends State<Responds> {
  //const WorkersList({Key? key});
  List worker = [
    {
      "name": "Mohamed Ahmed",
      "Type": "Air Conditioning Maintenance",
      "pic": "assets/images/profile.png",
      "Number": "0123456",
      "Description": "skilled and professional technician",
      "Review": "",
      "Rating": 4.4
    },
    {
      "name": "Nagy Ahmed",
      "Type": "Refrigerator Maintenance",
      "pic": "assets/images/profile.png",
      "Rating": 5.0,
      "Number": "1237568",
      "Description": "",
      "Review": ""
    },
  ];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: CustomAppBar(scaffoldKey: _scaffoldKey,showSearchBox: true,),
        body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Stack(children: [
             
              //text
              Positioned(
                top: 130,
                left: 6,
                child: Text(
                  "Choose one of the responses:",
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

              //Workers List
              Positioned(
                top: 180,
                right: 5,
                left: 5,
                bottom: 0,
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    itemCount: worker.length,
                    itemBuilder: (context, itemCount) {
                      return ListItem(
                        worker: worker[itemCount],
                        pageIndex: 2,
                         onPressed: () => navigateToPage1(context,WorkerReview(previousPage: 'Responds',)),
                       
                      );
                    }),
              )
            ])),
      ),
    );
  }



}