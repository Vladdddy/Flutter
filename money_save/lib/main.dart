import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:io';

bool isDarkMode = false;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double amount = 0;
  double goal = 10;
  List<Map<String, dynamic>> transactions = [];
  File? _image;
  String _name = "Guest";

  @override
  void initState() {
    super.initState();
    _loadAmount();
    _loadGoal();
    _loadTransactions();
    _loadThemeMode();
    _loadUserData();
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      _saveImage(pickedFile.path);
    }
  }

  Future<void> _changeName() async {
    TextEditingController nameController = TextEditingController(text: _name);
    Color backgroundColor = isDarkMode ? Color(0xFF5B5B5B) : Color(0xFFF0ECEC);
    Color textColorGrey = isDarkMode ? Color(0xFFF0ECEC) : Color(0xFF575757);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 25.0),
          child: Center(
            child: Text(
              "Change username",
              style: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: textColorGrey,
              ),
            ),
          ),
        ),
        backgroundColor: backgroundColor,
        content: TextField(
          cursorColor: Color(0xFFFFFFFF),
          cursorWidth: 1.0,
          maxLength: 40,
          controller: nameController,
          style: TextStyle(fontSize: 16, color: textColorGrey),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 8),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Color(0xFF3D50B9), width: 2),
            ),
            prefixIcon: Icon(
              Icons.person_outline_sharp,
              size: 16,
              color: textColorGrey,
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Cancel",
                style: GoogleFonts.montserrat(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: textColorGrey,
                )),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: Color(0xFF3D50B9),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            onPressed: () {
              setState(() {
                _name = nameController.text;
              });
              _saveName(_name);
              Navigator.pop(context);
            },
            child: Text("Save",
                style: GoogleFonts.montserrat(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFFFFFFF),
                )),
          ),
        ],
      ),
    );
  }

  void _confirmClearHistory() {
    Color backgroundColor = isDarkMode ? Color(0xFF5B5B5B) : Color(0xFFF0ECEC);
    Color textColorGrey = isDarkMode ? Color(0xFFF0ECEC) : Color(0xFF575757);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: backgroundColor,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 25.0),
          child: Center(
            child: Text(
              "Clear history?",
              style: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: textColorGrey,
              ),
            ),
          ),
        ),
        content: Text(
          textAlign: TextAlign.center,
          "Are you sure you want to delete all transactions?",
          style: GoogleFonts.montserrat(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: textColorGrey,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Cancel",
                style: GoogleFonts.montserrat(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: textColorGrey,
                )),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: Color(0xFF3D50B9),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            onPressed: () {
              _clearHistory();
              Navigator.pop(context);
            },
            child: Text("Yes, clear",
                style: GoogleFonts.montserrat(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFFFFFFF),
                )),
          ),
        ],
      ),
    );
  }

  void _clearHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      transactions.clear();
      amount = 0;
    });

    await prefs.remove('transactions');
    await prefs.setDouble('amount', 0);
  }

  Future<void> _saveImage(String path) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('profileImage', path);
  }

  Future<void> _saveName(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', name);
  }

  Future<void> _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _name = prefs.getString('userName') ?? "Guest";
      String? imagePath = prefs.getString('profileImage');
      if (imagePath != null) _image = File(imagePath);
    });
  }

  Future<void> _loadThemeMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isDarkMode = prefs.getBool('isDarkMode') ?? false;
    });
  }

  Future<void> _saveThemeMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', isDarkMode);
  }

  Future<void> _loadTransactions() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? transactionData = prefs.getString('transactions');

    if (transactionData != null) {
      setState(() {
        transactions = List<Map<String, dynamic>>.from(
          List<dynamic>.from(jsonDecode(transactionData)),
        );
      });
    }
  }

  Future<void> _saveTransactions() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('transactions', jsonEncode(transactions));
  }

  void _addTransaction(double amount, bool isSavings, String subject) {
    setState(() {
      transactions.insert(0, {
        "amount": amount,
        "isSavings": isSavings,
        "subject": subject,
        "timestamp": DateTime.now().toString(),
      });

      if (transactions.length > 10) {
        transactions.removeLast();
      }
    });

    _saveTransactions();
  }

  Future<void> _loadGoal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      goal = prefs.getDouble('goal') ?? 0.0;
    });
  }

  Future<void> _saveGoal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('goal', goal);
  }

  Future<void> _loadAmount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      amount = prefs.getDouble('amount') ?? 0;
    });
  }

  Future<void> _saveAmount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('amount', amount);
  }

  void showChangeGoalDialog(BuildContext context) {
    TextEditingController goalController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        Color backgroundColor =
            isDarkMode ? Color(0xFF5B5B5B) : Color(0xFFF0ECEC);
        Color textColorGrey =
            isDarkMode ? Color(0xFFF0ECEC) : Color(0xFF575757);
        return AlertDialog(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: Center(
              child: Text(
                "Set goal amount",
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: textColorGrey,
                ),
              ),
            ),
          ),
          content: TextField(
            cursorColor: Color(0xFFFFFFFF),
            cursorWidth: 1.0,
            controller: goalController,
            keyboardType: TextInputType.number,
            style: TextStyle(fontSize: 16, color: textColorGrey),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 8),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Color(0xFF3D50B9), width: 2),
              ),
              prefixIcon: Icon(
                Icons.adjust_rounded,
                size: 16,
                color: textColorGrey,
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel",
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: textColorGrey,
                  )),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Color(0xFF3D50B9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: () {
                String input = goalController.text;
                double? newGoal = double.tryParse(input);

                if (newGoal != null) {
                  setState(() {
                    goal = newGoal;
                  });
                  _saveGoal();
                }

                Navigator.of(context).pop();
              },
              child: Text("Save",
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFFFFFFF),
                  )),
            ),
          ],
        );
      },
    );
  }

  void showAddSavingsDialog(BuildContext context) {
    TextEditingController amountController = TextEditingController();
    TextEditingController subjectController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        Color backgroundColor =
            isDarkMode ? Color(0xFF5B5B5B) : Color(0xFFF0ECEC);
        Color textColorGrey =
            isDarkMode ? Color(0xFFF0ECEC) : Color(0xFF575757);
        return AlertDialog(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: Center(
              child: Text(
                "Set amount to add",
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: textColorGrey,
                ),
              ),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                cursorColor: Color(0xFFFFFFFF),
                cursorWidth: 1.0,
                controller: amountController,
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 16, color: textColorGrey),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Color(0xFF3D50B9), width: 2),
                  ),
                  prefixIcon: Icon(
                    Icons.add,
                    size: 16,
                    color: textColorGrey,
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                cursorColor: Color(0xFFFFFFFF),
                cursorWidth: 1.0,
                maxLength: 20,
                controller: subjectController,
                style: TextStyle(fontSize: 16, color: textColorGrey),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Color(0xFF3D50B9), width: 2),
                  ),
                  hintText: "Subject",
                  hintStyle: GoogleFonts.montserrat(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF9A9A9A),
                  ),
                  prefixIcon: Icon(
                    Icons.subject,
                    size: 16,
                    color: textColorGrey,
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel",
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: textColorGrey,
                  )),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Color(0xFF3D50B9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: () {
                String input = amountController.text;
                String subject = subjectController.text;
                double? newAmount = double.tryParse(input);
                if (newAmount != null) {
                  setState(() {
                    amount += newAmount;
                  });
                  _addTransaction(newAmount, true, subject);
                  _saveAmount();
                }
                Navigator.of(context).pop();
              },
              child: Text("Save",
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFFFFFFF),
                  )),
            ),
          ],
        );
      },
    );
  }

  void showBorrowDialog(BuildContext context) {
    TextEditingController amountController = TextEditingController();
    TextEditingController subjectController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        Color backgroundColor =
            isDarkMode ? Color(0xFF5B5B5B) : Color(0xFFF0ECEC);
        Color textColorGrey =
            isDarkMode ? Color(0xFFF0ECEC) : Color(0xFF575757);
        return AlertDialog(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: Center(
              child: Text(
                "Set amount to borrow",
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: textColorGrey,
                ),
              ),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                cursorColor: Color(0xFFFFFFFF),
                cursorWidth: 1.0,
                controller: amountController,
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 16, color: textColorGrey),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Color(0xFF3D50B9), width: 2),
                  ),
                  prefixIcon: Icon(
                    Icons.remove,
                    size: 16,
                    color: textColorGrey,
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                cursorColor: Color(0xFFFFFFFF),
                cursorWidth: 1.0,
                maxLength: 20,
                controller: subjectController,
                style: TextStyle(fontSize: 16, color: textColorGrey),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Color(0xFF3D50B9), width: 2),
                  ),
                  hintText: "Subject",
                  hintStyle: GoogleFonts.montserrat(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF9A9A9A),
                  ),
                  prefixIcon: Icon(
                    Icons.subject,
                    size: 16,
                    color: textColorGrey,
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel",
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: textColorGrey,
                  )),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Color(0xFF3D50B9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: () {
                String input = amountController.text;
                String subject = subjectController.text;
                double? borrowAmount = double.tryParse(input);

                if (borrowAmount != null && borrowAmount <= amount) {
                  setState(() {
                    amount -= borrowAmount;
                  });
                  _addTransaction(borrowAmount, false, subject);
                  _saveAmount();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Not enough savings to borrow!")),
                  );
                }

                Navigator.of(context).pop();
              },
              child: Text("Save",
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFFFFFFF),
                  )),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = isDarkMode ? Color(0xFF1E1E1E) : Colors.white;
    Color textColorGrey = isDarkMode ? Color(0xFF8E8E8E) : Color(0xFF1E1E1E);
    Color textColorWhite = isDarkMode ? Color(0xFFFFFFFF) : Color(0xFF1E1E1E);
    Color background = isDarkMode ? Color(0xFF1F2C71) : Color(0xFF3D50B9);

    ThemeData(
      textTheme: GoogleFonts.montserratTextTheme(),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: background,
        body: ListView(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: _pickImage,
                        child: SizedBox(
                          width: 48,
                          height: 48,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: _image != null
                                ? Image.file(_image!, fit: BoxFit.cover)
                                : Image.asset('assets/default_avatar.png',
                                    fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: _changeName,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome Back',
                              style: GoogleFonts.montserrat(
                                fontSize: 8,
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              _name,
                              style: GoogleFonts.montserrat(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(
                      isDarkMode
                          ? Icons.light_mode_outlined
                          : Icons.dark_mode_outlined,
                      size: 32,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        isDarkMode = !isDarkMode;
                      });
                      _saveThemeMode();
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'Current Savings',
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                    Text(
                      '€ $amount',
                      style: GoogleFonts.montserrat(
                        fontSize: 40,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFFFFFFFF),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 20,
                          children: [
                            buildCustomButton(
                              icon: Icons.add,
                              text: 'Add Savings',
                              onPressed: () {
                                showAddSavingsDialog(context);
                              },
                            ),
                            buildCustomButton(
                              icon: Icons.remove,
                              text: 'Borrow',
                              onPressed: () {
                                showBorrowDialog(context);
                              },
                            ),
                            buildCustomButton(
                              icon: Icons.adjust_rounded,
                              text: 'Change Goal',
                              onPressed: () {
                                showChangeGoalDialog(context);
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0, left: 25.0),
                        child: Row(
                          children: [
                            Column(
                              spacing: 10,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Your Goal',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 16,
                                    color: textColorGrey,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '€ $amount',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                        color: textColorWhite,
                                      ),
                                    ),
                                    Text(
                                      ' / € $goal',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xFF8E8E8E),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 50.0, left: 25.0, right: 25.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Transaction History',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 16,
                                    color: textColorGrey,
                                  ),
                                ),
                                TextButton(
                                  onPressed: _confirmClearHistory,
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    minimumSize: Size.zero,
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                  ),
                                  child: Text(
                                    'Clear all',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12,
                                      color: textColorWhite,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.0),
                            SizedBox(
                              height: 190,
                              child: ListView.builder(
                                itemCount: transactions.length,
                                itemBuilder: (context, index) {
                                  final transaction = transactions[index];
                                  final bool isSavings =
                                      transaction["isSavings"];
                                  final double amount = transaction["amount"];
                                  final String subject = transaction["subject"];

                                  return Container(
                                    margin: EdgeInsets.symmetric(vertical: 4),
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: isSavings
                                          ? Colors.green[200]
                                          : Colors.red[200],
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          spacing: 10,
                                          children: [
                                            Icon(
                                              isSavings
                                                  ? Icons.add
                                                  : Icons.remove,
                                              color: isSavings
                                                  ? Colors.green
                                                  : Colors.red,
                                              size: 20,
                                            ),
                                            Text(
                                              subject,
                                              style: GoogleFonts.montserrat(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: isSavings
                                                    ? Colors.green
                                                    : Colors.red,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "${isSavings ? '' : ''} €${amount.toStringAsFixed(2)}",
                                          style: GoogleFonts.montserrat(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: isSavings
                                                ? Colors.green
                                                : Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: backgroundColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildCustomButton(
    {required IconData icon,
    required String text,
    required VoidCallback onPressed}) {
  Color backgroundColor =
      isDarkMode ? Color.fromARGB(255, 91, 91, 91) : Color(0xFFF0ECEC);
  Color textColorGrey = isDarkMode ? Color(0xFFF0ECEC) : Color(0xFF575757);
  return SizedBox(
    width: 84,
    height: 84,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        padding: EdgeInsets.zero,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: textColorGrey,
            size: 32,
          ),
          SizedBox(height: 6),
          Text(
            text,
            style: GoogleFonts.montserrat(
              fontSize: 8,
              fontWeight: FontWeight.w600,
              color: textColorGrey,
            ),
          ),
        ],
      ),
    ),
  );
}
