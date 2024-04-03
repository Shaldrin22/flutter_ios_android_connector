import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final controller = TextEditingController();
  static const jarchannel = const MethodChannel("shaldrin/jarFileTest");


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: controller,
              ),
              ElevatedButton(onPressed: showToast, child: const Text("Show Toastttt")),
              ElevatedButton(onPressed: () {}, child: Text("Add"))
            ],
          )),
    );
  }

  Future<void> showToast() async {
    var arguments = {"data": "msg"};
    if (controller.text.isNotEmpty) {
      arguments = {"data": controller.text};
    } else {
      arguments = {"data": "Not Found"};
    }
    try {
      final result = await jarchannel.invokeMethod('showToast', arguments);
      print(result);
      print("gggggggggggggg");
    } on PlatformException catch (e) {
      print('$e');
    }
  }
}
