import 'dart:convert';
import 'package:flutter/material.dart';
import '../../details/view/details.dart';
import '../model/recipe.dart';

class Home extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }

}

class HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return _buiderHome();
  }

  Widget _buiderHome() {
    return Scaffold(
      body: _builderListCards(),
      appBar: _builderAppBar('Cozinhando em Casa'),
    );
  }

  Widget _builderListCards() {
    return FutureBuilder(
      future: DefaultAssetBundle
          .of(context)
          .loadString('assets/receitas.json'),
      builder: (context, snapshot) {
        List<dynamic> recipes = json.decode(snapshot.data.toString());
        
        return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              Recipe recipe = Recipe.fromJson(recipes[index]);
              return _builderCard(recipe);
            },
            itemCount: recipes.length,
        );
      },
    );
  }

  Widget _builderCard(Recipe recipe) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => Details(recipe: recipe)
        ));
      },
      child: Card(
          margin: EdgeInsets.all(16),
          child: Column(
              children: [
                Stack(
                    children: [
                      _builderImageCard(recipe.foto),
                      _builderGradientCard(),
                      _builderTitleCard(recipe.titulo),
                    ]
                )
              ]
          )
      ),
    );
    
  }

  Widget _builderImageCard(String image) {
    return Image.asset(image,
        fit: BoxFit.fill,
        height: 238
    );
  }

  Widget _builderTitleCard(String title) {
    return Positioned(
        bottom: 10,
        left: 10,
        child: Text(title, style: TextStyle(
            fontSize: 20,
            color: Colors.white,
        ))
    );
  }

  Widget _builderGradientCard() {
    return Container(
      height: 238,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter,
          colors: [Colors.transparent, Colors.deepOrange.withOpacity(0.7)],
        )
      ),
    );
  }

  Widget _builderAppBar(String title) {
    return AppBar(title: Text(title));
  }

}