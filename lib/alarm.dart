import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
// creating text ediiting controller to take hour
// and minute as input
  TextEditingController hourController = TextEditingController();
  TextEditingController minuteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: const Text(
          'Alarm',
          style: TextStyle(
            fontSize: 23.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 200.0,
                width: 200.0,
                child: Icon(
                  Icons.watch_later_rounded,
                  color: Colors.white54,
                  size: 200.0,
                ),
              ),
              const Text(
                "24h",
                style: TextStyle(
                  color: Colors.white30,
                  fontSize: 30.0,
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Hour:",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.blue.shade900,
                      borderRadius: BorderRadius.circular(11),
                    ),
                    child: Center(
                      //Text -H
                      child: TextField(
                        controller: hourController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        textAlign: TextAlign.center,
                        cursorColor: Colors.white,
                        style: const TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 25),
                  const Text(
                    "Minute:",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.blue.shade900,
                      borderRadius: BorderRadius.circular(11),
                    ),
                    child: Center(
                      //Text -M
                      child: TextField(
                        controller: minuteController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        textAlign: TextAlign.center,
                        cursorColor: Colors.white,
                        style: const TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 45.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.all(25),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade800,
                      ),
                      child: const Text(
                        'Create Alarm',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      onPressed: () {
                        int hour;
                        int minutes;
                        hour = int.parse(hourController.text);
                        minutes = int.parse(minuteController.text);

                        // creating alarm after converting hour
                        // and minute into integer
                        FlutterAlarmClock.createAlarm(hour, minutes);
                      },
                    ),
                  ),
                  FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.blue.shade800,
                    ),
                    onPressed: () {
                      // show alarm
                      FlutterAlarmClock.showAlarms();
                    },
                    child: const Text(
                      'Show Alarms',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 45.0,
              ),
              const Text(
                "For Timer just fill the Minute",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.all(25),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade800,
                      ),
                      child: const Text(
                        'Create Timer',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      onPressed: () {
                        int minutes;
                        minutes = int.parse(minuteController.text);

                        // create timer
                        FlutterAlarmClock.createTimer(minutes);
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    "Ok",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                              backgroundColor: Colors.blue.shade900,
                              content: const Text(
                                "Timer Is Set",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.blue.shade800,
                    ),
                    onPressed: () {
                      // show timers
                      FlutterAlarmClock.showTimers();
                    },
                    child: const Text(
                      "Show Timers",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
