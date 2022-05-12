// ignore_for_file: unnecessary_null_comparison

class UserModel {
  int? id;
  String? name;
  String? email;
  int? gender;
  String? year;
  dynamic department;
  String? photo;
  dynamic pinCode;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;

  UserModel({
    this.createdAt,
    this.department,
    this.email,
    this.emailVerifiedAt,
    this.gender,
    this.id,
    this.name,
    this.photo,
    this.pinCode,
    this.updatedAt,
    this.year,
  });
  UserModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    id = map['id'];
    name = map['name'];
    email = map['email'];
    gender = map['gender'];
    year = map['year'];
    department = map['department'];
    photo = map['photo'];
    pinCode = map['pin_code'];
    emailVerifiedAt = map['email_verified_at'];
    createdAt = map['created_at'];
    updatedAt = map['updated_at'];
  }
  toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'gender': gender,
      'year': year,
      'department': department,
      'photo': photo,
      'pin_code': pinCode,
      'email_verified_at': emailVerifiedAt,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
