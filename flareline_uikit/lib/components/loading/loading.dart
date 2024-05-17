library flareline_uikit;
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(width: 30, height: 30, child: CircularProgressIndicator(),),
    );
  }
}
