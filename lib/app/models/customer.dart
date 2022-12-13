class Customer {
  String id;
  String name;
  String sortName;
  String email;
  String phone;
  String note;
  bool isActive;

  Customer(
      {required this.id,
      required this.name,
      required this.sortName,
      required this.email,
      required this.phone,
      required this.note,
      required this.isActive});
}
