import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:learn_hive/model/student.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({super.key});

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  final _key = GlobalKey<FormState>();

  late int rollNo;
  late String name;
  late String classname;

  late Box<Student> studBox;

  @override
  void initState() {
    super.initState();
    studBox = Hive.openBox('students') as Box<Student>;
  }

  void saveStud() {
    final isValid = _key.currentState?.validate();
    if (isValid != null && isValid) {
      _key.currentState?.save();
      studBox.add(Student(className: classname, name: name, rollNo: rollNo));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Form(
              key: _key,
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Roll no'),
                    onSaved: (newValue) {
                      rollNo = int.parse(newValue.toString());
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(labelText: 'Name'),
                    onSaved: (newValue) {
                      name = newValue.toString();
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(labelText: 'Class Name'),
                    onSaved: (newValue) {
                      classname = newValue.toString();
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(onPressed: () => saveStud(), child: const Text("Add"))
                ],
              )),
        ],
      ),
    );
  }
}
