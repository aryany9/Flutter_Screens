import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBarWidget extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        height: 250.0,
        child: Stack(
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(20),
                // color: Colors.red,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/blue.jpeg"),
                    fit: BoxFit.fill,
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 3),
                              image: const DecorationImage(
                                  image: AssetImage("assets/Avatar.png"),
                                  fit: BoxFit.fill),
                              shape: BoxShape.circle),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.notifications_outlined,
                              color: Colors.white,
                              size: 30,
                            ))
                      ],
                    ),
                    SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Good Morning and stay healthy",
                          style: TextStyle(
                            color: Colors.grey[300],
                            fontSize: 14.0,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          "Hi Jeny, how are you?",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                          ),
                        ),
                      ],
                    )
                  ],
                )),
            Positioned(
              top: 180.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13.0),
                      border: Border.all(
                          color: Colors.grey.withOpacity(0.5), width: 1.0),
                      color: Colors.white),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.menu,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          print("your menu action here");
                          _scaffoldKey.currentState!.openDrawer();
                        },
                      ),
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Search",
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.search,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          print("your menu action here");
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.notifications,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          print("your menu action here");
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
