import 'package:flutter/material.dart';
import '../models.dart';

class SchedulePage extends StatefulWidget {
  final String group;

  const SchedulePage({Key? key, required this.group}) : super(key: key);

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    final List<DayScheduleModel> weekSchedule = [
      DayScheduleModel(
          'Monday',
          'Методи та засоби опрацювання сигналів і зображень',
          'lecture',
          'Лашко О.Л.',
          'https://us04web.zoom.us/j/79213342407?pwd=tmkBY9OgV-NXCgIl1Kupl8FyHaPnyt.1'),
      DayScheduleModel(
          'Tuesday',
          'Програмні технології мобільних обчислень',
          'laboratory',
          'Пищак І.І.',
          'https://us04web.zoom.us/j/79213342407?pwd=tmkBY9OgV-NXCgIl1Kupl8FyHaPnyt.1'),
      DayScheduleModel(
          'Wednesday',
          'Програмне забезпечення інтернету речей',
          'lecture',
          'Гребеняк А.В.',
          'https://us04web.zoom.us/j/79213342407?pwd=tmkBY9OgV-NXCgIl1Kupl8FyHaPnyt.1'),
      DayScheduleModel(
          'Thursday',
          'Системне адміністрування комп`ютерних мереж',
          'laboratory',
          'Хомуляк М.О.',
          'https://us04web.zoom.us/j/79213342407?pwd=tmkBY9OgV-NXCgIl1Kupl8FyHaPnyt.1'),
      DayScheduleModel(
          'Friday',
          'Мережні операційні системи',
          'lecture',
          'Пищак І.І.',
          'https://us04web.zoom.us/j/79213342407?pwd=tmkBY9OgV-NXCgIl1Kupl8FyHaPnyt.1')
    ];

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
        body: Scaffold(
          appBar: AppBar(
            title: Text('${widget.group} Schedule'),
            centerTitle: true,
            backgroundColor: Colors.green,
          ),
          body: ListView.builder(
            itemCount: weekSchedule.length,
            itemBuilder: (context, index) {
              return Container(
                color: Colors.green,
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.all(8),
                child: ListBody(
                  children: [
                    Text(
                      weekSchedule[index].day,
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.purple),
                    ),
                    Text(
                      weekSchedule[index].subjectName,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.yellow),
                    ),
                    Text(
                      weekSchedule[index].subjectType,
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Text(weekSchedule[index].url,
                        style: const TextStyle(
                            color: Colors.red,
                            decoration: TextDecoration.underline)),
                  ],
                ),
              );
            },
          ),
        ));
  }
}
