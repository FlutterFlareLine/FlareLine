library flareline_uikit;
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'table_data_entity.g.dart';

@JsonSerializable()
class TableDataEntity {
	List<dynamic>? headers;
	List<List<TableDataRowsTableDataRows>>? rows;

	TableDataEntity();

	factory TableDataEntity.fromJson(Map<String, dynamic> json) => _$TableDataEntityFromJson(json);

	Map<String, dynamic> toJson() => _$TableDataEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class TableDataRowsTableDataRows {
	String? text;
	String? dataType;
	String? tagType;
	String? id;
	String? columnName;
	String? align;
	dynamic? data;

	TableDataRowsTableDataRows();

	factory TableDataRowsTableDataRows.fromJson(Map<String, dynamic> json) => _$TableDataRowsTableDataRowsFromJson(json);

	Map<String, dynamic> toJson() => _$TableDataRowsTableDataRowsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}