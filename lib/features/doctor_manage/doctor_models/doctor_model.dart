class DoctorModel {
  String? status;
  String? token;
  Data? data;

  DoctorModel({this.status, this.token, this.data});

  DoctorModel.fromJson(Map<String, dynamic> json) {
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
  String? description;
  String? file;
  int? experience;
  String? hospital;
  String? address;
  String? dateOfBirth;
  List<AvailableAppointments>? availableAppointments;
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
      this.description,
      this.file,
      this.experience,
      this.hospital,
      this.address,
      this.dateOfBirth,
      this.availableAppointments,
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
    description = json['description'];
    file = json['file'];
    experience = json['experience'];
    hospital = json['hospital'];
    address = json['address'];
    dateOfBirth = json['dateOfBirth'];
    if (json['availableAppointments'] != null) {
      availableAppointments = <AvailableAppointments>[];
      json['availableAppointments'].forEach((v) {
        availableAppointments!.add(AvailableAppointments.fromJson(v));
      });
    }
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
    data['description'] = description;
    data['file'] = file;
    data['experience'] = experience;
    data['hospital'] = hospital;
    data['address'] = address;
    data['dateOfBirth'] = dateOfBirth;
    if (availableAppointments != null) {
      data['availableAppointments'] =
          availableAppointments!.map((v) => v.toJson()).toList();
    }
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

class AvailableAppointments {
  String? day;
  String? from;
  String? to;
  String? sId;
  String? id;

  AvailableAppointments({this.day, this.from, this.to, this.sId, this.id});

  AvailableAppointments.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    from = json['from'];
    to = json['to'];
    sId = json['_id'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['day'] = day;
    data['from'] = from;
    data['to'] = to;
    data['_id'] = sId;
    data['id'] = id;
    return data;
  }
}
