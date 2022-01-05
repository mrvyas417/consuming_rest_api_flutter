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
  Skills({
    this.nodejs,
    this.flutter,
    this.javascript,
    this.ostype,
  });

  factory Skills.fromMap(Map<String, dynamic> map) {
    List<OsType> list = [];
    var ost = map["os"] as List<dynamic>;
    for (int i = 0; i < ost.length; i++) {
      list.add(OsType.fromMap(ost[i]));
    }
    return Skills(
      nodejs: map["node js"],
      flutter: map['flutter'],
      javascript: map['javascript'],
      ostype: list,
    );
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
