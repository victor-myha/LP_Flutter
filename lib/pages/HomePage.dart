import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:lp_flutter/pages/AirportsPage.dart';
import 'SchedulePage.dart';

class HomePage extends StatefulWidget {
  final String userName;
  const HomePage({Key? key, required this.userName});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = "";

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: const Color(0xFFffffff),
        floatingActionButton: FloatingActionButton(
          elevation: 10.0,
          child: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        body: Column(
          children:  [
            DropdownButtonExample(userName: widget.userName),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const AirportsPage()));
              },
              child: const Text('Airports'),
            ),
          ],
        ));
  }
}

const List<String> groupList = <String>['KI-41', 'KI-42', 'KI-43', 'KI-44'];

class DropdownButtonExample extends StatefulWidget {
  final String userName;

  const DropdownButtonExample({Key? key, required this.userName}) : super(key: key);


  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = groupList.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SchedulePage(group: value!, userName: widget.userName,)),
        );
      },
      items: groupList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
