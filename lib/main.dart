import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Date Time Picker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Select Date",
            style: TextStyle(
              fontSize: 25,
            ),
            ),
            ElevatedButton(onPressed: () async {
              DateTime? datePicked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2021),
                  lastDate: DateTime(2025));

              if(datePicked != null) {
                print('Date Selected: ${datePicked.day} -${datePicked.month} -${datePicked.year}'
                );
              }

            },
                child: Text("Show")),
            ElevatedButton(
                onPressed: () async {
                  TimeOfDay? timePicker = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                    initialEntryMode: TimePickerEntryMode.dial,
                  );
                  if (timePicker != null) {
                    print(
                        "${timePicker.hourOfPeriod}:${timePicker.minute}");
                  }
                },
                child: Text("show time"))
          ],
        ),
      )
    );
  }
}
