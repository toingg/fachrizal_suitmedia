import 'package:fachrizal_suitmedia/SecondScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

GestureDetector ListThirdScreen(BuildContext context,
    {required avatar, required firstname, required lastname, required email}) {
  return GestureDetector(
    child: Column(
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
            color: Colors.grey,
            width: 0.1,
          ))),
          width: 335,
          height: 80,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Container(
                  width: 49,
                  height: 49,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(avatar), fit: BoxFit.cover)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      firstname + ' ' + lastname,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Color(0xFF04021D),
                      ),
                    ),
                    Text(
                      email,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 10,
                        color: Color(0xFF686777),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
    onTap: () async {
      String fullname = firstname + ' ' + lastname;

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('fullname', fullname);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (build) {
            return SecondScreen();
          },
        ),
      );
    },
  );
}
