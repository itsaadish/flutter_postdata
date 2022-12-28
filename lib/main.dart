import 'package:flutter/material.dart';
import 'package:postdata/photomodel.dart';
import 'package:postdata/service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<Photo>? _futurePhoto = null;
  TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(),
            body: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: (_futurePhoto == null) ? buildColumn() : buildFuture(),
            )));
  }

  Widget buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextFormField(
          controller: _controller,
          decoration: InputDecoration(hintText: "Enter Title"),
        ),
        ElevatedButton(
            onPressed: () {
              setState(() {
                _futurePhoto = createPhoto(_controller.text);
              });
            },
            child: Text("Post Data"))
      ],
    );
  }

  Widget buildFuture() {
    return FutureBuilder<Photo>(
        future: _futurePhoto,
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data!.title);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          return const CircularProgressIndicator();
        }));
  }
}
