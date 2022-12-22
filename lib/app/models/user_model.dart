class User {
  String username;
  String fullName;
  String role;
  bool isActive;


  User({required this.username, required this.fullName, required this.role, required this.isActive});

  List<String> genList() {
    return [
      username,
      fullName,
      role,
    ];
  }

  changeStatus(bool onChanged) {
    isActive = onChanged;
  }

}