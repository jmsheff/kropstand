// TODO: Option for zipcode and fallback for no location perms
import 'package:geolocator/geolocator.dart';

Future<Position> getUserLocation() async {
  var currentLocation;
  try {
    currentLocation = await Geolocator().getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high);
  } catch (e) {
    throw(e);
  }
  return currentLocation;
}