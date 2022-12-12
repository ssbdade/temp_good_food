import 'package:temp_good_food/app/models/user_model.dart';

class UsersData {
  static List<User> listUser = [
    User(
        username: 'admin',
        fullName: 'Administrator',
        role: 'ADMIN',
        isActive: true),
    User(
        username: 'duydx',
        fullName: 'Đặng Xuân Duy',
        role: 'USER',
        isActive: true),
    User(
        username: 'huytq',
        fullName: 'Trần Quốc Huy',
        role: 'ADMIN',
        isActive: true),
    User(
        username: 'datnt',
        fullName: 'Nguyễn Thành Đạt',
        role: 'USER',
        isActive: true),
    User(
        username: 'huytran',
        fullName: 'Trần Quốc Huy',
        role: 'USER',
        isActive: true),
  ];
}
