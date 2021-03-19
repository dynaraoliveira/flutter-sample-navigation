import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.deepOrange,
      ),
      home: _builderHome(),
    );
  }

  Widget _builderHome() {
    return Scaffold(
      body: SizedBox(
        height: 270,
        child: _builderCard(),
      ),
      appBar: _builderAppBar('Cozinhando em Casa'),
    );
  }

  Widget _builderCard() {
    return Card(
        margin: EdgeInsets.all(16),
        child: Column(
            children: [
              Stack(
                  children: [
                    _builderImageCard('https://www.sabornamesa.com.br/media/k2/items/cache/27dd7cddd3c2da4d8b388b00e3c63c22_L.jpg'),
                    _builderTitleCard('Bolo de Milho'),
                  ]
              )
            ]
        )
    );
  }

  Widget _builderImageCard(String image) {
    return Image.network(image,
        fit: BoxFit.fill,
        height: 238
    );
  }

  Widget _builderTitleCard(String title) {
    return Positioned(
        bottom: 10,
        left: 10,
        child: Text(title, style: TextStyle(fontSize: 20))
    );
  }

  Widget _builderAppBar(String title) {
    return AppBar(title: Text(title));
  }
}