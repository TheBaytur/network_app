import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:network_app/offices.dart';

// UPGRADE BUILD

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
      home: const MyHomePage(title: 'Networking Example app'),
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
  late Future<OfficesList> officesList;

  @override
  void initState() {
    super.initState();
    officesList = getOfficesList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Manual JSON Serialization'), 
      centerTitle: true),
      body: FutureBuilder<OfficesList>(
        future: officesList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.offices.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                      title: Text('${snapshot.data!.offices[index].name}'),
                      subtitle: Text('${snapshot.data!.offices[index].address}'),
                    leading: Image.network(
                      '${snapshot.data!.offices[index].image}',
                    ),
                    isThreeLine: true,
                     
                  ),
                );
              },
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());

          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          // Always return a widget
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}


