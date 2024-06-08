import 'package:flutter/cupertino.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimationInfo {
  AnimationInfo({
    required this.effectsBuilder,
    required this.controller,
  });

  final List<Effect> Function() effectsBuilder;
  final AnimationController controller;
  List<Effect>? _effects;
  List<Effect> get effects => _effects ??= effectsBuilder();
  void maybeUpdateEffects(List<Effect>? updatedEffects) {
    if (updatedEffects != null) {
      _effects = updatedEffects;
    }
  }
}

extension AnimatedWidgetExtension on Widget {
  Widget animateOnPageLoad(AnimationInfo animationInfo,
      {List<Effect>? effects}) {
    animationInfo.maybeUpdateEffects(effects);

    return Animate(effects: animationInfo.effects, child: this);
  }
}
