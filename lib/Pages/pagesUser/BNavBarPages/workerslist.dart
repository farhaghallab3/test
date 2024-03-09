// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, must_be_immutable, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Domain/customAppBar.dart';
import '../../../Domain/listItem.dart';
import '../../menu.dart';
import '../workerReview.dart';

class WorkersList extends StatelessWidget {
   WorkersList({Key? key}) : super(key: key);
  
  List worker = [
    {
      "name": "Seif Ahmed",
      "Type": "Air Conditioning Maintenance",
      "pic": "assets/images/profile.png",
      "Number": "0123456",
      "Description": "skilled and professional technician",
      "Review": "",
      "Rating": 4.4,
        "Favorite":true

    },
    {
      "name": "Nagy Ahmed",
      "Type": "Refrigerator Maintenance",
      "pic": "assets/images/profile.png",
      "Rating": 5.0,
      "Number": "1237568",
      "Description": "",
      "Review": "",
        "Favorite":true
      
    },
    {
      "name": "Mohamed Ahmed",
      "Type": "Air Conditioning Maintenance",
      "pic": "assets/images/profile.png",
      "Rating": 2.9,
      "Number": "0123456",
      "Description": "skilled and professional technician",
      "Review": "",
        "Favorite":false
    },
    {
      "name": "Mohamed Ahmed",
      "Type": "Air Conditioning Maintenance",
      "pic": "assets/images/profile.png",
      "Rating": 2.5,
      "Number": "0123456",
      "Description": "skilled and professional technician",
      "Review": ""
    },
  ];
   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: CustomAppBar(scaffoldKey: _scaffoldKey,showSearchBox: true,),
        body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Stack(children: [
              //Workers List
              Positioned(
                top: 10,
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
                       pageIndex: 0,
                        onPressed: () => navigateToPage1(context,WorkerReview(previousPage: 'WorkersList',)),
                       
                    );
                  },
                ),
       
              )
            ])
        ),
        drawer: Menu(scaffoldKey: _scaffoldKey,),
      ),
    );
  }


}

  void navigateToPage1(BuildContext context, Widget page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}