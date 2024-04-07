class Continent {
  final String name;
  final List<Location> locations;

  Continent({
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
