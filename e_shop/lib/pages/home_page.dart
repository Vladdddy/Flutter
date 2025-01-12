import 'package:flutter/material.dart';
import 'package:e_shop/custom_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _items = [
    "Echo Dot (4th Gen)",
    "Fire TV Stick with Alexa Voice Remote",
    "Kindle Paperwhite",
    "Apple AirPods Pro",
    "Samsung Galaxy Watch",
    "Instant Pot Duo 7-in-1",
    "iRobot Roomba Vacuum",
    "Hydro Flask Water Bottle",
    "Anker PowerCore Portable Charger",
  ];
  String selectedButton = "All";

  List<String> _filteredItems = [];
  bool _isListVisible = false;

  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _filteredItems = _items;

    _focusNode.addListener(() {
      setState(() {
        _isListVisible = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _updateSearch(String query) {
    setState(() {
      _filteredItems = _items
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: Color(0xFFECEDEF),
          endDrawer: Drawer(
            backgroundColor: Colors.white,
            child: Column(
              children: [
                SizedBox(height: 100),
                ClipRRect(
                  child: Image.asset(
                    'lib/images/icon1.png',
                    width: 100,
                  ),
                ),
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(Icons.favorite_border, size: 32),
                    title: Text("Wish list"),
                    onTap: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(CustomIcons.library_icon, size: 32),
                    title: Text("Your lists"),
                    onTap: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(CustomIcons.user, size: 32),
                    title: Text("Account"),
                    onTap: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(Icons.payment, size: 32),
                    title: Text("Payments"),
                    onTap: () {},
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, bottom: 125.0),
                  child: ListTile(
                    leading: Icon(Icons.logout, size: 32),
                    title: Text("Logout"),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Center(
                              child: Row(
                                children: [
                                  Icon(CustomIcons.delete, size: 20),
                                  SizedBox(width: 25),
                                  Text("Do you want to logout?",
                                      style: TextStyle(fontSize: 16))
                                ],
                              ),
                            ),
                            actions: [
                              Padding(
                                padding: EdgeInsets.only(top: 25.0),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          height: 50,
                                          decoration: BoxDecoration(
                                              color: Color(0xFFBFFFBC),
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          child: Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: Center(
                                              child: Text("Confirm",
                                                  style: TextStyle(
                                                    color: Color(0xFF11C907),
                                                  )),
                                            ),
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          height: 50,
                                          decoration: BoxDecoration(
                                              color: Color(0xFFFFB4B4),
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          child: Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: Center(
                                              child: Text("Cancel",
                                                  style: TextStyle(
                                                      color:
                                                          Color(0xFFFF0000))),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 50.0, right: 20.0, left: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 300,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: TextField(
                            focusNode: _focusNode,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.black),
                            onChanged: _updateSearch,
                            decoration: InputDecoration(
                              hintText: "search",
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: Color(0xFFB8B8B8)),
                              icon: Icon(
                                CustomIcons.search,
                                color: Color(0xFFB8B8B8),
                                size: 24,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Builder(builder: (context) {
                        return GestureDetector(
                          onTap: () {
                            Scaffold.of(context).openEndDrawer();
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 20.0),
                            child: Icon(
                              CustomIcons.menu1,
                              color: Colors.black,
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
                // Display list only if _isListVisible is true
                if (_isListVisible)
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: _filteredItems.isEmpty
                        ? Padding(
                            padding: const EdgeInsets.only(top: 50.0),
                            child: Text("No matches found"),
                          )
                        : ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true, // Prevents overflow
                            itemCount: _filteredItems.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(bottom: 10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white,
                                ),
                                child: ListTile(
                                  leading: Icon(CustomIcons.search),
                                  title: Text(
                                    _filteredItems[index],
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                Column(
                  children: [
                    SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.only(right: 25.0, left: 25.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all<Color>(
                                  selectedButton == "All"
                                      ? Color(0xFFB2DBFF)
                                      : Colors.transparent,
                                ),
                                elevation: WidgetStateProperty.all<double>(0.0),
                                shape: WidgetStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  selectedButton = "All";
                                });
                              },
                              child: Text(
                                "All",
                                style: TextStyle(
                                  color: selectedButton == "All"
                                      ? Color(0xFF0088FF)
                                      : Color(0xFF0088FF),
                                ),
                              ),
                            ),
                            SizedBox(width: 5.0),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all<Color>(
                                  selectedButton == "Technology"
                                      ? Color(0xFFB2DBFF)
                                      : Colors.transparent,
                                ),
                                elevation: WidgetStateProperty.all<double>(0.0),
                                shape: WidgetStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  selectedButton = "Technology";
                                });
                              },
                              child: Text(
                                "Technology",
                                style: TextStyle(
                                  color: selectedButton == "Technology"
                                      ? Color(0xFF0088FF)
                                      : Color(0xFF0088FF),
                                ),
                              ),
                            ),
                            SizedBox(width: 5.0),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all<Color>(
                                  selectedButton == "Sports"
                                      ? Color(0xFFB2DBFF)
                                      : Colors.transparent,
                                ),
                                elevation: WidgetStateProperty.all<double>(0.0),
                                shape: WidgetStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  selectedButton = "Sports";
                                });
                              },
                              child: Text(
                                "Sports",
                                style: TextStyle(
                                  color: selectedButton == "Sports"
                                      ? Color(0xFF0088FF)
                                      : Color(0xFF0088FF),
                                ),
                              ),
                            ),
                            SizedBox(width: 5.0),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all<Color>(
                                  selectedButton == "Sweater"
                                      ? Color(0xFFB2DBFF)
                                      : Colors.transparent,
                                ),
                                elevation: WidgetStateProperty.all<double>(0.0),
                                shape: WidgetStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  selectedButton = "Sweater";
                                });
                              },
                              child: Text(
                                "Sweater",
                                style: TextStyle(
                                  color: selectedButton == "Sweater"
                                      ? Color(0xFF0088FF)
                                      : Color(0xFF0088FF),
                                ),
                              ),
                            ),
                            SizedBox(width: 5.0),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all<Color>(
                                  selectedButton == "Shoes"
                                      ? Color(0xFFB2DBFF)
                                      : Colors.transparent,
                                ),
                                elevation: WidgetStateProperty.all<double>(0.0),
                                shape: WidgetStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  selectedButton = "Shoes";
                                });
                              },
                              child: Text(
                                "Shoes",
                                style: TextStyle(
                                  color: selectedButton == "Shoes"
                                      ? Color(0xFF0088FF)
                                      : Color(0xFF0088FF),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                //Reecently added section
                Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 25.0, right: 25.0, left: 25.0),
                          child: Text(
                            "Recently added",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, right: 25.0, left: 25.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Container(
                                      height: 260,
                                      width: 180,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ClipRRect(
                                            child: Image.asset(
                                              'lib/images/samsung_book3.jpg',
                                              width: 150,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text(
                                                "Samsung Galaxy Book3 Pro",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Container(
                                      height: 260,
                                      width: 180,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ClipRRect(
                                            child: Image.asset(
                                              'lib/images/intel7.jpg',
                                              width: 150,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text(
                                                "Processor Intel Core I7-130P",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Container(
                                      height: 260,
                                      width: 180,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ClipRRect(
                                            child: Image.asset(
                                              'lib/images/samsung_ultra.jpg',
                                              height: 150,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text(
                                                "Samsung Galaxy Book3 360",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                //You might like section
                Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 50.0, right: 25.0, left: 25.0),
                          child: Text(
                            "You might like",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, right: 25.0, left: 25.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        Center(
                                          child: Container(
                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: Icon(CustomIcons.nike,
                                                size: 80),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10.0),
                                          child: Text(
                                            "Nike",
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 10),
                                    Column(
                                      children: [
                                        Center(
                                          child: Container(
                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: Icon(CustomIcons.adidas,
                                                size: 80),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10.0),
                                          child: Text(
                                            "Adidas",
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 10),
                                    Column(
                                      children: [
                                        Center(
                                          child: Container(
                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: Icon(CustomIcons.apple,
                                                size: 80),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10.0),
                                          child: Text(
                                            "Apple",
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                //Technology section
                Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 50.0, right: 25.0, left: 25.0),
                          child: Text(
                            "Technology",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, right: 25.0, left: 25.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Container(
                                      height: 260,
                                      width: 180,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ClipRRect(
                                            child: Image.asset(
                                              'lib/images/intel7.jpg',
                                              width: 150,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text(
                                                "Processor Intel Core I7-130P",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 10.0),
                                    Container(
                                      height: 260,
                                      width: 180,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ClipRRect(
                                            child: Image.asset(
                                              'lib/images/samsung_book3.jpg',
                                              width: 150,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text(
                                                "Samsung Galaxy Book3 Pro",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Container(
                                      height: 260,
                                      width: 180,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ClipRRect(
                                            child: Image.asset(
                                              'lib/images/samsung_ultra.jpg',
                                              height: 150,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text(
                                                "Samsung Galaxy Book3 360",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                //Searches section
                Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 50.0, right: 25.0, left: 25.0),
                          child: Text(
                            "Popular searches",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 25.0, left: 25.0, right: 25.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              height: 50,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStateProperty.all<Color>(
                                    selectedButton == "Affordable Gaming PC"
                                        ? Color(0xFFB2DBFF)
                                        : Color(0xFFB2DBFF),
                                  ),
                                  elevation:
                                      WidgetStateProperty.all<double>(0.0),
                                  shape: WidgetStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    selectedButton = "Affordable Gaming PC";
                                  });
                                },
                                child: Row(
                                  children: [
                                    Icon(CustomIcons.search,
                                        size: 24, color: Color(0xFF0088FF)),
                                    SizedBox(width: 10.0),
                                    Text(
                                      "Affordable Gaming PC",
                                      style: TextStyle(
                                        color: Color(0xFF0088FF),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              height: 50,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStateProperty.all<Color>(
                                    selectedButton == "Bulk Protein"
                                        ? Color(0xFFB2DBFF)
                                        : Color(0xFFB2DBFF),
                                  ),
                                  elevation:
                                      WidgetStateProperty.all<double>(0.0),
                                  shape: WidgetStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    selectedButton = "Bulk Protein";
                                  });
                                },
                                child: Row(
                                  children: [
                                    Icon(CustomIcons.search,
                                        size: 24, color: Color(0xFF0088FF)),
                                    SizedBox(width: 10.0),
                                    Text(
                                      "Bulk Protein",
                                      style: TextStyle(
                                        color: Color(0xFF0088FF),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              height: 50,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStateProperty.all<Color>(
                                    selectedButton == "Mouse Wireless"
                                        ? Color(0xFFB2DBFF)
                                        : Color(0xFFB2DBFF),
                                  ),
                                  elevation:
                                      WidgetStateProperty.all<double>(0.0),
                                  shape: WidgetStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    selectedButton = "Mouse Wireless";
                                  });
                                },
                                child: Row(
                                  children: [
                                    Icon(CustomIcons.search,
                                        size: 24, color: Color(0xFF0088FF)),
                                    SizedBox(width: 10.0),
                                    Text(
                                      "Mouse Wireless",
                                      style: TextStyle(
                                        color: Color(0xFF0088FF),
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
                  ],
                ),

                //Offers section
                Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 50.0, right: 25.0, left: 25.0),
                          child: Text(
                            "Offers made for you",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, right: 25.0, left: 25.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            Center(
                                              child: Container(
                                                height: 100,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    ClipRRect(
                                                      child: Image.asset(
                                                        'lib/images/mouse2.jpg',
                                                        height: 50,
                                                      ),
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: Color(
                                                                  0xFFFF0000)),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100),
                                                          color: Color(
                                                              0xFFFFC6C6)),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 10.0,
                                                                right: 10.0),
                                                        child: Text(
                                                          "20% off",
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFFFF0000),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 10),
                                        Column(
                                          children: [
                                            Center(
                                              child: Container(
                                                height: 100,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    ClipRRect(
                                                      child: Image.asset(
                                                        'lib/images/intel7.jpg',
                                                        height: 50,
                                                      ),
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: Color(
                                                                  0xFFFF0000)),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100),
                                                          color: Color(
                                                              0xFFFFC6C6)),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 10.0,
                                                                right: 10.0),
                                                        child: Text(
                                                          "17% off",
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFFFF0000),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 10),
                                        Column(
                                          children: [
                                            Center(
                                              child: Container(
                                                height: 100,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    ClipRRect(
                                                      child: Image.asset(
                                                        'lib/images/samsung_book3.jpg',
                                                        height: 50,
                                                      ),
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: Color(
                                                                  0xFFFF0000)),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100),
                                                          color: Color(
                                                              0xFFFFC6C6)),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 10.0,
                                                                right: 10.0),
                                                        child: Text(
                                                          "40% off",
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFFFF0000),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            Center(
                                              child: Container(
                                                height: 100,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    ClipRRect(
                                                      child: Image.asset(
                                                        'lib/images/mouse.jpg',
                                                        height: 50,
                                                      ),
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: Color(
                                                                  0xFFFF0000)),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100),
                                                          color: Color(
                                                              0xFFFFC6C6)),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 10.0,
                                                                right: 10.0),
                                                        child: Text(
                                                          "38% off",
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFFFF0000),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 10),
                                        Column(
                                          children: [
                                            Center(
                                              child: Container(
                                                height: 100,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    ClipRRect(
                                                      child: Image.asset(
                                                        'lib/images/samsung_ultra.jpg',
                                                        height: 50,
                                                      ),
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: Color(
                                                                  0xFFFF0000)),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100),
                                                          color: Color(
                                                              0xFFFFC6C6)),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 10.0,
                                                                right: 10.0),
                                                        child: Text(
                                                          "10% off",
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFFFF0000),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 10),
                                        Column(
                                          children: [
                                            Center(
                                              child: Container(
                                                height: 100,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    ClipRRect(
                                                      child: Image.asset(
                                                        'lib/images/mouse3.jpg',
                                                        height: 50,
                                                      ),
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: Color(
                                                                  0xFFFF0000)),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100),
                                                          color: Color(
                                                              0xFFFFC6C6)),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 10.0,
                                                                right: 10.0),
                                                        child: Text(
                                                          "19% off",
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFFFF0000),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
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
                        ],
                      ),
                    ),
                  ],
                ),

                //Books
                Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 50.0, right: 25.0, left: 25.0),
                          child: Text(
                            "Books released",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, right: 25.0, left: 25.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Container(
                                      height: 260,
                                      width: 180,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ClipRRect(
                                            child: Image.asset(
                                              'lib/images/jjk.jpg',
                                              height: 150,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text(
                                                "Manga Jujutsu Kaisen vol 26",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Container(
                                      height: 260,
                                      width: 180,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ClipRRect(
                                            child: Image.asset(
                                              'lib/images/laws.jpg',
                                              height: 150,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text(
                                                "48 Laws of Power - Robert Greene",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Container(
                                      height: 260,
                                      width: 180,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ClipRRect(
                                            child: Image.asset(
                                              'lib/images/mamba.jpg',
                                              height: 150,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text(
                                                "The Mamba Mentality - Kobe Bryant",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                //Mouse
                Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 50.0, right: 25.0, left: 25.0),
                          child: Text(
                            "Gaming mouses",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, right: 25.0, left: 25.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Container(
                                      height: 260,
                                      width: 180,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ClipRRect(
                                            child: Image.asset(
                                              'lib/images/mouse.jpg',
                                              height: 150,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text(
                                                "Logitech wireless mouse LED",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Container(
                                      height: 260,
                                      width: 180,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ClipRRect(
                                            child: Image.asset(
                                              'lib/images/mouse2.jpg',
                                              height: 150,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text(
                                                "Gaming Logitech mouse 480 DPI",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Container(
                                      height: 260,
                                      width: 180,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ClipRRect(
                                            child: Image.asset(
                                              'lib/images/mouse3.jpg',
                                              height: 150,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text(
                                                "Wireless light gaming mouse ",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 150),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
