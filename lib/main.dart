import 'dart:convert';
import 'package:api_using_dio_get/single_user.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dio example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Get method using Dio'),
    );
  }
}

Future<Dataset> getData() async {
  final response = await Dio().get("https://reqres.in/api/users?delay=3");

  if (response.statusCode == 200) {
    print(response.data);
    return Dataset.fromJson(jsonDecode(response.data));
  } else {
    throw Exception('Failed to load url');
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {
  late Future<Dataset> userDetails;
  @override
  void initState(){
    userDetails = getData();
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetching data from URL 2'),
        ),
        body: Center(
          child: FutureBuilder<Dataset>(
            future: userDetails,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data?.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Text("${snapshot.data?.data[index]["id"]}"),
                          Text("${snapshot.data?.data[index]["first_name"]}"),
                          Text("${snapshot.data?.data[index]["last_name"]}"),
                          Text("${snapshot.data?.data[index]["email"]}"),
                          Image.network("${snapshot.data?.data[index]["avatar"]}"),

                        ],
                      );
                    });
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
