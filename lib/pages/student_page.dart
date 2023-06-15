import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:learn_hive/pages/add_student.dart';

class StudentPage extends StatefulWidget {
  const StudentPage({super.key});

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  late Box studentBox;
  @override
  void initState() {
    super.initState();
    studentBox = Hive.box('students');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 400,
        child: ListView.builder(
          itemBuilder: (context, index) {
            final student = studentBox.getAt(index);
            return ListTile(
              leading: Text(student.id.toString()),
              title: Text(student.name.toString()),
              subtitle: Text(student.className.toString()),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => const AddStudent())));
          },
          child: const Icon(Icons.add)),
    );
  }
}
