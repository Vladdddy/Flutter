import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFF052A48),
        body: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 25.0),
            child: Padding(
              padding: EdgeInsets.all(25.0),
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(196, 5, 42, 72),
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withValues(alpha: 0.6),
                          blurRadius: 15.0,
                          spreadRadius: 5.0,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 25.0,
                        right: 80.0,
                        bottom: 25.0,
                        left: 80.0,
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                            child: Text(
                          "STATUS",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                blurRadius: 10.0,
                                color: Colors.blue,
                                offset: Offset(0, 0),
                              ),
                              Shadow(
                                blurRadius: 20.0,
                                color: Colors.blueAccent,
                                offset: Offset(0, 0),
                              ),
                              Shadow(
                                blurRadius: 30.0,
                                color: Colors.lightBlueAccent,
                                offset: Offset(0, 0),
                              ),
                            ],
                          ),
                        )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 80.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          child: Expanded(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 25.0),
                                  child: SizedBox(
                                    child: Center(
                                      child: Text(
                                        "0",
                                        style: TextStyle(
                                          fontSize: 50,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          shadows: [
                                            Shadow(
                                              blurRadius: 10.0,
                                              color: Colors.blue,
                                              offset: Offset(0, 0),
                                            ),
                                            Shadow(
                                              blurRadius: 20.0,
                                              color: Colors.blueAccent,
                                              offset: Offset(0, 0),
                                            ),
                                            Shadow(
                                              blurRadius: 30.0,
                                              color: Colors.lightBlueAccent,
                                              offset: Offset(0, 0),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  child: Center(
                                      child: Text(
                                    "Level",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      shadows: [
                                        Shadow(
                                          blurRadius: 10.0,
                                          color: Colors.blue,
                                          offset: Offset(0, 0),
                                        ),
                                        Shadow(
                                          blurRadius: 20.0,
                                          color: Colors.blueAccent,
                                          offset: Offset(0, 0),
                                        ),
                                        Shadow(
                                          blurRadius: 30.0,
                                          color: Colors.lightBlueAccent,
                                          offset: Offset(0, 0),
                                        ),
                                      ],
                                    ),
                                  )),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          child: Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 25.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        child: Center(
                                          child: Text(
                                            "RANK:",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white,
                                              shadows: [
                                                Shadow(
                                                  blurRadius: 10.0,
                                                  color: Colors.blue,
                                                  offset: Offset(0, 0),
                                                ),
                                                Shadow(
                                                  blurRadius: 20.0,
                                                  color: Colors.blueAccent,
                                                  offset: Offset(0, 0),
                                                ),
                                                Shadow(
                                                  blurRadius: 30.0,
                                                  color: Colors.lightBlueAccent,
                                                  offset: Offset(0, 0),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      SizedBox(
                                        child: Center(
                                          child: Text(
                                            "E",
                                            style: TextStyle(
                                              fontSize: 50,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              shadows: [
                                                Shadow(
                                                  blurRadius: 10.0,
                                                  color: Colors.blue,
                                                  offset: Offset(0, 0),
                                                ),
                                                Shadow(
                                                  blurRadius: 20.0,
                                                  color: Colors.blueAccent,
                                                  offset: Offset(0, 0),
                                                ),
                                                Shadow(
                                                  blurRadius: 30.0,
                                                  color: Colors.lightBlueAccent,
                                                  offset: Offset(0, 0),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      child: Center(
                                          child: Text(
                                        "JOB:",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                          shadows: [
                                            Shadow(
                                              blurRadius: 10.0,
                                              color: Colors.blue,
                                              offset: Offset(0, 0),
                                            ),
                                            Shadow(
                                              blurRadius: 20.0,
                                              color: Colors.blueAccent,
                                              offset: Offset(0, 0),
                                            ),
                                            Shadow(
                                              blurRadius: 30.0,
                                              color: Colors.lightBlueAccent,
                                              offset: Offset(0, 0),
                                            ),
                                          ],
                                        ),
                                      )),
                                    ),
                                    SizedBox(width: 10),
                                    SizedBox(
                                      child: Center(
                                          child: Text(
                                        "Wolf Assassin",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          shadows: [
                                            Shadow(
                                              blurRadius: 10.0,
                                              color: Colors.blue,
                                              offset: Offset(0, 0),
                                            ),
                                            Shadow(
                                              blurRadius: 20.0,
                                              color: Colors.blueAccent,
                                              offset: Offset(0, 0),
                                            ),
                                            Shadow(
                                              blurRadius: 30.0,
                                              color: Colors.lightBlueAccent,
                                              offset: Offset(0, 0),
                                            ),
                                          ],
                                        ),
                                      )),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 200.0),
                    child: Padding(
                      padding: EdgeInsets.all(25.0),
                      child: Container(
                        width: double.infinity,
                        height: 100,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFF0C4D83),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                          color: Color(0xFF0C4D83),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.blue
                                                  .withValues(alpha: 0.6),
                                              blurRadius: 16.0,
                                              spreadRadius: 8.0,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Icon(
                                        Icons.star_rounded,
                                        size: 32,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 8.0),
                                  Text(
                                    "150 / 1.000",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      shadows: [
                                        Shadow(
                                          blurRadius: 10.0,
                                          color: Colors.blue,
                                          offset: Offset(0, 0),
                                        ),
                                        Shadow(
                                          blurRadius: 20.0,
                                          color: Colors.blueAccent,
                                          offset: Offset(0, 0),
                                        ),
                                        Shadow(
                                          blurRadius: 30.0,
                                          color: Colors.lightBlueAccent,
                                          offset: Offset(0, 0),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15.0),
                              Stack(
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: double.infinity,
                                      height: 5,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF0B3E68),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: 50,
                                      height: 5,
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 310.0),
                    child: Padding(
                      padding: EdgeInsets.all(25.0),
                      child: Container(
                        width: double.infinity,
                        height: 180,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFF0C4D83),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                          color: Color(0xFF0C4D83),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.blue
                                                  .withValues(alpha: 0.6),
                                              blurRadius: 16.0,
                                              spreadRadius: 8.0,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Icon(
                                            Icons.add,
                                            size: 32,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            "HP",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              shadows: [
                                                Shadow(
                                                  blurRadius: 10.0,
                                                  color: Colors.blue,
                                                  offset: Offset(0, 0),
                                                ),
                                                Shadow(
                                                  blurRadius: 20.0,
                                                  color: Colors.blueAccent,
                                                  offset: Offset(0, 0),
                                                ),
                                                Shadow(
                                                  blurRadius: 30.0,
                                                  color: Colors.lightBlueAccent,
                                                  offset: Offset(0, 0),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 10.0),
                                  Stack(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          width: 120,
                                          height: 5,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF0B3E68),
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          width: 120,
                                          height: 5,
                                          decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 10.0),
                                  Text(
                                    "100 / 100",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      shadows: [
                                        Shadow(
                                          blurRadius: 10.0,
                                          color: Colors.blue,
                                          offset: Offset(0, 0),
                                        ),
                                        Shadow(
                                          blurRadius: 20.0,
                                          color: Colors.blueAccent,
                                          offset: Offset(0, 0),
                                        ),
                                        Shadow(
                                          blurRadius: 30.0,
                                          color: Colors.lightBlueAccent,
                                          offset: Offset(0, 0),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 25),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.blue
                                                  .withValues(alpha: 0.6),
                                              blurRadius: 16.0,
                                              spreadRadius: 8.0,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Icon(
                                            Icons.storm,
                                            size: 32,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            "ENG",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              shadows: [
                                                Shadow(
                                                  blurRadius: 10.0,
                                                  color: Colors.blue,
                                                  offset: Offset(0, 0),
                                                ),
                                                Shadow(
                                                  blurRadius: 20.0,
                                                  color: Colors.blueAccent,
                                                  offset: Offset(0, 0),
                                                ),
                                                Shadow(
                                                  blurRadius: 30.0,
                                                  color: Colors.lightBlueAccent,
                                                  offset: Offset(0, 0),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 10.0),
                                  Stack(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          width: 120,
                                          height: 5,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF0B3E68),
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          width: 100,
                                          height: 5,
                                          decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 10.0),
                                  Text(
                                    "80 / 100",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      shadows: [
                                        Shadow(
                                          blurRadius: 10.0,
                                          color: Colors.blue,
                                          offset: Offset(0, 0),
                                        ),
                                        Shadow(
                                          blurRadius: 20.0,
                                          color: Colors.blueAccent,
                                          offset: Offset(0, 0),
                                        ),
                                        Shadow(
                                          blurRadius: 30.0,
                                          color: Colors.lightBlueAccent,
                                          offset: Offset(0, 0),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 500.0),
                    child: Padding(
                      padding: EdgeInsets.all(25.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFF0C4D83),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                          color: Color(0xFF0C4D83),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Container(
                                                width: 20,
                                                height: 20,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.blue
                                                          .withValues(
                                                              alpha: 0.6),
                                                      blurRadius: 16.0,
                                                      spreadRadius: 8.0,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Icon(
                                                Icons.shield,
                                                size: 32,
                                                color: Colors.white,
                                              ),
                                            ],
                                          ),
                                          SizedBox(width: 8.0),
                                          Text(
                                            "STR: 12",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              shadows: [
                                                Shadow(
                                                  blurRadius: 10.0,
                                                  color: Colors.blue,
                                                  offset: Offset(0, 0),
                                                ),
                                                Shadow(
                                                  blurRadius: 20.0,
                                                  color: Colors.blueAccent,
                                                  offset: Offset(0, 0),
                                                ),
                                                Shadow(
                                                  blurRadius: 30.0,
                                                  color: Colors.lightBlueAccent,
                                                  offset: Offset(0, 0),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 15.0),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Container(
                                                width: 20,
                                                height: 20,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.blue
                                                          .withValues(
                                                              alpha: 0.6),
                                                      blurRadius: 16.0,
                                                      spreadRadius: 8.0,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Icon(
                                                Icons.speed,
                                                size: 32,
                                                color: Colors.white,
                                              ),
                                            ],
                                          ),
                                          SizedBox(width: 8.0),
                                          Text(
                                            "AGL: 38",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              shadows: [
                                                Shadow(
                                                  blurRadius: 10.0,
                                                  color: Colors.blue,
                                                  offset: Offset(0, 0),
                                                ),
                                                Shadow(
                                                  blurRadius: 20.0,
                                                  color: Colors.blueAccent,
                                                  offset: Offset(0, 0),
                                                ),
                                                Shadow(
                                                  blurRadius: 30.0,
                                                  color: Colors.lightBlueAccent,
                                                  offset: Offset(0, 0),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Container(
                                                width: 20,
                                                height: 20,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.blue
                                                          .withValues(
                                                              alpha: 0.6),
                                                      blurRadius: 16.0,
                                                      spreadRadius: 8.0,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Icon(
                                                Icons.favorite,
                                                size: 32,
                                                color: Colors.white,
                                              ),
                                            ],
                                          ),
                                          SizedBox(width: 8.0),
                                          Text(
                                            "HLT: 98",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              shadows: [
                                                Shadow(
                                                  blurRadius: 10.0,
                                                  color: Colors.blue,
                                                  offset: Offset(0, 0),
                                                ),
                                                Shadow(
                                                  blurRadius: 20.0,
                                                  color: Colors.blueAccent,
                                                  offset: Offset(0, 0),
                                                ),
                                                Shadow(
                                                  blurRadius: 30.0,
                                                  color: Colors.lightBlueAccent,
                                                  offset: Offset(0, 0),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 15.0),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Container(
                                                width: 20,
                                                height: 20,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.blue
                                                          .withValues(
                                                              alpha: 0.6),
                                                      blurRadius: 16.0,
                                                      spreadRadius: 8.0,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Icon(
                                                Icons.workspaces_outlined,
                                                size: 32,
                                                color: Colors.white,
                                              ),
                                            ],
                                          ),
                                          SizedBox(width: 8.0),
                                          Text(
                                            "MAN: 47",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              shadows: [
                                                Shadow(
                                                  blurRadius: 10.0,
                                                  color: Colors.blue,
                                                  offset: Offset(0, 0),
                                                ),
                                                Shadow(
                                                  blurRadius: 20.0,
                                                  color: Colors.blueAccent,
                                                  offset: Offset(0, 0),
                                                ),
                                                Shadow(
                                                  blurRadius: 30.0,
                                                  color: Colors.lightBlueAccent,
                                                  offset: Offset(0, 0),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: SizedBox(
                      height: 10.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
