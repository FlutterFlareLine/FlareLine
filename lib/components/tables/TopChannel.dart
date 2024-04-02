import 'package:flareline/components/tables/table_widget.dart';
import 'package:flareline/components/tags/tag_widget.dart';

class TopChannelWidget extends TableWidget<_DataProvider> {
  TopChannelWidget({super.key});

  @override
  // TODO: implement headersText
  List<String> get headersText =>
      ['SOURCE', 'VISITORS', 'REVENUES', 'SALES', 'CONVERSATION'];

  @override
  viewModel() {
    // TODO: implement viewModel
    return _DataProvider();
  }
}

class _DataProvider extends TableWidgetProvider {
  @override
  Future<List<List<ColumnData>>> loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      [
        ColumnData(text: 'Google'),
        ColumnData(text: '3.5K'),
        ColumnData(
          customCellWidget: const TagWidget(
            text: r'$5,768',
            tagType: TagType.Success,
          ),
        ),
        ColumnData(text: '590'),
        ColumnData(
          customCellWidget: const TagWidget(
            text: '4.8%',
            tagType: TagType.Secondary,
          ),
        ),
      ],
      [
        ColumnData(text: 'Google'),
        ColumnData(text: '3.5K'),
        ColumnData(
          customCellWidget: const TagWidget(
            text: r'$5,768',
            tagType: TagType.Success,
          ),
        ),
        ColumnData(text: '590'),
        ColumnData(
          customCellWidget: const TagWidget(
            text: '4.8%',
            tagType: TagType.Secondary,
          ),
        ),
      ],
      [
        ColumnData(text: 'Google'),
        ColumnData(text: '3.5K'),
        ColumnData(
          customCellWidget: const TagWidget(
            text: r'$5,768',
            tagType: TagType.Success,
          ),
        ),
        ColumnData(text: '590'),
        ColumnData(
          customCellWidget: const TagWidget(
            text: '4.8%',
            tagType: TagType.Secondary,
          ),
        ),
      ],
      [
        ColumnData(text: 'Google'),
        ColumnData(text: '3.5K'),
        ColumnData(
          customCellWidget: const TagWidget(
            text: r'$5,768',
            tagType: TagType.Success,
          ),
        ),
        ColumnData(text: '590'),
        ColumnData(
          customCellWidget: const TagWidget(
            text: '4.8%',
            tagType: TagType.Secondary,
          ),
        ),
      ],
      [
        ColumnData(text: 'Google'),
        ColumnData(text: '3.5K'),
        ColumnData(
          customCellWidget: const TagWidget(
            text: r'$5,768',
            tagType: TagType.Success,
          ),
        ),
        ColumnData(text: '590'),
        ColumnData(
          customCellWidget: const TagWidget(
            text: '4.8%',
            tagType: TagType.Secondary,
          ),
        ),
      ],
      [
        ColumnData(text: 'Google'),
        ColumnData(text: '3.5K'),
        ColumnData(
          customCellWidget: const TagWidget(
            text: r'$5,768',
            tagType: TagType.Success,
          ),
        ),
        ColumnData(text: '590'),
        ColumnData(
          customCellWidget: const TagWidget(
            text: '4.8%',
            tagType: TagType.Secondary,
          ),
        ),
      ],
    ];
  }
}
