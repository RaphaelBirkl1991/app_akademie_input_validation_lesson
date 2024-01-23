import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: key,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    onChanged: (value) {
                      log("Neuer Text $value");
                    },
                  ),
                  TextFormField(
                    initialValue: "Empty",
                    validator: (value) {
                      return "Aua Fehler >.<";
                    },
                    onChanged: onChangedFunction,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      final currentState = key.currentState;
                      currentState!.validate();
                    },
                    child: const Text("Validate"),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void onChangedFunction(String value) {
  log(value);
}
