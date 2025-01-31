class Driver {
  final String name;
  final String vehicleType;
  final double rating;
  final int? distance;

  Driver({
    required this.name,
    required this.vehicleType,
    required this.rating,
    this.distance,
  });
}
