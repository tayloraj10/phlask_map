import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:phlask_map/firebase_options.dart';
import 'package:http/http.dart' as http;
import 'package:phlask_map/models/app_data.dart';
import 'package:provider/provider.dart';

class LocationSearchBar extends StatefulWidget {
  const LocationSearchBar({super.key});

  @override
  State<LocationSearchBar> createState() => _LocationSearchBarState();
}

class _LocationSearchBarState extends State<LocationSearchBar> {
  var placeController = TextEditingController();
  List<dynamic> placeList = [];

  void getSuggestion(String input) async {
    const String placesApiKey = DefaultFirebaseOptions.apiKey;
    // String type = '(places)';
    String request =
        'https://corsproxy.io?https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&key=$placesApiKey';
    var response = await http.get(Uri.parse(request), headers: {
      "content-type": "application/json",
      "x-requested-with": "XMLHttpRequest"
    });
    if (response.statusCode == 200) {
      setState(() {
        placeList = json.decode(response.body)['predictions'];
        // print(placeList);
      });
    } else {
      throw Exception('Failed to load predictions');
    }
  }

  void getLatLong(placeID) async {
    const String placesApiKey = DefaultFirebaseOptions.apiKey;
    String request =
        "https://corsproxy.io?https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeID&key=$placesApiKey";
    var response = await http.get(Uri.parse(request), headers: {
      "content-type": "application/json",
      "x-requested-with": "XMLHttpRequest"
    });
    if (response.statusCode == 200 && mounted) {
      Map results = json.decode(response.body);
      // print(results['result']['geometry']['location']['lat']);
      Provider.of<AppData>(context, listen: false)
          .getMapController
          .animateCamera(CameraUpdate.newLatLngZoom(
              LatLng(results['result']['geometry']['location']['lat'],
                  results['result']['geometry']['location']['lng']),
              18));
    } else {
      throw Exception('Failed to load predictions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
                BorderRadius.circular(4), // Adjust the value for roundness
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: TextFormField(
              // initialValue: "Search For Taps Near...",
              onChanged: (value) => {getSuggestion(value)},
              // decoration: InputDecoration(fillColor: Colors.black),
              controller: placeController,
              decoration: const InputDecoration(
                hintText: "Search for Taps Near...",
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        if (placeList.isNotEmpty)
          Container(
            width: 300,
            color: Colors.white,
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) => ListTile(
                // we will display the data returned from our future here
                title: Text(placeList[index]['description']),
                onTap: () {
                  // print(placeList[index]);
                  placeController.text = placeList[index]['description'];
                  getLatLong(placeList[index]['place_id']);
                  placeList = [];
                  setState(() {});
                },
              ),
              itemCount: placeList.length,
            ),
          ),
      ],
    );
  }
}
