class User {
  String name;
  String email;

  User({required this.name, required this.email});

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'];
}

//wanted to try some different way
// import 'package:json_annotation/json_annotation.dart';
// import 'data.dart';
// part 'user.g.dart';
//
// @JsonSerializable()
// class User {
//   User({
//     required this.data,
//   });
//
//   Data data;
//
//   factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
//
//   Map<String, dynamic> toJson() => _$UserToJson(this);
// }
