import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/components/CustomAppBar.dart';
import 'package:my_app/components/ImageCard.dart';
import 'package:my_app/screens/thankyou_screen.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selected = 0;
  bool heart = false;
  var tabItems = [
    {"Home": const Icon(Icons.home)},
    {"ECG": const Icon(Icons.home)},
    {"Search": const Icon(Icons.home)},
    {"Chat": const Icon(Icons.home)},
    {"Profile": const Icon(Icons.home)},
  ];

  var categories = [
    {"title": "Dental", "icon": "assets/categories/tooth.png"},
    {"title": "Heart", "icon": "assets/categories/heart.png"},
    {"title": "Eyes", "icon": "assets/categories/eyes.png"},
    {"title": "Brain", "icon": "assets/categories/brain.png"},
    {"title": "Baby", "icon": "assets/categories/baby.png"},
    {"title": "Dental", "icon": "assets/categories/tooth.png"},
    {"title": "Heart", "icon": "assets/categories/heart.png"},
    {"title": "Eyes", "icon": "assets/categories/eyes.png"},
    {"title": "Brain", "icon": "assets/categories/brain.png"},
    {"title": "Baby", "icon": "assets/categories/baby.png"},
  ];

  var doctorsList = [
    {
      "title": "Dr. Amelia Daniel",
      "image": "assets/doctor.jpeg",
      "department": "Dermatologies"
    },
    {
      "title": "Dr. Erik Wagnet",
      "image": "assets/doctor.jpeg",
      "department": "Ureology"
    },
    {
      "title": "Dr. Aryan Kumar",
      "image": "assets/doctor.jpeg",
      "department": "Cardiologist"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 236, 231, 231),
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(220),
          child: CustomAppBarWidget()),
      bottomNavigationBar: StylishBottomBar(
        option: AnimatedBarOptions(
          iconSize: 32,
          barAnimation: BarAnimation.transform3D,
          iconStyle: IconStyle.animated,
          opacity: 0.5,
        ),
        items: [
          BottomBarItem(
              icon: const Icon(
                Icons.house_outlined,
              ),
              selectedIcon: const Icon(Icons.house_rounded),
              selectedColor: Colors.teal,
              backgroundColor: Colors.tealAccent,
              title: const Text('Home')),
          BottomBarItem(
              icon: const Icon(Icons.monitor_heart_outlined),
              selectedIcon: const Icon(Icons.monitor_heart),
              selectedColor: Colors.blue,
              backgroundColor: Colors.lightGreenAccent,
              title: const Text('Schedule')),
          BottomBarItem(
              icon: const Icon(
                Icons.message_outlined,
              ),
              selectedIcon: const Icon(
                Icons.message_rounded,
              ),
              backgroundColor: Colors.amber,
              selectedColor: Colors.deepOrangeAccent,
              title: const Text('Chat')),
          BottomBarItem(
              icon: const Icon(
                Icons.person_outline,
              ),
              selectedIcon: const Icon(
                Icons.person,
              ),
              backgroundColor: Colors.purpleAccent,
              selectedColor: Colors.deepPurple,
              title: const Text('Profile')),
        ],
        fabLocation: StylishBarFabLocation.center,
        hasNotch: true,
        currentIndex: selected,
        onTap: (index) {
          setState(() {
            selected = index;
            // switch (index) {
            //   case 1:
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => const ThankyouScreen()));
            //     break;
            //   default:
            // }
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ThankyouScreen()));
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            heart = !heart;
          });
        },
        backgroundColor: Colors.white,
        child: const Icon(
          CupertinoIcons.search,
          color: Colors.blue,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Categories",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 100,
                child: ListView.separated(
                    // physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Column(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(width: 5, color: Colors.white),
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(
                                categories[index]["icon"].toString(),
                              ),
                            ),
                            const SizedBox(height: 10),
                            // Text()
                            Text(categories[index]["title"].toString())
                          ],
                        ),
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                          width: 10,
                        ),
                    itemCount: categories.length),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Recommended Doctors",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            "See All",
                            style: TextStyle(color: Colors.blue),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => ImageCard(
                              imageLocation: doctorsList[index]["image"],
                              doctorName: doctorsList[index]["title"],
                              doctorDepartment: doctorsList[index]
                                  ["department"],
                            ),
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 10,
                              width: 10,
                            ),
                        itemCount: doctorsList.length),
                  )
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Consultation Scheduled",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            "See All",
                            style: TextStyle(color: Colors.blue),
                          ))
                    ],
                  ),
                  // SizedBox(
                  //   height: 250,
                  //   child: ListView.separated(
                  //       physics: NeverScrollableScrollPhysics(),
                  //       shrinkWrap: true,
                  //       scrollDirection: Axis.horizontal,
                  //       itemBuilder: (context, index) => SizedBox(
                  //             height: 50,
                  //             child: ListTile(
                  //               title: Text(
                  //                   doctorsList[index]["title"].toString()),
                  //             ),
                  //           ),
                  //       // ImageCard(
                  //       //       imageLocation: doctorsList[index]["image"],
                  //       //       doctorName: doctorsList[index]["title"],
                  //       //       doctorDepartment: doctorsList[index]
                  //       //           ["department"],
                  //       //     ),
                  //       separatorBuilder: (context, index) => const SizedBox(
                  //             height: 10,
                  //             width: 10,
                  //           ),
                  //       itemCount: doctorsList.length),
                  // )
                  ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: List.generate(
                      doctorsList.length,
                      (index) => Container(
                        decoration: const BoxDecoration(
                            border: Border(
                          bottom: BorderSide(width: 1.0, color: Colors.grey),
                        )),
                        child: ListTile(
                          tileColor: Colors.white,
                          style: ListTileStyle.drawer,
                          leading: Image.asset(
                            doctorsList[index]["image"].toString(),
                          ),
                          title: Text(
                            doctorsList[index]["title"].toString(),
                          ),
                          subtitle:
                              Text(doctorsList[index]["department"].toString()),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
