import 'package:hive/hive.dart';

part 'user_data_model.g.dart';

@HiveType(typeId: 4)
class UserData {
  @HiveField(0)
  String login;

  @HiveField(1)
  String name;

  @HiveField(2)
  String lastName;

  @HiveField(3)
  String password;

  UserData({
    required this.login,
    required this.name,
    required this.lastName,
    required this.password,
  });
}
