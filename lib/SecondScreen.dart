import 'package:fachrizal_suitmedia/ThirdScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String? name;
  String? fullname;

  void data() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final String? _name = prefs.getString('name');
    final String? _fullname = prefs.getString('fullname');

    setState(() {
      name = _name;
      fullname = _fullname;
    });
  }

  void initState() {
    super.initState();
    data();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(48),
        child: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Color(0xFF554AF0),
              size: 16,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 3),
            child: Text('Second Screen'),
          ),
          foregroundColor: Color(0xFF04021D),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 1,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 16),
            child: Text(
              'Welcome',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xFF04021D),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text('$name',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF04021D),
                )),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    fullname != null ? '$fullname' : 'Selected User Name',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF04021D),
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () async {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (build) {
                    return ThirdScreen();
                  },
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: Center(
                child: Container(
                    width: 310,
                    height: 41,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xFF2B637B)),
                    child: Center(
                      child: Text(
                        'Choose a User',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
