class UserModel {
  String? status;
  String? token;
  Data? data;

  UserModel({this.status, this.token, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    token = json['token'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['token'] = token;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  User? user;

  Data({this.user});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  String? firstName;
  String? lastName;
  String? email;
  String? file;
  String? address;
  String? dateOfBirth;
  String? role;
  String? phone;
  bool? rememberMe;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? id;

  User(
      {this.firstName,
      this.lastName,
      this.email,
      this.file,
      this.address,
      this.dateOfBirth,
      this.role,
      this.phone,
      this.rememberMe,
      this.sId,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.id});

  User.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    file = json['file'];
    address = json['address'];
    dateOfBirth = json['dateOfBirth'];
    role = json['role'];
    phone = json['phone'];
    rememberMe = json['rememberMe'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['file'] = file;
    data['address'] = address;
    data['dateOfBirth'] = dateOfBirth;
    data['role'] = role;
    data['phone'] = phone;
    data['rememberMe'] = rememberMe;
    data['_id'] = sId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['id'] = id;
    return data;
  }
}
