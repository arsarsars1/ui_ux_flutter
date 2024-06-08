import 'package:demo/Theme/colors.dart';
import 'package:flutter/cupertino.dart';

class MarkerIconWidget extends StatefulWidget {
  final String text;
  final String id;
  final bool showMarkerDetail;

  const MarkerIconWidget(
      {super.key,
      required this.text,
      required this.showMarkerDetail,
      required this.id});

  @override
  State<MarkerIconWidget> createState() => _MarkerIconWidgetState();
}

class _MarkerIconWidgetState extends State<MarkerIconWidget> {
  String selected = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: !widget.showMarkerDetail || selected == widget.id ? 80 : 150,
      height: 80,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: AppColor.primary,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      clipBehavior: Clip.antiAlias,
      child: widget.showMarkerDetail
          ? Text(widget.text,
              style: TextStyle(color: AppColor.white, fontSize: 25))
          : Icon(CupertinoIcons.building_2_fill,
              color: AppColor.white, size: 30),
    );
  }
}
