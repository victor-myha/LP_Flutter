import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AirportsPage extends StatefulWidget {
  const AirportsPage({Key? key});

  @override
  _AirportsPageState createState() => _AirportsPageState();
}

class _AirportsPageState extends State<AirportsPage> {
  List<dynamic> airportsList = [];
  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'X-Access-Token': 'undefined',
    'X-RapidAPI-Key': 'fde4ff4b1amsh8bbcc7d2de16c4ap1e3e65jsn5583bdcad8f8',
    'X-RapidAPI-Host': 'travelpayouts-travelpayouts-flight-data-v1.p.rapidapi.com'
  };

  Future fetchData() async {
    try {
      final response = await http.get(Uri.parse(
          'https://travelpayouts-travelpayouts-flight-data-v1.p.rapidapi.com/data/en-GB/airports.json'), headers: requestHeaders);

      if (response.statusCode == 200) {
        List<dynamic> res = jsonDecode(response.body);
        setState(() {
          airportsList = res;
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Row(children: [
            const Text('Airports'),
            IconButton(
              icon: const Icon(Icons.refresh),
              tooltip: 'Refresh',
              onPressed: () {
                fetchData();
              },
              alignment: Alignment.centerRight,
            ),
          ],),
          centerTitle: true,
          backgroundColor: Colors.lightGreen[400],
        ),
        backgroundColor: const Color(0xFFffffff),
        floatingActionButton: FloatingActionButton(
          elevation: 10.0,
          child: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      body: Scaffold(
        body: ListView.builder(
          itemCount: airportsList.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: airportsList[index]["flightable"] ? Colors.lightGreen[200] : Colors.blue,
              ),
              child:  ListBody(
                children: [
                  Text(
                    airportsList[index]["country_code"] == 'RU' ? 'UA' : '${airportsList[index]["country_code"]}',
                    textAlign: TextAlign.left,
                    style: const TextStyle(color: Colors.purple),
                  ),
                  Text(
                    airportsList[index]["name"].runtimeType == String ? 'Name: ${airportsList[index]["name"]}' : 'Name: Ukraine',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
