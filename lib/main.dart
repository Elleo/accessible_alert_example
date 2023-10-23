import 'package:flutter/material.dart';

void main() {
  runApp(const AlertExampleApp());
}

class AlertExampleApp extends StatelessWidget {
  const AlertExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Accessible Alert Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AlertExamplePage(),
    );
  }
}

class AlertExamplePage extends StatefulWidget {
  const AlertExamplePage({super.key});

  @override
  State<AlertExamplePage> createState() => _AlertExamplePageState();
}

class _AlertExamplePageState extends State<AlertExamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Accessible Alert Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                child: Text("Launch inaccessible alert"),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Close Alert'),
                              )
                            ],
                            content: Text(
                                'This text is invisible to screen readers. There is no indication that this dialog has even appeared.'),
                          ));
                }),
            const SizedBox(height: 10),
            ElevatedButton(
                child: Text("Launch accessible alert"),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => Semantics(
                          label:
                              'This text will be read by a screen reader. It is clear to the user that something has happened.',
                          enabled: true,
                          container: true,
                          child: AlertDialog(
                            actions: [
                              TextButton(
                                autofocus: true,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Close Alert'),
                              )
                            ],
                            content: Text(
                                'This text will be read by a screen reader. It is clear to the user that something has happened.'),
                          )));
                }),
          ],
        ),
      ),
    );
  }
}
