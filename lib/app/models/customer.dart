import 'package:temp_good_food/app/models/services.dart';

class Customer {
  String id;
  String name;
  String sortName;
  String email;
  String phone;
  String note;
  bool isActive;
  List<Service> services;

  Customer(
      {required this.id,
      required this.name,
      required this.sortName,
      required this.email,
      required this.phone,
      required this.note,
      required this.isActive,
        required  this.services,
      });
}
