import 'package:KropStand/components/button.dart';
import 'package:KropStand/components/merchant_card.dart';
import 'package:KropStand/ks_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MerchantsMap extends StatefulWidget {
  final List<dynamic> merchants;
  final Position userLocation;

  MerchantsMap({Key key, @required this.merchants, @required this.userLocation})
      : super(key: key);

  @override
  _MerchantsMapState createState() => _MerchantsMapState();
}

class _MerchantsMapState extends State<MerchantsMap> {
  GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      myLocationEnabled: true,
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target:
            LatLng(widget.userLocation.latitude, widget.userLocation.longitude),
        zoom: 11.0,
      ),
      markers: widget.merchants
          .map((m) => Marker(
              markerId: MarkerId(m['ID']),
              position: LatLng(m['Location']['Coordinates'][0],
                  m['Location']['Coordinates'][1]),
              onTap: () => showBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8))),
                    builder: (BuildContext context) => Container(
                      padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
                      height: 180,
                      child: Column(children: <Widget>[
                        Center(
                            child: Container(
                                height: 6,
                                width: 42,
                                decoration: BoxDecoration(
                                    color: Theme.of(context).backgroundColor,
                                    borderRadius: BorderRadius.circular(8)))),
                        SizedBox(
                          height: 16,
                        ),
                        MerchantCard(merchant: m),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                                child: GlassButton(ButtonData(
                              prefixIcon: KsIcons.heart,
                              label: 'Favorite',
                              onPressed: () {},
                            ))),
                            SizedBox(width: 16),
                            Expanded(
                                child: SolidButton(ButtonData(
                              prefixIcon: KsIcons.directions,
                              label: 'Directions',
                              onPressed: () {},
                            )))
                          ],
                        )
                      ]),
                    ),
                  )))
          .toSet(),
    );
  }
}
