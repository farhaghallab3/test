// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:grad_proj/Domain/bottom.dart';
import 'package:grad_proj/Domain/customAppBar.dart';
import 'package:grad_proj/Pages/menu.dart';
import 'package:grad_proj/Pages/pagesUser/BNavBarPages/home.dart';
import 'package:grad_proj/req.dart';

class WorkerReview extends StatefulWidget {
  final String previousPage;

  const WorkerReview({Key? key, required this.previousPage}) : super(key: key);
  
  static String routeName = 'workerreview';

  @override
  _WorkerReviewState createState() => _WorkerReviewState();
}

class _WorkerReviewState extends State<WorkerReview> {
  double rating = 5; // Initial rating value
  final TextEditingController _reviewController = TextEditingController();
  List<String> reviews = [];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
                            'Worker Details',
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
                                'Worker Type',
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
          
            const SizedBox(height: 12),
            Text(
              'Ratings:',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Raleway",
                  decoration: TextDecoration.underline),
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor:
                    Colors.amber, // Set gold color for the active track
                thumbColor: Colors.amber, // Set gold color for the thumb
                overlayColor: Colors.amber
                    .withOpacity(0.3), // Set gold color for the overlay
                inactiveTrackColor:
                    Colors.grey, // Set grey color for the inactive track
              ),
              child: Slider(
                value: rating,
                min: 1,
                max: 5,
                divisions: 4,
                onChanged: (value) {
                  setState(() {
                    rating = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Rate the Worker:',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Raleway",
                  decoration: TextDecoration.underline),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                RatingBar.builder(
                  initialRating: 0,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  itemSize: 30,
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    // Handle rating update
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Leave a Review:',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Raleway",
                  decoration: TextDecoration.underline),
            ),
            TextField(
              controller: _reviewController,
              decoration: InputDecoration(
                hintText: 'Enter your review/comments here...',
                border: OutlineInputBorder(),
              ),
              maxLines: null, // Allow multiple lines for longer comments
            ),
            ElevatedButton(
           onPressed: () {
    if (_reviewController.text.isNotEmpty) {
      setState(() {
        reviews.add(_reviewController.text);
        _reviewController.clear();
      });

  
    }
  },
               style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFBBA2BF),
                              
                               
                              ),
              child: Text('Submit Review',
               style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.grey[850],
                                ),),
            ),
            SizedBox(height: 20),
            Text(
              'Reviews:',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Raleway",
                  decoration: TextDecoration.underline),
            
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: reviews.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(reviews[index]),
                );
              },
            ),
              SizedBox(height: 50,),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   ElevatedButton(
                              onPressed: () {
                                  if (widget.previousPage == 'WorkersList' || widget.previousPage == 'Fav' ) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Req()),
        );
      } else if (widget.previousPage == 'Emergency') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BottomNavBarUser()),
      );
    }else  {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    }                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFBBA2BF),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 77,
                                  vertical: 13,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(27),
                                ),
                              ),
                              child: Text(
                                "Book",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.grey[850],
                                ),
                              ),
                            ),
                 ],
               ),
                      
          ],
        ),
        
      ),
    drawer: Menu(
          scaffoldKey: _scaffoldKey,
        ),
    );
  }
}
