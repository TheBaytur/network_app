import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Networking',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Here some data'),
        centerTitle: true,
      
        
      ),
      body: Container(),
       
    );
  }
}

Future<http.Response> getData () async {
  final url = Uri.parse('https://about.google/static/data/locations.json');
  return await http.get(url);
}

void loadData() {
  getData().then((response) {
    if (response.statusCode == 200) {
      print('Data loaded successfully');
      print(response.body);
    } else {
      print('Failed to load data: ${response.statusCode}');
    }
  }).catchError((error) {
    debugPrint('Error occurred: $error');
  });
}
