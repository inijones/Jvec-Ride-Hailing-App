import 'package:latlong2/latlong.dart';
import 'package:open_route_service/open_route_service.dart';

class RouteService {
  final OpenRouteService _ors;

  RouteService(String apiKey) : _ors = OpenRouteService(apiKey: apiKey);

  // Future<List<LatLng>> getRoute(LatLng start, LatLng end) async {
  //   final route = await _ors.direction(
  //     coordinates: [
  //       ORSCoordinate(latitude: start.latitude, longitude: start.longitude),
  //       ORSCoordinate(latitude: end.latitude, longitude: end.longitude),
  //     ],
  //     profile: ORSProfile.drivingCar,
     
  //   );

  //   final coordinates = route['features'][0]['geometry']['coordinates']
  //       as List<dynamic>;
  //   return coordinates
  //       .map((coordinate) =>
  //           LatLng(coordinate[1] as double, coordinate[0] as double))
  //       .toList();
  // }
}
