import 'package:flutter/material.dart';
import 'dart:async';

class MyStopWatch extends StatefulWidget {
  const MyStopWatch({super.key});
  @override
  State<MyStopWatch> createState() => _MyStopWatchState();
}

class _MyStopWatchState extends State<MyStopWatch> {
  int seconds = 0;
  late Timer timer;
  bool isRunning = false;
  int milliseconds = 0;
  final laps = <int>[];

  void _onClickLap() {
    setState(() {
      laps.add(milliseconds);
      milliseconds = 0;
    });
    print(laps);
  }

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 100), _onTick);
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void _onTick(Timer timer) {
    setState(() {
      if (isRunning) {
        // seconds++;
        milliseconds += 100;
      }
    });
  }

  void _startTimer() {
    setState(() {
      isRunning = true;
      milliseconds = 0;
    });
  }

  void _stopTimer() {
    setState(() {
      isRunning = false;
    });
  }

  // String _secondsText() => seconds == 1 ? '1 second' : '$seconds seconds';
  String _millisecondstoText(int millis) {
    final seconds = millis / 1000;
    return "$seconds seconds";
  }

  void _lapclear() {
    setState(() {
      laps.clear();
    });
    print(laps);
  }

  Widget _buildCounter(BuildContext context) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Lap ${laps.length + 1}',
            style: Theme.of(context).textTheme.headlineLarge),
        const SizedBox(height: 15),
        Text(_millisecondstoText(milliseconds),
            style: Theme.of(context).textTheme.headlineLarge),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StopWatch'),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        // Text(
        //   _millisecondstoText(milliseconds), //   style: const TextStyle(fontSize: 40),
        // ),
        _buildCounter(context),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: _startTimer,
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.green),
                foregroundColor: MaterialStatePropertyAll<Color>(Colors.white),
              ),
              child: const Text('Start'),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: _stopTimer,
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.red),
                foregroundColor: MaterialStatePropertyAll<Color>(Colors.white),
              ),
              child: const Text('Stop'),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: _onClickLap,
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
                foregroundColor: MaterialStatePropertyAll<Color>(Colors.white),
              ),
              child: const Text('Lap'),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: _lapclear,
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.orange),
                foregroundColor: MaterialStatePropertyAll<Color>(Colors.white),
              ),
              child: const Text('Clear'),
            ),
          ],
        )
      ]),
    );
  }
}
