import 'package:flutter/material.dart';
import 'package:grad_proj/Pages/pagesUser/BNavBarPages/workerslist.dart';



import '../../../Domain/customAppBar.dart';
import '../../menu.dart';
import '../reqCategory.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<String> catNames = [
    'Carpenters',
    'Plumbers',
    'Electricians',
    'Painters',
    'Tilers',
    'Plastering Contractors',
    'Appliance Repair Technician',
    'Alumetal Technicians',
    'Marble Craftsmen'
  ];

  List<Color> catColors = [
    const Color(0xFFBBA2BF),
    const Color(0xFFBBA2BF),
    const Color(0xFFBBA2BF),
    const Color(0xFFBBA2BF),
    const Color(0xFFBBA2BF),
    const Color(0xFFBBA2BF),
    const Color(0xFFBBA2BF),
    const Color(0xFFBBA2BF),
    const Color(0xFFBBA2BF),
  ];

  List<String> catImages = [
    "assets/images/categories/carpenter.jpg",
    "assets/images/categories/plumper.jpg",
    "assets/images/categories/electricians.jpg",
    "assets/images/categories/painter.jpg",
    "assets/images/categories/tiler.jpg",
    "assets/images/categories/Plastering.jpg",
    "assets/images/categories/Appliance Repair Technician.jpg",
    "assets/images/categories/Alumetal Technicians.jpg",
    "assets/images/categories/Marble Craftsmen.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(scaffoldKey: _scaffoldKey,showSearchBox: true,),
      body: ListView(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 20),
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 15,
                    mainAxisExtent: 125),
                itemCount: catNames.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  WorkersList()));
                    },
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              color: catColors[index],
                              shape: BoxShape.rectangle,
                            ),
                            child: Image.asset(
                              catImages[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            catNames[index],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ReqCategory()));
        },
        backgroundColor: const Color(0xFFBBA2BF),
        shape: const CircleBorder(),
        child: const Icon(Icons.add_chart_rounded),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      drawer: Menu(scaffoldKey: _scaffoldKey,),
    );
  }
}