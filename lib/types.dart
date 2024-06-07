import 'package:flutter/material.dart';

class Continent {
  final String name;
  final List<Location> locations;

  const Continent({
    required this.name,
    required this.locations,
  });
}

class Location {
  final String name;
  final int startingPrice;
  final String picturePath;

  const Location({
    required this.name,
    required this.startingPrice,
    required this.picturePath,
  });
}

class Category {
  final String imagePath;
  final String name;

  const Category({required this.imagePath, required this.name});
}

class Product {
  final String categoryName;
  final String name;
  final String description;
  final int originalPrice;
  final int discountPrice;
  final String thumbnailPath;

  const Product({
    required this.categoryName,
    required this.name,
    required this.description,
    required this.originalPrice,
    required this.discountPrice,
    required this.thumbnailPath,
  });
}

class ColorData {
  final Color color;
  final String name;

  const ColorData({required this.color, required this.name});
}

class Box<T> {
  T value;

  Box(this.value);
}
