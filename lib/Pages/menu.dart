import 'package:flutter/material.dart';
import 'package:grad_proj/Domain/WokerBottomNavBar.dart';
import 'package:grad_proj/Domain/bottom.dart';
import 'package:grad_proj/Domain/user_provider.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:grad_proj/Pages/pagesUser/history.dart';
import 'package:grad_proj/Pages/pagesUser/reqEmergency.dart';
import 'package:grad_proj/Pages/pagesUser/userinfo.dart';
import 'package:grad_proj/Pages/welcome.dart';
import 'package:provider/provider.dart';
import '../Domain/customAppBar.dart';

class MenuDrawerPage extends StatefulWidget {
  const MenuDrawerPage({Key? key}) : super(key: key);

  @override
  _MenuDrawerPageState createState() => _MenuDrawerPageState();
}

class _MenuDrawerPageState extends State<MenuDrawerPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(scaffoldKey: _scaffoldKey),
      drawer: Menu(scaffoldKey: _scaffoldKey),
    );
  }
}

class Menu extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const Menu({Key? key, required this.scaffoldKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    bool isUser = userProvider.isUser;
    return Drawer(
      child: FractionallySizedBox(
        alignment: Alignment.topCenter,
        child: Container(
          color: const Color(0xFFBBA2BF),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: const Icon(Icons.close_rounded),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Color(0xFFBBA2BF),
                  ),
                  child: Container(
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              AssetImage('assets/images/profile.png'),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Farha Ghallab',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text(
                    'Home',
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                  onTap: () {
                

                    if (isUser==true) {
                      PersistentNavBarNavigator.pushNewScreen(context,
                          screen: const BottomNavBarUser(), withNavBar: false);
                    } else {
                      PersistentNavBarNavigator.pushNewScreen(context,
                          screen: const BottomNavBarWorker(), withNavBar: false);
                    }
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.person_outlined),
                  title: const Text(
                    'Profile',
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                  onTap: () {
                    // Check user role here
                    bool isUser = true; // Replace with actual user role check

                    if (isUser) {
                      PersistentNavBarNavigator.pushNewScreen(context,
                          screen: const Cutomerinfo(), withNavBar: false);
                    } else {
                      // Handle worker profile tap
                    }
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.calendar_month_outlined),
                  title: const Text(
                    'History',
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                  onTap: () {
                    PersistentNavBarNavigator.pushNewScreen(context,
                        screen: History(), withNavBar: false);
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.map_outlined),
                  title: const Text(
                    'Emergency',
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                  onTap: () {
                    PersistentNavBarNavigator.pushNewScreen(context,
                        screen: const ReqEmergency(), withNavBar: false);
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.info_outline),
                  title: const Text(
                    'AboutApp',
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                  onTap: () {
                    // Handle information tap
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.settings_outlined),
                  title: const Text(
                    'Settings',
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                  onTap: () {
                    // Handle settings tap
                  },
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(45),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: const Color.fromARGB(234, 0, 0, 0),
                      backgroundColor: Colors.white,
                    ),
                    child: const Text('Log Out'),
                    onPressed: () {
                      PersistentNavBarNavigator.pushNewScreen(context,
                          screen: const Welcome(), withNavBar: false);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}