
import 'dart:convert';

Performa dataFromJson(String str) => Performa.fromJson(json.decode(str));
class Performa {
  String? title;
  String? name;
  String? slug;
  String? description;
  Schema? schema;

  Performa({this.title, this.name, this.slug, this.description, this.schema});

  Performa.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    name = json['name'];
    slug = json['slug'];
    description = json['description'];
    schema =
    json['schema'] != null ? new Schema.fromJson(json['schema']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['description'] = this.description;
    if (this.schema != null) {
      data['schema'] = this.schema!.toJson();
    }
    return data;
  }
}

class Schema {
  List<Data>? data;

  Schema({this.data});

  Schema.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? type;
  int? version;
  Page? page;

  Data({this.type, this.version, this.page});

  Data.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    version = json['version'];
    page = json['page'] != null ? new Page.fromJson(json['page']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['version'] = this.version;
    if (this.page != null) {
      data['page'] = this.page!.toJson();
    }
    return data;
  }
}

class Page {
  String? name;
  String? label;
  bool? hidden;
  bool? readonly;
  List<Options>? options;
  List<FamilyField>? familyField;
  List<IncomeField>? incomeField;

  Page(
      {this.name,
        this.label,
        this.hidden,
        this.readonly,
        this.options,
        this.familyField,
        this.incomeField});

  Page.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    label = json['label'];
    hidden = json['hidden'];
    readonly = json['readonly'];
    if (json['options'] != null) {
      options = <Options>[];
      json['options'].forEach((v) {
        options!.add(new Options.fromJson(v));
      });
    }
    if (json['family_field'] != null) {
      familyField = <FamilyField>[];
      json['family_field'].forEach((v) {
        familyField!.add(new FamilyField.fromJson(v));
      });
    }
    if (json['income_field'] != null) {
      incomeField = <IncomeField>[];
      json['income_field'].forEach((v) {
        incomeField!.add(new IncomeField.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['label'] = this.label;
    data['hidden'] = this.hidden;
    data['readonly'] = this.readonly;
    if (this.options != null) {
      data['options'] = this.options!.map((v) => v.toJson()).toList();
    }
    if (this.familyField != null) {
      data['family_field'] = this.familyField!.map((v) => v.toJson()).toList();
    }
    if (this.incomeField != null) {
      data['income_field'] = this.incomeField!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Options {
  String? key;
  String? value;

  Options({this.key, this.value});

  Options.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['value'] = this.value;
    return data;
  }
}

class FamilyField {
  String? type;
  int? version;
  Select? select;

  FamilyField({this.type, this.version, this.select});

  FamilyField.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    version = json['version'];
    select =
    json['select'] != null ? new Select.fromJson(json['select']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['version'] = this.version;
    if (this.select != null) {
      data['select'] = this.select!.toJson();
    }
    return data;
  }
}

class Select {
  String? name;
  String? label;

  Select({this.name, this.label});

  Select.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['label'] = this.label;
    return data;
  }
}

class IncomeField {
  String? type;
  int? version;
  Log? log;

  IncomeField({this.type, this.version, this.log});

  IncomeField.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    version = json['version'];
    log = json['log'] != null ? new Log.fromJson(json['log']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['version'] = this.version;
    if (this.log != null) {
      data['log'] = this.log!.toJson();
    }
    return data;
  }
}

class Log {
  String? name;
  String? label;
  bool? hidden;
  bool? readonly;
  List<Options>? options;

  Log({this.name, this.label, this.hidden, this.readonly, this.options});

  Log.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    label = json['label'];
    hidden = json['hidden'];
    readonly = json['readonly'];
    if (json['options'] != null) {
      options = <Options>[];
      json['options'].forEach((v) {
        options!.add(new Options.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['label'] = this.label;
    data['hidden'] = this.hidden;
    data['readonly'] = this.readonly;
    if (this.options != null) {
      data['options'] = this.options!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

