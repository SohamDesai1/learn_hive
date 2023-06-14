import 'package:hive_flutter/hive_flutter.dart';
part 'student.g.dart';

@HiveType(typeId: 0)
class Student extends HiveObject {
  @HiveField(0, defaultValue: 0)
  final int rollNo;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String className;
  Student({required this.className, required this.name, required this.rollNo});
}
