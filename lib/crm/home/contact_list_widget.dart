import 'dart:convert';

import 'package:flareline/components/forms/search_widget.dart';
import 'package:flareline/pages/form/select_widget.dart';
import 'package:flareline_uikit/components/tables/table_widget.dart';
import 'package:flareline_uikit/entity/table_data_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ContactListWidget extends TableWidget<ContactListViewModel> {
  @override
  // TODO: implement showPaging
  bool get showPaging => false;

  @override
  String title(BuildContext context) {
    // TODO: implement title
    return 'Contact List';
  }

  @override
  Widget? toolsWidget(BuildContext context, ContactListViewModel viewModel) {
    return Container(
      height: 60,
      child: Row(
        children: [
          SizedBox(
            width: 280,
            child: SearchWidget(),
          ),
          Spacer(),
          SizedBox(
            width: 200,
            child: SelectWidget(
              selectionList: const ['Alphabetic Order', 'Shawn', 'affwaw'],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget? actionWidgetsBuilder(BuildContext context,
      TableDataRowsTableDataRows columnData, ContactListViewModel viewModel) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 40,
          height: 40,
          child: Icon(Icons.more_horiz,size: 20,),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black,width: 1)
          ),
        )
      ],
    );
  }



  @override
  ContactListViewModel viewModelBuilder(BuildContext context) {
    return ContactListViewModel(context);
  }
}

class ContactListViewModel extends BaseTableProvider {
  ContactListViewModel(super.context);

  @override
  loadData(BuildContext context) async {
    String res = await rootBundle.loadString('assets/crm/contactlist.json');

    Map<String, dynamic> map = json.decode(res);
    TableDataEntity tableDataEntity = TableDataEntity.fromJson(map);
    this.tableDataEntity = tableDataEntity;
  }
}
