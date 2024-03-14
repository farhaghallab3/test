// Remove the unused import statements
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:gradproj/Domain/customAppBar.dart';
import 'package:gradproj/Pages/adminchat.dart';
import 'package:gradproj/Pages/menu.dart';
import 'package:gradproj/Pages/pagesUser/reqCategory.dart';

class userinfo extends StatefulWidget {
  const userinfo({Key? key}) : super(key: key);

  @override
  _userinfoState createState() => _userinfoState();
}

class _userinfoState extends State<userinfo> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
  
              // Profile Information Details
              Positioned(
                top: MediaQuery.of(context).size.height * 0.10,
                left: 0,
                right: 0,
                child: Container(
                  margin: const EdgeInsets.only(top: 15),
                  child: Column(
                    children: [
                      // Profile Image
                      const CircleAvatar(
                        radius: 55,
                        backgroundImage:
                            AssetImage("assets/images/profile.png"),
                      ),
                      const SizedBox(height: 5),

                      // Worker Name
                      const Text(
                        "John Doe",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // About
                          Container(
                            margin: const EdgeInsets.only(
                                left: 16), // Increased the left margin
                            child: const ListTile(
                              leading: Icon(Icons.info),
                              title: Text(
                                "About",
                                style: TextStyle(
                                  fontWeight: FontWeight
                                      .bold, // Make the "About" title bold
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),

                          // Worker About Text
                          Container(
                            margin: const EdgeInsets.only(
                                left: 16), // Increased the left margin
                            child: const Text(
                              "Lorem ipsum dolor sit amet, sed scelerisque eros consectetur.",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),

                          // Worker Contact Information
                          // phoneNum
                          Container(
                            margin: const EdgeInsets.only(
                                left: 16), // Increased the left margin
                            child: const ListTile(
                              leading: Icon(Icons.phone),
                              title: Text(
                                "Phone Number:",
                                style: TextStyle(
                                  fontWeight: FontWeight
                                      .bold, // Make the phone number title bold
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),

                          // Worker num Text
                          Container(
                            margin: const EdgeInsets.only(
                                left: 16), // Increased the left margin
                            child: const Text(
                              "01224047524",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),

                          // Email
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                    left: 16), // Increased the left margin
                                child: const ListTile(
                                  leading: Icon(Icons.mail),
                                  title: Text(
                                    "Email:",
                                    style: TextStyle(
                                      fontWeight: FontWeight
                                          .bold, // Make the email title bold
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),

                              // Worker email Text
                              Container(
                                margin: const EdgeInsets.only(
                                    left: 16), // Increased the left margin
                                child: const Text(
                                  "johndoe@example.com",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                            ],
                          ),
                        ],
                      ),

                      // Rating and Stars
                      Container(
                        margin: const EdgeInsets.only(left: 16),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              leading: Icon(Icons.star,
                                  color: Color.fromRGBO(74, 74, 74, 1),
                                  size: 25), // Filled with black
                              title: Text(
                                "Rating:",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                // Add your rating logic here, e.g., display stars based on a rating value
                                Icon(Icons.star, color: Colors.yellow),
                                Icon(Icons.star, color: Colors.yellow),
                                Icon(Icons.star, color: Colors.yellow),
                                Icon(Icons.star_border, color: Colors.yellow),
                                Icon(Icons.star_border, color: Colors.yellow),
                               ],
                            ),
                          ],
                        ),
                      ),
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    InkWell(
      onTap: () {
        // Handle tap on the message icon
        Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminChat()));
      },
      child: Container(
        margin: const EdgeInsets.only(left: 16), // Increased the left margin
        child: const Tooltip(
          message: "Admin Chat",
          child: ListTile(
            leading: Icon(Icons.message_rounded),
          ),
        ),
      ),
    ),
    const SizedBox(height: 8),
  ],
)
                  ],
                  ),
                  ),
                  ),
                  ],
                  ),
                  ),
    appBar: CustomAppBar(
          scaffoldKey: _scaffoldKey,
          showSearchBox: false,
        ),
       drawer: Menu(scaffoldKey: _scaffoldKey,),
        // FloatingActionButton
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ReqCategory()),
            );
          },
          backgroundColor: const Color(0xFFBBA2BF),
          shape: const CircleBorder(),
          child: const Icon(Icons.add_chart_rounded),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}
