import 'package:flutter/material.dart';

List<Color> convertStringToColors(String colorString) {
  Map<String, Color> colorMap = {
    'black': Colors.black,
    'white': Colors.white,
    'red': Colors.red,
    'gold': Colors.amber,
    'grey': Colors.grey,
    'blue': Colors.blue,
    'green': Colors.green,
    'yellow': Colors.yellow,
    'brown': Colors.brown,
    'pink': Colors.pink,
    'orange': Colors.orange,
    'indigo': Colors.indigo,
    'violet': Colors.purple,
    'teal': Colors.teal,
    'cyan': Colors.cyan,
    'amber': Colors.amber,
    'lime': Colors.lime,
    'purple': Colors.purple,
    'deepPurple': Colors.deepPurple,
    'blueGrey': Colors.blueGrey,
    'deepOrange': Colors.deepOrange,
    'lightBlue': Colors.lightBlue,
    'lightGreen': Colors.lightGreen,
    'pinkAccent': Colors.pinkAccent,
    'blueAccent': Colors.blueAccent,
    'greenAccent': Colors.greenAccent,
    'yellowAccent': Colors.yellowAccent,
    'amberAccent': Colors.amberAccent,
    'limeAccent': Colors.limeAccent,
    'purpleAccent': Colors.purpleAccent,
    'deepPurpleAccent': Colors.deepPurpleAccent,
    'server': const Color(0xFF336699),
  };

  List<String> colorNames = colorString.split(' ');
  List<Color> colors = [];

  for (String colorName in colorNames) {
    Color? color = colorMap[colorName.toLowerCase()];
    if (color != null) {
      colors.add(color);
    }
  }

  return colors;
}
