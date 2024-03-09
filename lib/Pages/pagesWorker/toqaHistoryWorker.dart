// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:grad_proj/Domain/customAppBar.dart';


class UserHistoryPage extends StatelessWidget {
   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  UserHistoryPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
     appBar: CustomAppBar(scaffoldKey: _scaffoldKey),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(5.0),
              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.grey[200],
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        maxRadius: 40.0,
                        minRadius: 40.0,
                        backgroundColor: Colors.white,
                        backgroundImage:
                            AssetImage('assets/images/profile.png'),
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'User Details',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Raleway",
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 1),
                          Row(
                            children: [
                              Text(
                                'Address',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "Raleway",
                                  color: Colors.black87,
                                ),
                              ),
                              SizedBox(width: 120),
                              Icon(
                                Icons.favorite_border,
                                color: Color(0xFFBBA2BF),
                              ),
                            ],
                          ),
                          Text(
                            '012346789',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: "Raleway",
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.chat_bubble,
                        color: Color(0xFFBBA2BF),
                      ),
                      Icon(
                        Icons.phone,
                        color: Color(0xFFBBA2BF),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          
           SizedBox(height: 40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.calendar_today,color: Color(0xFFBBA2BF),),
              SizedBox(width: 10.0),
              Text('Date: YYYY-MM-DD',style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "Raleway",
                                  color: Colors.black87,
                                ),),
              SizedBox(width: 40.0),
              Icon(Icons.access_time,color: Color(0xFFBBA2BF),),
              SizedBox(width: 10.0),
              Text('Time: HH:MM',style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "Raleway",
                                  color: Colors.black87,
                                ),),
            ],
          ),
          SizedBox(height: 20.0),
           Container(
          
              margin: EdgeInsets.all(5.0),
              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
           
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Text("The problem is blockage in the sewage pipes.",style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "Raleway",
                                  color: Colors.black87,
                                 
                                )),
           ),
         SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.photo, color: Color(0xFFBBA2BF),),
              SizedBox(width: 10.0),
              Text('Picture Here',style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "Raleway",
                                  color: Colors.black87,
                                  decoration: TextDecoration.underline
                                ),),
            ],
          ),
         
         
         
         
          SizedBox(height: 20.0),
        
        
        
          SizedBox(width: 10.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                   Icon(Icons.attach_money, color: Color(0xFFBBA2BF),),
                    SizedBox(width: 10.0),
                  Text('The range of Comission Fee :',style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: "Raleway",
                                      color: Colors.black87,
                                    ),),
                                     
                ],
              ),
             
                SizedBox(
                  width: 300,
                  child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: "Egyptian Pound",
                             
                            //  contentPadding: EdgeInsets.symmetric(vertical: 12),
                            ),
                          ),
                ),
            ],
          ),
       
          ],
            ),
          ),             
    floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 16.0),
            FloatingActionButton(
              onPressed: () {
                Navigator.pop(context);
              },
              backgroundColor: const Color(0xFFBBA2BF),
              shape: const CircleBorder(),
              child: const Icon(Icons.arrow_back),
            ),
          ],
        ),
      
      
    );
  }
}
