import 'package:flareline/components/card/common_card.dart';
import 'package:flareline/components/forms/outborder_text_form_field.dart';
import 'package:flareline/pages/layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class ContactsPage extends LayoutWidget {
  ContactsPage({super.key});

  @override
  Widget contentDesktopWidget(BuildContext context) {
    return CommonCard(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 280,
                child: OutBorderTextFormField(
                  hintText: 'Search or type keyword',
                  icon: Container(
                    child: Icon(Icons.search_rounded),
                    padding: EdgeInsets.only(left: 5),
                  ),
                ),
              ),
              const Spacer(),
              const Text('Showing'),
              _dropDownWidget(context),
              const Text('of'),
              const SizedBox(
                width: 8,
              ),
              const Text('56'),
              const SizedBox(
                width: 8,
              ),
              const Text('of Results')
            ],
          )
        ],
      ),
    );
  }

  final ValueNotifier<String?> dropDownNotifier = ValueNotifier(null);

  Widget _dropDownWidget(BuildContext context) {
    return Container(
      height: 50,
      width: 80,
      margin: const EdgeInsets.all(20),
      child: DropdownButtonHideUnderline(
        child: ValueListenableBuilder(
            valueListenable: dropDownNotifier,
            builder: (ctx, res, widget) {
              return SizedBox.shrink();
            }),
      ),
    );
  }

  @override
  String breakTabTitle(BuildContext context) {
    return 'Contacts';
  }
}
