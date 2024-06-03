import 'package:flareline_uikit/components/forms/outborder_text_form_field.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const OutBorderTextFormField(
      icon: Icon(
        Icons.search_rounded,
        color: Color(
          0xFF68738D,
        ),
        size: 24,
      ),
      hintText: 'Search or type keyword',
    );
  }
}
