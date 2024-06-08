import 'package:demo/Theme/colors.dart';
import 'package:demo/screen/chat/chat_screen.dart';
import 'package:demo/screen/favourite/favourite_screen.dart';
import 'package:demo/screen/home/home_screen.dart';
import 'package:demo/screen/profile/profile_screen.dart';
import 'package:demo/screen/search/search_screen.dart';
import 'package:demo/widget/animation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  AnimationController? _controller;
  List<AnimationInfo> _animationInfo = [];
  int _selectedTab = 2;
  List navPageList = [
    SearchScreen(),
    ChatScreen(),
    HomeScreen(),
    FavouriteScreen(),
    ProfileScreen()
  ];
  List iconLists = [
    "assets/find.png",
    "assets/chat.png",
    "assets/home.png",
    "assets/heart.png",
    "assets/user.png",
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _animationInfo.addAll([
      AnimationInfo(
        effectsBuilder: () => [
          VisibilityEffect(duration: 1000.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 1000.0.ms,
            duration: 1500.0.ms,
            begin: Offset(30.0, 1200),
            end: Offset(0.0, 0.0),
          ),
        ],
        controller: _controller!,
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(children: [
          navPageList[_selectedTab],
          KeyboardVisibilityBuilder(
            builder: (p0, isKeyboardVisible) => !isKeyboardVisible
                ? Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
                      decoration: BoxDecoration(
                          color: Color(0xFF2b2b2b),
                          borderRadius: BorderRadius.circular(50)),
                      clipBehavior: Clip.antiAlias,
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: List.generate(
                          iconLists.length,
                          (index) => InkWell(
                            onTap: () => setState(() => _selectedTab = index),
                            child: Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _selectedTab == index
                                    ? AppColor.primary
                                    : AppColor.black,
                              ),
                              padding: EdgeInsets.all(13),
                              clipBehavior: Clip.antiAlias,
                              child: Image.asset(
                                iconLists[index],
                                color: AppColor.white,
                                width: 20,
                                height: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ).animateOnPageLoad(_animationInfo.first)
                : SizedBox.shrink(),
          ),
        ]),
      ),
    );
  }
}
