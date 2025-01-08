import 'package:flutter/material.dart';
import 'package:native_add/native_lib.dart' as native_lib;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Stopwatch _stopwatch = Stopwatch();

  late int flutterTime;
  late int golangTime;

  late int flutterStopwatch;
  late int golangStopwatch;

  late int flutterSumStopwatch;
  late int golangSumStopwatch;

  @override
  void initState() {
    super.initState();
    _stopwatch.start();
    flutterTime = DateTime.now().millisecondsSinceEpoch;
    _stopwatch.stop();
    flutterStopwatch = _stopwatch.elapsedMilliseconds;

    _stopwatch.reset();

    _stopwatch.start();
    golangTime = native_lib.current() * 1000;
    _stopwatch.stop();
    golangStopwatch = _stopwatch.elapsedMilliseconds;

    _stopwatch.reset();

    _stopwatch.start();
    var sumFlutter = 2 + 2;
    _stopwatch.stop();
    flutterSumStopwatch = _stopwatch.elapsedMilliseconds;

    _stopwatch.reset();

    _stopwatch.start();
    var sumGolang = native_lib.sum(2, 2);
    _stopwatch.stop();
    golangSumStopwatch = _stopwatch.elapsedMilliseconds;
  }

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 25);
    const spacerSmall = SizedBox(height: 10);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Native Packages'),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const Text(
                  'This calls a native function through FFI that is shipped as source in the package. '
                  'The native code is built as part of the Flutter Runner build.',
                  style: textStyle,
                  textAlign: TextAlign.center,
                ),
                spacerSmall,
                const Text(
                  '-- Get Current Timestamp --',
                  style: textStyle,
                  textAlign: TextAlign.center,
                ),
                spacerSmall,
                Text(
                  'Flutter = $flutterTime',
                  style: textStyle,
                  textAlign: TextAlign.center,
                ),
                Text(
                  'elapsedTime = $flutterStopwatch',
                  style: textStyle,
                  textAlign: TextAlign.center,
                ),
                spacerSmall,
                Text(
                  'Golang = $golangTime',
                  style: textStyle,
                  textAlign: TextAlign.center,
                ),
                Text(
                  'elapsedTime = $golangStopwatch',
                  style: textStyle,
                  textAlign: TextAlign.center,
                ),
                spacerSmall,
                const Text(
                  '-- Sum of 2 + 2 --',
                  style: textStyle,
                  textAlign: TextAlign.center,
                ),
                spacerSmall,
                Text(
                  'Flutter elapsedTime = $flutterSumStopwatch',
                  style: textStyle,
                  textAlign: TextAlign.center,
                ),
                spacerSmall,
                Text(
                  'Golang elapsedTime = $golangSumStopwatch',
                  style: textStyle,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
