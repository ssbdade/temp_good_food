import 'package:temp_good_food/app/models/services.dart';

import 'dart:convert';

class Customer {
  String id;
  String name;
  String sortName;
  String email;
  String phone;
  String note;
  bool isActive;
  List<Service> services;

  Customer({
    required this.id,
    required this.name,
    required this.sortName,
    required this.email,
    required this.phone,
    required this.note,
    required this.isActive,
    required this.services,
  });

  void removeService(int index) {
    services.removeAt(index);
  }
}

// To parse this JSON data, do
//
//     final customerModel = customerModelFromJson(jsonString);
List<CustomerModel> customerModelFromJson(Map<String, dynamic> map) =>
    List<CustomerModel>.from(map["content"].map((x) => CustomerModel.fromJson(x)));

String customerModelToJson(List<CustomerModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CustomerModel {
  CustomerModel({
    this.customerId,
    this.customerName,
    this.address,
    this.telephone,
    this.email,
    this.representative,
    this.description,
    this.fullname,
    this.active,
  });

  int? customerId;
  String? customerName;
  String? address;
  String? telephone;
  String? email;
  String? representative;
  String? description;
  String? fullname;
  bool? active;

  factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
        customerId: json["customerId"],
        customerName: json["customerName"],
        address: json["address"],
        telephone: json["telephone"],
        email: json["email"],
        representative: json["representative"],
        description: json["description"],
        fullname: json["fullname"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "customerId": customerId,
        "customerName": customerName,
        "address": address,
        "telephone": telephone,
        "email": email,
        "representative": representative,
        "description": description,
        "fullname": fullname,
        "active": active,
      };
}
