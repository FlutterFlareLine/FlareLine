library flareline_uikit;

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnimBadge extends StatelessWidget {
  final Color? glowColor;

  const AnimBadge({super.key, this.glowColor});

  @override
  Widget build(BuildContext context) {
    return AvatarGlow(
      animate: true,
      glowColor: glowColor ?? Colors.white,
      child: Material(
        elevation: 8.0,
        shape: const CircleBorder(),
        child: CircleAvatar(
          backgroundColor: glowColor,
          radius: 4.0,
        ),
      ),
    );
  }
}
