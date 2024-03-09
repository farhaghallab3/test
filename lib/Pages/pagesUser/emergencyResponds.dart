// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grad_proj/Pages/pagesUser/workerReview.dart';


import '../../Domain/customAppBar.dart';
import '../../Domain/listItem.dart';
import '../menu.dart';
import 'BNavBarPages/workerslist.dart';

class EmergencyResponds extends StatefulWidget {
  const EmergencyResponds({Key? key}) : super(key: key);

  @override
  _ERespondsState createState() => _ERespondsState();
}

class _ERespondsState extends State<EmergencyResponds> {
  //const WorkersList({Key? key});
  List worker = [
    {
      "name": "Mohamed Ahmed",
      "Type": "Air Conditioning Maintenance",
      "pic": "assets/images/profile.png",
      "Number": "0123456",
      "Description": "skilled and professional technician",
      "Review": "",
      "Rating": 4.4,
      "Commission Fee": 500
    },
    {
      "name": "Nagy Ahmed",
      "Type": "Refrigerator Maintenance",
      "pic": "assets/images/profile.png",
      "Rating": 5.0,
      "Number": "1237568",
      "Description": "",
      "Review": "",
      "Commission Fee": 300
    },
  ];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: CustomAppBar(
          scaffoldKey: _scaffoldKey,
          showSearchBox: true,
        ),
        body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Stack(children: [
             
              SizedBox(
                height: 35,
              ),
              //Text
              Positioned(
                top: 130,
                left: 6,
                child: Text(
                  "Emergency responds:",
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
                      trailingWidget: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Image.asset("assets/images/Siren.png"),
                      ),
                      onPressed: () => navigateToPage1(context, WorkerReview(previousPage: 'Emergency',)),
                      pageIndex: 4,
                    );
                  },
                ),
              )
            ])),
        drawer: Menu(
          scaffoldKey: _scaffoldKey,
        ),
      ),
    );
  }
}