import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:phlask_map/models/constants.dart';

class AppData extends ChangeNotifier {
  //filters
  bool public = true;
  bool private = true;
  bool shared = true;
  bool restricted = true;

  bool open = false;
  bool ada = false;
  bool filteredWater = false;
  bool sparkling = false;

  void filter() {
    List accessFilters = [];
    if (public) accessFilters.add('Public');
    if (private) accessFilters.add('Private');
    if (shared) accessFilters.add('Private-Shared');
    if (restricted) accessFilters.add('Restricted');

    List newTaps = [];
    for (var element in taps) {
      if (element != null && accessFilters.contains(element['access'])) {
        newTaps.add((element));
      }
    }
    if (ada) {
      newTaps =
          newTaps.where((element) => element['handicap'] == 'Yes').toList();
    }
    if (filteredWater) {
      newTaps =
          newTaps.where((element) => element['filtration'] == 'Yes').toList();
    }
    if (sparkling) {
      newTaps =
          newTaps.where((element) => element['sparkling'] == 'yes').toList();
    }
    updateFilteredTaps(newTaps);
  }

  get getPublic {
    return public;
  }

  void setPublic(bool value) {
    public = value;
    filter();
  }

  get getPrivate {
    return private;
  }

  void setPrivate(bool value) {
    private = value;
    filter();
  }

  get getShared {
    return shared;
  }

  void setShared(bool value) {
    shared = value;
    filter();
  }

  get getRestricted {
    return restricted;
  }

  void setRestricted(bool value) {
    restricted = value;
    filter();
  }

  get getOpen {
    return open;
  }

  void setOpen(bool value) {
    open = value;
  }

  get getADA {
    return ada;
  }

  void setADA(bool value) {
    ada = value;
    filter();
  }

  get getFilteredWater {
    return filteredWater;
  }

  void setFilteredWater(bool value) {
    filteredWater = value;
    filter();
  }

  get getSparkling {
    return sparkling;
  }

  void setSparkling(bool value) {
    sparkling = value;
    filter();
  }

  void reset() {
    public = true;
    private = true;
    shared = true;
    restricted = true;

    open = false;
    ada = false;
    filteredWater = false;
    sparkling = false;

    filteredTaps = taps;
    updateMarkers();
  }

  //tap data
  List taps = [];
  List filteredTaps = [];

  void tapCount() {}

  get getTaps {
    return taps;
  }

  get getFilteredTaps {
    return taps;
  }

  void updateTaps(List newTaps) {
    taps = newTaps;
    filteredTaps = taps;
    updateMarkers();
    notifyListeners();
  }

  void updateFilteredTaps(List newFilteredTaps) {
    filteredTaps = newFilteredTaps;
    updateMarkers();
    notifyListeners();
  }

  //markers
  Set<Marker> markers = {};

  get getMarkers {
    return markers;
  }

  void removeMarker(String markerID) {
    markers.removeWhere((element) => element.markerId == MarkerId(markerID));
    notifyListeners();
  }

  void updateMarkers() {
    clearMarkers();
    for (var element in filteredTaps) {
      if (element != null) {
        // print(element);
        if (element.containsKey('access') &&
            acceptedTapTypes.contains(element['access'])) {
          addMarker(
            Marker(
              markerId: MarkerId(element['tapnum'].toString()),
              icon: getIcons[getIconType(element['access'])],
              position: LatLng(element['lat'], element['lon']),
              onTap: (() => {}),
            ),
          );
        }
      }
    }
  }

  void addMarker(Marker marker) {
    markers.add(marker);
    notifyListeners();
  }

  void clearMarkers() {
    Set<Marker> newMarkers = {};
    for (var element in markers) {
      if (element.markerId == const MarkerId('current_location')) {
        newMarkers.add(element);
      }
    }
    markers = newMarkers;
  }

  //icons
  late Map icons;

  get getIcons {
    return icons;
  }

  void updateIcons(Map icons) {
    this.icons = icons;
    notifyListeners();
  }

  //position
  late LatLng currentLatLng = const LatLng(0.0, 0.0);

  get getLatLng {
    return currentLatLng;
  }

  void updateLatLng(Position position) {
    currentLatLng = LatLng(position.latitude, position.longitude);
    markers.add(Marker(
      markerId: const MarkerId('current_location'),
      icon: icons['current'],
      position: currentLatLng,
    ));
    notifyListeners();
  }

  //map controller
  late GoogleMapController mapController;

  get getMapController {
    return mapController;
  }

  void updateMapController(GoogleMapController newMapController) {
    mapController = newMapController;
    notifyListeners();
  }
}
