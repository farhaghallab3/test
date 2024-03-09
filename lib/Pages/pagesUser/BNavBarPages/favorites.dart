// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grad_proj/Pages/pagesUser/BNavBarPages/workerslist.dart';


import '../../../Domain/customAppBar.dart';
import '../../../Domain/listItem.dart';
import '../../menu.dart';
import '../workerReview.dart';

class Favorites extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  //const Notifications({Key? key});

  List worker = [
    {
      "name": "Mohamed Ahmed",
      "Type": "Air Conditioning Maintenance",
      "pic": "assets/images/profile.png",
      "Number": "0123456",
      "Description": "skilled and professional technician",
      "Review": "",
      "Rating": 4.4,
      "Favorite": true
    },
    {
      "name": "Nagy Ahmed",
      "Type": "Refrigerator Maintenance",
      "pic": "assets/images/profile.png",
      "Rating": 5.0,
      "Number": "1237568",
      "Description": "",
      "Review": "",
      "Favorite": true
    },
  ];

  Favorites({super.key});

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
                      trailingWidget: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite,
                          color: Color(0xFFBBA2BF),
                          size: 25,
                        ),
                      ),
                      pageIndex: 1,
                      onPressed: () => navigateToPage1(context, WorkerReview(previousPage: 'Fav',)),
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