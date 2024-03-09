// ignore: file_names

import 'package:flutter/material.dart';


import '../../Domain/customAppBar.dart';
import '../menu.dart';

class ReqEmergency extends StatefulWidget {
  const ReqEmergency({super.key});

  @override
  State<ReqEmergency> createState() => _ReqEmergencyState();
}

class _ReqEmergencyState extends State<ReqEmergency> {
  final String _date = '';
  final String _time = '';

  bool isAgree = false;

  get _formKey => GlobalKey<FormState>();

// Declare _selectedCatego
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: CustomAppBar(
          scaffoldKey: _scaffoldKey,
          showSearchBox: false,
        ),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(children: [
            Positioned(
              top: 8,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              top: 0,
              right: 0,
              left: 0,
              child: Center(
                child: Stack(
                  children: [
                    Container(
                      width: 330,
                      height: 550,
                      decoration: BoxDecoration(
                          color: const Color(
                              0xFFF5F3F3), // Replace with your desired color
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(color: Colors.black26, width: 2)),
                    ),
                    Positioned.fill(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 0, left: 15, right: 15, bottom: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const ListTile(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 0, horizontal: 0),
                                        leading: Icon(Icons.date_range),
                                        title: Text(
                                          'Date*',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.0,
                                          ),
                                        ),
                                      ),
                                      TextFormField(
                                        decoration: const InputDecoration(
                                          labelText: "dd/mm/yy",
                                          labelStyle: TextStyle(fontSize: 12.0),
                                          contentPadding: EdgeInsets.zero,
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter a date.';
                                          }
                                          return null;
                                        },
                                        onTap: () {
                                          // _selectDate(context);
                                        },
                                        controller:
                                            TextEditingController(text: _date),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 0.0),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const ListTile(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 0, horizontal: 0),
                                        leading: Icon(Icons.access_time),
                                        title: Text(
                                          'Time*',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.0,
                                          ),
                                        ),
                                      ),
                                      TextFormField(
                                        decoration: const InputDecoration(
                                          labelText: "00:00",
                                          labelStyle: TextStyle(fontSize: 12.0),
                                          contentPadding: EdgeInsets.zero,
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter a time.';
                                          }
                                          return null;
                                        },
                                        onTap: () {
                                          // _selectTime(context);
                                        },
                                        controller:
                                            TextEditingController(text: _time),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 0.0),
                            InkWell(
                              onTap: () {
                                // Handle address icon tap
                                // Implement your logic here for the action when the address icon is clicked
                              },
                              child: const Row(
                                children: [
                                  Icon(Icons.location_on),
                                  SizedBox(width: 0.0),
                                  Text(
                                    'Address*',
                                    style: TextStyle(fontSize: 12.0),
                                  ),
                                ],
                              ),
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText:
                                    "Enter your address or select a location",
                                labelStyle: TextStyle(fontSize: 12.0),
                                contentPadding: EdgeInsets.zero,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter an address.';
                                }
                                return null;
                              },
                              onSaved: (value) {},
                            ),
                            const SizedBox(height: 0.0),
                            const Text(
                              'The cateogory that related to the problem*',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w300),
                            ),
                            Center(
                              child: InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return SizedBox(
                                        height: 400,
                                        child: Column(
                                          children: <Widget>[
                                            ListTile(
                                              title: const Text('Carpenters'),
                                              onTap: () {
                                                setState(() {});
                                                Navigator.pop(context);
                                              },
                                            ),
                                            ListTile(
                                              title: const Text('Plumbers'),
                                              onTap: () {
                                                setState(() {});
                                                Navigator.pop(context);
                                              },
                                            ),
                                            ListTile(
                                              title: const Text('Electricians'),
                                              onTap: () {
                                                setState(() {});
                                                Navigator.pop(context);
                                              },
                                            ),
                                            ListTile(
                                              title: const Text('Painters'),
                                              onTap: () {
                                                setState(() {});
                                                Navigator.pop(context);
                                              },
                                            ),
                                            ListTile(
                                              title: const Text('Tilers'),
                                              onTap: () {
                                                setState(() {});
                                                Navigator.pop(context);
                                              },
                                            ),
                                            ListTile(
                                              title: const Text(
                                                  'Plastering Contractors'),
                                              onTap: () {
                                                setState(() {});
                                                Navigator.pop(context);
                                              },
                                            ),
                                            // ListTile(
                                            //  title: const Text(
                                            //  'Appliance Repair Technician'),
                                            //onTap: () {
                                            //setState(() {});
                                            //Navigator.pop(context);
                                            //},
                                            //  ),
                                            //   ListTile(
                                            //   title: Text('Alumetal Technicians'),
                                            // onTap: () {
                                            // setState(() {});
                                            //  Navigator.pop(context);
                                            // },
                                            // ),
                                            // ListTile(
                                            // title: Text('Marble Craftsmen'),
                                            // onTap: () {
                                            // setState(() {});
                                            // Navigator.pop(context);
                                            //  },
                                            // ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 4),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'Categories',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w300),
                                      ),
                                      Icon(Icons.arrow_drop_down),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 0.0),
                            const Text('Description of the problem*',
                                style: TextStyle(fontSize: 12.0)),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: "Write the problem...",
                                labelStyle: const TextStyle(fontSize: 10.0),
                                contentPadding: EdgeInsets.zero,
                                // hintText: 'write the problem...',
                                //hintStyle: const TextStyle(fontSize: 12.0),
                                fillColor:
                                    const Color.fromARGB(255, 233, 237, 241),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              minLines: 2,
                              maxLines: 2,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please write a description.';
                                }
                                return null;
                              },
                              onSaved: (value) {},
                            ),
                            ListTile(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 0),
                              leading: const Icon(Icons.camera_alt_outlined),
                              title: const Text(
                                'upload photo',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12.0),
                              ),
                              onTap: () {
                                // Handle settings tap
                              },
                            ),
                            const SizedBox(height: 0.0),
                            const ListTile(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 0),
                              leading: Icon(Icons.money),

                              title: Text(
                                'Expected commission fee [optional]',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12.0),
                              ),
                              //  onTap: () {
                              // Handle settings tap
                              //},
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: "Egyptian Pound",
                                labelStyle: TextStyle(fontSize: 12.0),
                                contentPadding: EdgeInsets.zero,
                                // hintText: 'Egyptian pound',
                                //hintStyle: TextStyle(fontSize: 12.0),
                              ),
                              keyboardType: TextInputType.number,
                              onSaved: (value) {},
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.start, // يبدأ من اليسار
                                children: [
                                  IconButton(
                                    icon: isAgree
                                        ? const Icon(Icons
                                            .check_box) // لون الأيقونة عندما يكون المتغير مختار
                                        : const Icon(
                                            Icons.check_box_outline_blank),
                                    // لون الأيقونة عندما لا يكون المتغير مختار
                                    onPressed: () {
                                      setState(() {
                                        isAgree = !isAgree;
                                      });
                                    },
                                  ),
                                  const Text(
                                    'Agree for emergency fees',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color.fromARGB(
                                            255, 0, 0, 0)), // تحديد لون النص
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 0,
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 0, left: 15, right: 15, bottom: 0),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor:
                                        const Color.fromARGB(234, 0, 0, 0),
                                    backgroundColor: const Color(0xFFBBA2BF),
                                  ),
                                  child: const Text(
                                    'Book',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  onPressed: () {
                                    //Handle button tap
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
        drawer: Menu(
          scaffoldKey: _scaffoldKey,
        ),
      ),
    );
  }
}