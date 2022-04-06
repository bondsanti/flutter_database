import 'package:flutter/material.dart';
import 'package:flutter_database/providers/transection_providers.dart';
import 'package:provider/provider.dart';
import 'models/Transection.dart';
import 'screens/form_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return TransectionProviders();
        })
      ],
      child: MaterialApp(
        title: 'Flutter DB',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: const MyHomePage(title: 'ข้อมูลพนักงาน'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

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
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return FormScreen();
                  }));
                },
                icon: Icon(Icons.add_circle_outline_rounded))
          ],
        ),
        body: Consumer(
          builder: (context, TransectionProviders provider, child) {
            return ListView.builder(
                itemCount: provider.transections.length,
                itemBuilder: (context, int index) {
                  Transection data = provider.transections[index];
                  return Card(
                      elevation: 2,
                      color: Color.fromARGB(255, 223, 214, 201),
                      margin: const EdgeInsets.all(8.0),
                      child: ListTile(
                          leading: CircleAvatar(
                            radius: 30,
                            child: FittedBox(
                              child: Icon(Icons.account_circle_rounded),
                            ),
                          ),
                          title: Text(
                            data.fullname,
                            style: TextStyle(color: Colors.deepOrange),
                          ),
                          subtitle: Text(
                              "ตำแหน่ง ${data.position} | ${data.salary}")));
                });
          },
        ));
    // body: ListView.builder(
    //     itemCount: 4,
    //     itemBuilder: (context, int index) {
    //       return Card(
    //           elevation: 2,
    //           margin: const EdgeInsets.all(8.0),
    //           child: ListTile(
    //               leading: CircleAvatar(
    //                 radius: 30,
    //                 child: FittedBox(
    //                   child: Text("10000"),
    //                 ),
    //               ),
    //               title: Text("llll"),
    //               subtitle: Text("20")));
    //     }));
  }
}
