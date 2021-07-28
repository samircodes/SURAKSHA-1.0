import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:suraksha/maps/bloc.dart';
import 'package:suraksha/maps/place.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _mapController = Completer();
  StreamSubscription locationSubscription;
  StreamSubscription boundsSubscription;
  final _locationController = TextEditingController();

  @override
  void initState() {
    final applicationBloc =
        Provider.of<ApplicationBloc>(context, listen: false);

    //Listen for selected Location

    locationSubscription =
        applicationBloc.selectedLocation.stream.listen((place) {
      if (place != null) {
        _locationController.text = place.name;
        _goToPlace(place);
      }
      else
        _locationController.text = "";
    });

     applicationBloc.bounds.stream.listen((bounds) async {
      final GoogleMapController controller = await _mapController.future;
       controller.animateCamera(CameraUpdate.newLatLngBounds(bounds, 50));
    });
    super.initState();
  }

  @override
  void dispose() {
    final applicationBloc =
        Provider.of<ApplicationBloc>(context, listen: false);
    applicationBloc.dispose();
    _locationController.dispose();
    locationSubscription.cancel();
    boundsSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final applicationBloc = Provider.of<ApplicationBloc>(context);
    return Scaffold(
      body: (applicationBloc.currentLocation == null)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _locationController,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      hintText: 'Search by City',
                      suffixIcon: Icon(Icons.search),
                    ),
                    onChanged: (value) => applicationBloc.searchPlaces(value),
                    onTap: () => applicationBloc.clearSelectedLocation(),
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.50,
                      child: GoogleMap(
                        mapType: MapType.normal,
                        myLocationEnabled: true,
                        initialCameraPosition: CameraPosition(
                          target: LatLng(
                              applicationBloc.currentLocation.latitude,
                              applicationBloc.currentLocation.longitude),
                          zoom: 16,
                        ),
                        onMapCreated: (GoogleMapController controller) {
                          _mapController.complete(controller);
                        },
                         markers: Set<Marker>.of(applicationBloc.markers),
                      ),
                    ),
                    if (applicationBloc.searchResults != null &&
                        applicationBloc.searchResults.length != 0)
                      Container(
                          height: MediaQuery.of(context).size.height * 0.65,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(.6),
                              backgroundBlendMode: BlendMode.darken)),
                    if (applicationBloc.searchResults != null)
                      Container(
                        height: MediaQuery.of(context).size.height * 0.50,
                        child: ListView.builder(
                          itemCount: applicationBloc.searchResults.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(
                                applicationBloc
                                    .searchResults[index].description,
                                style: TextStyle(color: Colors.white),
                              ),
                              onTap: () {
                                applicationBloc.setSelectedLocation(
                                    applicationBloc
                                        .searchResults[index].placeId);
                              },
                            );
                          },
                        ),
                      ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Find Nearest',
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    spacing: 8.0,
                    children: [
                      FilterChip(
                        label: Text('Police Station'),
                        onSelected: (val) =>
                            applicationBloc.togglePlaceType('police', val),
                        selected: applicationBloc.placeType == 'police',
                        selectedColor: Colors.blue,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      FilterChip(
                          label: Text('Hospital'),
                          onSelected: (val) =>
                              applicationBloc.togglePlaceType('hospital', val),
                          selected: applicationBloc.placeType == 'hospital',
                          selectedColor: Colors.blue),
                      SizedBox(
                        width: 10.0,
                      ),
                      FilterChip(
                          label: Text('Fire Station'),
                          onSelected: (val) =>
                              applicationBloc.togglePlaceType('fire_station', val),
                          selected: applicationBloc.placeType == 'fire_station',
                          selectedColor: Colors.blue),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  Future<void> _goToPlace(Place place) async {
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(
                place.geometry.location.lat, place.geometry.location.lng),
            zoom: 16.0),
      ),
    );
  }
}
