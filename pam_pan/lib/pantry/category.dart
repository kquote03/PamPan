import 'package:flutter/material.dart';

class Category {
  final Text nameText;
  final String nameString;
  final List<Widget>? items;
  final Widget icon;

  Category(this.nameText, this.nameString, this.icon, {this.items});

  // void addItem
}
