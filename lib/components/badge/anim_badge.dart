import 'package:avatar_glow/avatar_glow.dart';
import 'package:flareline/core/theme/global_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnimBadge extends StatelessWidget {
  final Color? color;

  const AnimBadge({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return AvatarGlow(
      animate: true,
      glowColor: color ?? GlobalColors.red,
      child: Material(
        elevation: 8.0,
        shape: const CircleBorder(),
        child: CircleAvatar(
          backgroundColor: color ?? GlobalColors.red,
          radius: 4.0,
        ),
      ),
    );
  }
}
