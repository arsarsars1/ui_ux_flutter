import 'package:blur/blur.dart';
import 'package:demo/widget/animation_widget.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  final double height;
  final AnimationInfo animationInfo;
  const ItemWidget({
    super.key,
    this.height = double.infinity,
    required this.animationInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: const BoxDecoration(),
      clipBehavior: Clip.antiAlias,
      child: Stack(children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                'https://images.unsplash.com/photo-1524758631624-e2822e304c36?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw1fHxmdXJuaXR1cmV8ZW58MHx8fHwxNzE3NjExNDc5fDA&ixlib=rb-4.0.3&q=80&w=1080',
                width: double.infinity,
                height: height,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Blur(
                  blur: 8,
                  borderRadius: BorderRadius.circular(50),
                  blurColor: Colors.white,
                  overlay: Container(
                    width: double.infinity,
                    height: 45,
                    margin: const EdgeInsets.only(left: 8),
                    decoration: const BoxDecoration(),
                    clipBehavior: Clip.antiAlias,
                    child: Row(
                      children: [
                        const Expanded(
                            child: Center(
                                child: Text(
                          "GladKova st.,25",
                          style: TextStyle(fontSize: 17),
                          maxLines: 1,
                        ))),
                        IconButton(
                          onPressed: () {},
                          padding: EdgeInsets.zero,
                          icon: const Icon(
                            Icons.keyboard_arrow_right_outlined,
                            size: 16,
                            color: Color(0xFF9B8970),
                          ),
                          style: const ButtonStyle(
                              backgroundColor:
                                  WidgetStatePropertyAll(Colors.white)),
                        )
                      ],
                    ),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 45,
                    decoration: const BoxDecoration(),
                    clipBehavior: Clip.antiAlias,
                  ),
                ),
              ),
            ).animateOnPageLoad(animationInfo)
          ],
        ),
      ]),
    );
  }
}
