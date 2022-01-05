import 'dart:convert';

class Data {
  String? username;
  int? followers;
  int? follows;
  dynamic curdate;
  Data({
    this.username,
    this.followers,
    this.follows,
    this.curdate,
  });

<<<<<<< HEAD
=======
  

>>>>>>> b058db19c9d7751c05f228ef1dda2656bc858dfa
  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      username: map['username'] as String,
      followers: map['followers']?.toInt(),
      follows: map['follows']?.toInt(),
      curdate: map['Curdate'],
    );
  }

  //String toJson() => json.encode(toMap());

  //factory Data.fromJson(String source) => Data.fromMap(json.decode(source));
}
