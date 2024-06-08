import 'dart:async';

import 'package:blur/blur.dart';
import 'package:demo/Theme/colors.dart';
import 'package:demo/screen/search/components/icon_widget.dart';
import 'package:demo/screen/search/components/marker_icon_widget.dart';
import 'package:demo/widget/animation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:widget_to_marker/widget_to_marker.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with TickerProviderStateMixin {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  AnimationController? _controllerAnimation;
  AnimationInfo? _animationInfo;
  TextEditingController searchController = TextEditingController();
  bool isPopUpOpen = false;
  int selected = 1;
  List<String> popItemList = [
    "Cosy areas",
    "Price",
    "Infrastructure",
    "Without any layer"
  ];
  List<String> popItemListImages = [
    "assets/verified.png",
    "assets/wallet.png",
    "assets/shopping-basket.png",
    "assets/layers.png"
  ];
  final Set<Marker> _markers = {};
  final placeName = [
    "11,3 mm p",
    "8,5 mm p",
    "11,8 mm p",
    "5,9 mm p",
    "8,7 mm p",
    "25,3 mm p",
    "18,1 mm p",
    "4,8 mm p",
    "18,7 mm p",
    "5,9 mm p",
  ];
  final List<LatLng> places = [
    const LatLng(37.7749, -122.4194),
    const LatLng(34.0522, -118.2437),
    const LatLng(40.7128, -74.0060),
    const LatLng(51.5074, -0.1278),
    const LatLng(48.8566, 2.3522),
    const LatLng(35.6895, 139.6917),
    const LatLng(55.7558, 37.6173),
    const LatLng(-33.8688, 151.2093),
    const LatLng(39.9042, 116.4074),
    const LatLng(28.6139, 77.2090),
  ];

  Future<void> _setMarkers(bool showMarkerDetail) async {
    for (int i = 0; i < places.length; i++) {
      _markers.add(Marker(
        markerId: MarkerId(i.toString()),
        position: places[i],
        icon: await MarkerIconWidget(
          text: placeName[i],
          showMarkerDetail: showMarkerDetail,
          id: i.toString(),
        ).toBitmapDescriptor(
            logicalSize:
                !showMarkerDetail ? const Size(80, 80) : const Size(150, 80),
            imageSize:
                !showMarkerDetail ? const Size(80, 80) : const Size(150, 80)),
      ));
      if (mounted) {
        setState(() {});
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _setMarkers(true);
    _controllerAnimation = AnimationController(vsync: this);
    _animationInfo = AnimationInfo(
      effectsBuilder: () => [
        VisibilityEffect(duration: 10.ms),
        FadeEffect(
          curve: Curves.easeInCirc,
          delay: 10.ms,
          duration: 1300.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
      controller: _controllerAnimation!,
    );
  }

  @override
  void dispose() {
    if (_controllerAnimation != null) {
      _controllerAnimation!.dispose();
    }
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
              initialCameraPosition: CameraPosition(
                target: places.first,
                zoom: 0,
              ),
              myLocationButtonEnabled: false,
              mapType: MapType.normal,
              markers: _markers,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              }),
          SafeArea(
            child: Align(
              alignment: const AlignmentDirectional(0, 1),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 15, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                          child: SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.7,
                            child: TextFormField(
                              controller: searchController,
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: false,
                                labelStyle: const TextStyle(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0,
                                ),
                                hintText: 'Saint Petersbug',
                                hintStyle: const TextStyle(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: const BorderSide(
                                        color: Colors.transparent)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: const BorderSide(
                                        color: Colors.transparent)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: const BorderSide(
                                        color: Colors.transparent)),
                                filled: true,
                                fillColor: AppColor.white,
                                contentPadding:
                                    const EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                prefixIcon: const Icon(
                                  Icons.search_sharp,
                                  size: 24,
                                ),
                              ),
                              style: const TextStyle(
                                fontFamily: 'Readex Pro',
                                letterSpacing: 0,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 47,
                          height: 47,
                          decoration: BoxDecoration(
                            color: AppColor.primaryBackground,
                            shape: BoxShape.circle,
                          ),
                          padding: const EdgeInsets.all(13),
                          child: Image.asset("assets/filter.png", width: 18),
                        ),
                      ],
                    ),
                  ).animateOnPageLoad(_animationInfo!),
                  KeyboardVisibilityBuilder(
                      builder: (p0, isKeyboardVisible) => !isKeyboardVisible
                          ? Padding(
                              padding: const EdgeInsets.only(
                                  left: 30, right: 30, bottom: 100),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  PopupMenuButton<String>(
                                    onSelected: (String result) {
                                      setState(() => selected =
                                          popItemList.indexOf(result));
                                      switch (selected) {
                                        case 1:
                                          _setMarkers(true);
                                          break;
                                        case 3:
                                          _setMarkers(false);
                                          break;
                                        default:
                                          break;
                                      }
                                    },
                                    elevation: 0,
                                    color: const Color(0xFFFBF5EB),
                                    padding: const EdgeInsets.all(15),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    offset: const Offset(0, -150),
                                    itemBuilder: (BuildContext context) =>
                                        List.generate(
                                      popItemList.length,
                                      (index) => PopupMenuItem<String>(
                                        value: popItemList[index],
                                        child: Row(children: [
                                          Image.asset(popItemListImages[index],
                                              color: selected == index
                                                  ? AppColor.primary
                                                  : AppColor.secondaryTextColor,
                                              width: 23),
                                          const SizedBox(width: 15),
                                          Text(
                                            popItemList[index],
                                            style: TextStyle(
                                                color: selected == index
                                                    ? AppColor.primary
                                                    : AppColor
                                                        .secondaryTextColor,
                                                fontSize: 17,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ]),
                                      ),
                                    ),
                                    child: IconWidget(
                                      image: popItemListImages[selected],
                                    ),
                                  ).animateOnPageLoad(_animationInfo!),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const IconWidget(
                                        image: "assets/send.png",
                                      ).animateOnPageLoad(_animationInfo!),
                                      Blur(
                                        blur: 8,
                                        borderRadius: BorderRadius.circular(50),
                                        blurColor: Colors.grey,
                                        overlay: InkWell(
                                          onTap: () {
                                            setState(() {
                                              isPopUpOpen = !isPopUpOpen;
                                            });
                                          },
                                          child: Container(
                                            height: 50,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            padding: const EdgeInsets.all(15),
                                            clipBehavior: Clip.antiAlias,
                                            child: Row(
                                              children: [
                                                Icon(Icons.list,
                                                    color: AppColor.white),
                                                const SizedBox(width: 10),
                                                Text("List of variants",
                                                    style: TextStyle(
                                                        color: AppColor.white))
                                              ],
                                            ),
                                          ),
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              isPopUpOpen = !isPopUpOpen;
                                            });
                                          },
                                          child: Container(
                                            height: 50,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            padding: const EdgeInsets.all(15),
                                            clipBehavior: Clip.antiAlias,
                                            child: Row(
                                              children: [
                                                Icon(Icons.list,
                                                    color: AppColor.white),
                                                const SizedBox(width: 10),
                                                Text("List of variants",
                                                    style: TextStyle(
                                                        color: AppColor.white))
                                              ],
                                            ),
                                          ),
                                        ),
                                      ).animateOnPageLoad(_animationInfo!),
                                    ],
                                  )
                                ],
                              ),
                            )
                          : const SizedBox.shrink()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
