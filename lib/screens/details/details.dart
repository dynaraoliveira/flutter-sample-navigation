import 'package:flutter/material.dart';
import 'package:flutter_sample_navigation/constants/app_constants.dart';
import 'package:flutter_sample_navigation/models/recipe.dart';

class Details extends StatelessWidget {
  final Recipe recipe;

  static String titleIngredients = 'Ingredientes';
  static String preparationMode = 'Modo de Preparo';

  Details({Key key, @required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buiderDetails();
  }

  Widget _buiderDetails() {
    return Scaffold(
      body: ListView(children: <Widget>[
        _builderImageDetails(recipe.foto),
        _builderTitleDetails(recipe.titulo),
        _builderRowIconsDetails(
            '${recipe.porcoes} porcões', recipe.tempoPreparo),
        _builderSubTitleDetails(titleIngredients),
        _builderTextDetails(recipe.ingredientes),
        _builderSubTitleDetails(preparationMode),
        _builderTextDetails(recipe.modoPreparo),
      ]),
      appBar: _builderAppBar(kApplicationName),
    );
  }

  Widget _builderImageDetails(image) {
    return Image.asset(image);
  }

  Widget _builderTitleDetails(String title) {
    return Center(
      child: Text(
        title,
        style: TextStyle(fontSize: 30, color: Colors.deepOrange),
      ),
    );
  }

  Widget _builderSubTitleDetails(String title) {
    return Center(
      child: Text(
        title,
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  Widget _builderTextDetails(String title) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Text(title),
    );
  }

  Widget _builderRowIconsDetails(portion, timer) {
    return Row(
      children: <Widget>[
        _builderColIconsDetails(Icons.restaurant, portion),
        _builderColIconsDetails(Icons.timer, timer),
      ],
    );
  }

  Widget _builderColIconsDetails(icon, text) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Icon(
            icon,
            color: Colors.deepOrange,
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.deepOrange,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _builderAppBar(String title) {
    return AppBar(
      title: Text(title),
    );
  }
}
