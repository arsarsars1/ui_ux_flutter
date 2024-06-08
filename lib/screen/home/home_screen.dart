import 'package:demo/Theme/colors.dart';
import 'package:demo/screen/home/components/calculate_widget.dart';
import 'package:demo/screen/home/components/item_widget.dart';
import 'package:demo/widget/animation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  AnimationController? _controller;
  final List<AnimationInfo> _animationInfo = [];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _animationInfo.addAll([
      AnimationInfo(
        effectsBuilder: () => [
          VisibilityEffect(duration: 100.ms),
          FadeEffect(
            curve: Curves.easeIn,
            delay: 100.ms,
            duration: 800.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
        controller: _controller!,
      ),
      AnimationInfo(
        effectsBuilder: () => [
          VisibilityEffect(duration: 450.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 450.0.ms,
            duration: 2000.0.ms,
            begin: const Offset(-500.0, 0),
            end: const Offset(0.0, 1.0),
          ),
        ],
        controller: _controller!,
      ),
      AnimationInfo(
        effectsBuilder: () => [
          VisibilityEffect(duration: 100.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 2000.0.ms,
            begin: const Offset(30.0, 1200),
            end: const Offset(0.0, 0.0),
          ),
        ],
        controller: _controller!,
      )
    ]);
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xDFFDFAFA), Color(0xFFFAD7AE)],
            stops: [0, 1],
            begin: AlignmentDirectional(0, -1),
            end: AlignmentDirectional(0, 1),
          ),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
          child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Stack(children: [
                    SafeArea(
                      child: Container(
                        height: 390,
                        decoration: const BoxDecoration(),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              15, 15, 15, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 0, 25),
                                child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: AppColor.secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: const Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15, 0, 15, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.location_on,
                                                color: Color(0xFF9B8970),
                                                size: 18,
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(5, 0, 0, 0),
                                                child: Text(
                                                  'Saint Petersburg',
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    color: Color(0xFF9B8970),
                                                    fontSize: 13,
                                                    letterSpacing: 0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ).animateOnPageLoad(_animationInfo.first),
                                      Container(
                                        width: 45,
                                        height: 45,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFFFC9E12),
                                          shape: BoxShape.circle,
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          child: Image.network(
                                            'https://images.unsplash.com/photo-1631947430066-48c30d57b943?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwzfHxnaXJsfGVufDB8fHx8MTcxNzUzNjk0OHww&ixlib=rb-4.0.3&q=80&w=1080',
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ).animateOnPageLoad(_animationInfo.first)
                                    ]),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Hi, Marina',
                                    style: TextStyle(
                                      fontFamily: 'Readex Pro',
                                      color: Color(0xFF9B8970),
                                      fontSize: 20,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 5, 0, 20),
                                    child: Text(
                                      'let\'s select your \nperfect place',
                                      style: TextStyle(
                                        height: 1.4,
                                        fontFamily: 'Poppins',
                                        color: AppColor.primaryTextColor,
                                        fontSize: 25,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ).animateOnPageLoad(_animationInfo.first),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: ClipOval(
                                      child: Container(
                                        width: 160,
                                        height: 160,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFFFC9E12),
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(0, -1),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 15, 0, 0),
                                                child: Text(
                                                  'BUY',
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    color: Colors.white,
                                                    letterSpacing: 0,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 25, 0, 0),
                                              child: CalculateWidget(
                                                  maxvalue: 312,
                                                  textColor: Colors.white),
                                            ),
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(0, -1),
                                              child: Text(
                                                'offers',
                                                style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  color: Colors.white,
                                                  letterSpacing: 0,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ).animateOnPageLoad(_animationInfo.first),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Container(
                                      width: 100,
                                      height: 160,
                                      decoration: BoxDecoration(
                                        color: AppColor.secondaryBackground,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: const Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0, -1),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 15, 0, 0),
                                              child: Text(
                                                'RENT',
                                                style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  color: Color(0xFF9B8970),
                                                  letterSpacing: 0,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 25, 0, 0),
                                            child: CalculateWidget(
                                                maxvalue: 212,
                                                textColor: Color(0xFF9B8970)),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0, -1),
                                            child: Text(
                                              'offers',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                color: Color(0xFF9B8970),
                                                letterSpacing: 0,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ).animateOnPageLoad(_animationInfo.first),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    ListView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0, 460, 0, 0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColor.secondaryBackground,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(0),
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                            ),
                            child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            10, 12, 10, 10),
                                    child: ItemWidget(
                                      height: 200,
                                      animationInfo: _animationInfo[1],
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: 350,
                                    decoration: const BoxDecoration(),
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              10, 0, 10, 10),
                                      child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: ItemWidget(
                                                  animationInfo:
                                                      _animationInfo[1]),
                                            ),
                                            Expanded(
                                              child: Align(
                                                alignment:
                                                    const AlignmentDirectional(
                                                        0, -1),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(8, 0, 0, 0),
                                                  child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Expanded(
                                                          child: ItemWidget(
                                                              animationInfo:
                                                                  _animationInfo[
                                                                      1]),
                                                        ),
                                                        const SizedBox(
                                                            height: 8),
                                                        Expanded(
                                                          child: ItemWidget(
                                                              animationInfo:
                                                                  _animationInfo[
                                                                      1]),
                                                        ),
                                                      ]),
                                                ),
                                              ),
                                            ),
                                          ]),
                                    ),
                                  ),
                                  const SizedBox(height: 100)
                                ]),
                          ),
                        ),
                      ],
                    ).animateOnPageLoad(_animationInfo[2]),
                  ]),
                ),
              ]),
        ),
      ),
    );
  }
}
