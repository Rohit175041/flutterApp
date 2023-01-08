import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShowSimpleMap extends StatefulWidget {
  const ShowSimpleMap({Key key}) : super(key: key);

  @override
  State<ShowSimpleMap> createState() => _ShowSimpleMapState();
}

class _ShowSimpleMapState extends State<ShowSimpleMap> {
   GoogleMapController mapController;
  static LatLng center = const LatLng(26.74627676257152, 83.41959446392747);
  static LatLng center2 = const LatLng(26.74672073597086, 83.44281967518755);

  void _onMapCreated(GoogleMapController controller){
    mapController = controller;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
            decoration:const BoxDecoration(
              // borderRadius: BorderRadius.only(bottomRight:Radius.circular(250)),
                gradient: LinearGradient(
                    colors:<Color>[ Colors.black26,Colors.lightBlueAccent],
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft
                ))),
        title:const Center(
          child: Text('Map',

            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30,fontStyle: FontStyle.normal),
          ),

        ),
      ),
      body: GoogleMap(
        zoomControlsEnabled: false,
        markers :{portlandMaker,portlandMaker2},
        mapType: MapType.normal,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(target: center,zoom: 11.0)),

      floatingActionButton: FloatingActionButton.extended(onPressed: gotoIntel,
          label:const Text("zoom"),icon:const Icon(Icons.place_outlined),),
    );
  }

   final CameraPosition intelPosition = const CameraPosition(target: LatLng(26.74627676257152, 83.41959446392747),
      zoom: 15.000,bearing: 200,tilt: 35.89);

  Future<void>gotoIntel() async{
    final GoogleMapController controller =  mapController;
    controller.animateCamera(CameraUpdate.newCameraPosition(intelPosition));
  }

  Marker portlandMaker = Marker(markerId:const MarkerId("AIIMS Gorakhpur"),
  position: center,
    infoWindow:const InfoWindow(title: "AIIMS Gorakhpur",snippet:"Multispeciality hospital"),
  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta)
  );
  Marker portlandMaker2 = Marker(markerId:const MarkerId("Gorakhpur Airport"),
      position: center2,
      infoWindow:const InfoWindow(title: "Gorakhpur Airport",snippet:"Airport area"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta)
  );
}
