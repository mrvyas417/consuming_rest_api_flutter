import 'dart:convert';

// ignore_for_file: unused_local_variable

class ComplexData {
  String? name;
  String? role;
  Skills? skills;
  ComplexData({
    this.name,
    this.role,
    this.skills,
  });

  factory ComplexData.fromMap(Map<String, dynamic> map) {
    return ComplexData(
      name: map['name'],
      role: map['role'],
      skills: Skills.fromMap(map['skills']),
    );
  }
}

class Skills {
  String? nodejs;
  String? flutter;
  String? javascript;
  List<OsType>? ostype;
  List<Vtitle>? vtitle;
  Skills({
    this.nodejs,
    this.flutter,
    this.javascript,
    this.ostype,
    this.vtitle,
  });

  factory Skills.fromMap(Map<String, dynamic> map) {
    List<OsType> list = [];
    var ost = map["os"] as List<dynamic>;
    for (int i = 0; i < ost.length; i++) {
      list.add(OsType.fromMap(ost[i]));
    }
    List<Vtitle> vlist = [];
    var vlistData = map["Vcontrole"] as List<dynamic>;
    for (int j = 0; j < vlistData.length; j++) {
      vlist.add(Vtitle.fromMap(vlistData[j]));
    }
    return Skills(
        nodejs: map["node js"],
        flutter: map['flutter'],
        javascript: map['javascript'],
        ostype: list,
        vtitle: vlist);
  }
}

class OsType {
  String? title;
  OsType({
    this.title,
  });

  factory OsType.fromMap(Map<String, dynamic> map) {
    return OsType(
      title: map['title'],
    );
  }
}

class Vtitle {
  String? vtitle;
  Vtitle({
    this.vtitle,
  });

  factory Vtitle.fromMap(Map<String, dynamic> map) {
    return Vtitle(
      vtitle: map['vtitle'],
    );
  }
}
