import 'package:fachrizal_suitmedia/SecondScreen.dart';
import 'package:fachrizal_suitmedia/api/ApiController.dart';
import 'package:fachrizal_suitmedia/widget/ListThirdScreenWidget.dart';
import 'package:flutter/material.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  final fullnameController = TextEditingController();

  Future<List<dynamic>>? _data;

  void initState() {
    _data = ApiController().getdatas();
    super.initState();
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
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (build) {
                    return SecondScreen();
                  },
                ),
              );
            },
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 3),
            child: Text('Third Screen'),
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
        children: [
          FutureBuilder(
              future: _data,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Center(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 15, left: 20, right: 20),
                      child: Container(
                        width: 335,
                        height: 640,
                        child: ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return ListThirdScreen(
                                context,
                                avatar: snapshot.data![index]["avatar"],
                                firstname: snapshot.data![index]['first_name'],
                                lastname: snapshot.data![index]['last_name'],
                                email: snapshot.data![index]['email'],
                              );
                            }),
                      ),
                    ),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  );
                }
              }),
        ],
      ),
    );
  }
}
