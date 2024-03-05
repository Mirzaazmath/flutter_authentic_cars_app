import 'package:flutter/material.dart';

class Feature{
  final IconData icon;
  final String title;
  final String value;
  Feature({required this.icon,required this.value,required this.title});
}

List<Feature>features=[
  Feature(title: "Speed",value: "300",icon: Icons.speed_outlined),
  Feature(title: "Acirtn",value: "5.0",icon: Icons.tune_outlined),
  Feature(title: "HP",value: "420",icon: Icons.bolt_outlined),
];