// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:the_proj_on_github/Domain/themeNotifier.dart';

import '../Domain/customAppBar.dart';
import 'menu.dart';

class SettingsPage extends StatefulWidget {
  // final String title;

  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingsPage> {
  String micStatus = "";
  String cameraStatus = "";
  String storageStatus = "";
  String locationStatus = "";
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xFFBBA2BF),
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: CustomAppBar(
          scaffoldKey: _scaffoldKey,
          showSearchBox: false,
        ),
        body: SingleChildScrollView(
          child: Consumer<ThemeNotifier>(
            builder: (context, themeNotifier, child) {
              return Column(
                children: [
                  ListTile(
                    leading: const CircleAvatar(child: Icon(Icons.mic)),
                    onTap: () async {
                      PermissionStatus microphoneStatus =
                          await Permission.microphone.request();
                      if (microphoneStatus == PermissionStatus.granted) {}

                      if (microphoneStatus == PermissionStatus.denied) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text("This permission is recommended.")));
                      }

                      if (microphoneStatus ==
                          PermissionStatus.permanentlyDenied) {
                        openAppSettings();
                      }
                    },
                    title: const Text("Mic Permission"),
                    subtitle: Text("Status of Permission: $micStatus"),
                  ),
                  ListTile(
                    leading: const CircleAvatar(child: Icon(Icons.camera)),
                    title: const Text("Camera Permission"),
                    subtitle: Text("Status of Permission: $cameraStatus"),
                    onTap: () async {
                      PermissionStatus cameraStatus =
                          await Permission.camera.request();
                      if (cameraStatus == PermissionStatus.granted) {}

                      if (cameraStatus == PermissionStatus.denied) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text("This permission is recommended.")));
                      }

                      if (cameraStatus == PermissionStatus.permanentlyDenied) {
                        openAppSettings();
                      }
                    },
                  ),
                  ListTile(
                    leading: const CircleAvatar(child: Icon(Icons.storage)),
                    title: const Text("Storage Permission"),
                    subtitle: Text("Status of Permission: $storageStatus"),
                    onTap: () async {
                      PermissionStatus storageStatus =
                          await Permission.storage.request();

                      if (storageStatus == PermissionStatus.granted) {
                        // Permission granted, you can proceed with your logic.
                      } else if (storageStatus == PermissionStatus.denied) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("This permission is recommended."),
                        ));
                      } else if (storageStatus ==
                          PermissionStatus.permanentlyDenied) {
                        openAppSettings();
                      }
                    },
                  ),
                  ListTile(
                    leading: const CircleAvatar(child: Icon(Icons.location_on)),
                    title: const Text("Location Permission"),
                    subtitle: Text("Status of Permission: $locationStatus"),
                    onTap: () async {
                      PermissionStatus locationStatus =
                          await Permission.location.request();
                      if (locationStatus == PermissionStatus.granted) {}

                      if (locationStatus == PermissionStatus.denied) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text("This permission is recommended.")));
                      }

                      if (locationStatus ==
                          PermissionStatus.permanentlyDenied) {
                        openAppSettings();
                      }
                    },
                  ),
                  ListTile(
                    leading: const CircleAvatar(child: Icon(Icons.apps)),
                    title: const Text("All Permissions"),
                    subtitle: const Text("Status of All Permissions"),
                    onTap: () async {
                      Map<Permission, PermissionStatus> status = await [
                        Permission.microphone,
                        Permission.camera,
                        Permission.storage,
                        Permission.location,
                      ].request();

                      debugPrint(status.toString());
                    },
                  ),
                  ListTile(
                    title: Text("Dark Mode"),
                    trailing: Switch(
                      value: themeNotifier.isDarkModeEnabled,
                      onChanged: (value) {
                        themeNotifier.toggleDarkMode(value);
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        drawer: Menu(
          scaffoldKey: _scaffoldKey,
        ),
      ),
    );
  }
}
