import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Mountain extends StatefulWidget {
  const Mountain({super.key});

  @override
  State<Mountain> createState() => _MountainState();
}

class _MountainState extends State<Mountain> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Mountain'),
      ),
      body: Padding(

        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const SizedBox(height: 16.0),
            Text(
              'A mountain is an elevated portion of the Earth\'s crust, generally with steep sides that show significant exposed bedrock. A mountain differs from a plateau in having a limited summit area, and is larger than a hill, typically rising at least 300 metres (1000 feet) above the surrounding land. A few mountains are isolated summits, but most occur in mountain ranges.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 30.0),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(

                height: 400,
                child: GoogleMap(
                  markers: {
                    Marker(
                      markerId: MarkerId('Everest'),
                      position: LatLng(27.9881, 86.9250),
                      infoWindow: InfoWindow(
                        title: 'Mount Everest',
                        snippet: 'Highest peak in the world',
                      ),
                    ),
                    Marker(
                      markerId: MarkerId('K2'),
                      position: LatLng(35.8815, 76.5132),
                      infoWindow: InfoWindow(
                        title: 'K2',
                        snippet: 'Highest peak in India',
                      ),
                    ),
                  },
                  initialCameraPosition: CameraPosition(
                    target: LatLng(27.9881, 86.9250),
                    zoom: 4,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
