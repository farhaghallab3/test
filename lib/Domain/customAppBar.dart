import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final bool showSearchBox; // New parameter to control search box visibility

  const CustomAppBar({
    Key? key,
    required this.scaffoldKey,
    this.showSearchBox = false, // Default value is false
  }) : super(key: key);

  @override
  Size get preferredSize {
    if (showSearchBox) {
      return const Size.fromHeight(90.0); // Height when search box is showing
    } else {
      return const Size.fromHeight(60.0); // Height when search box is not showing
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false, // This removes the back button
      backgroundColor: const Color(0xFFBBA2BF),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      title: Row(
        children: [
          IconButton(
            onPressed: () {
              scaffoldKey.currentState?.openDrawer(); // Open the drawer
            },
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
              size: 40,
            ),
          ),
          const Spacer(), // Add space to center the image
          Image.asset(
            'assets/images/MR. House.png',
            width: 80, // Adjust width as needed
            height: 60, // Adjust height as needed
          ), // Replace 'MR. House.png' with your image asset path
          const Spacer(), // Add space to separate the image and the profile picture
          GestureDetector(
            onTap: () {
              // Handle profile picture tap
            },
            child: const CircleAvatar(
              radius: 20, // Adjust radius as needed
              backgroundImage: AssetImage(
                'assets/images/profile.png',
              ),
            ),
          ), // Replace 'profile.png' with your profile picture asset path
        ],
      ),
      // Conditionally add the search box based on the showSearchBox parameter
      bottom: showSearchBox
          ? PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: TextField(
            decoration: InputDecoration(
                        labelText: "Search technican name",
                        contentPadding: EdgeInsets.zero,
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                        ),
            ),
          ),
        ),
        ),
      )
          : null,
    );
  }
}