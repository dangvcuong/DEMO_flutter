// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class btnWidget extends StatelessWidget {
  btnWidget({
    super.key,
    required this.addTask,
  });
  String name = "";

  var addTask;
  void hendl_Add(BuildContext context) {
    final ten = name;
    if (ten.isEmpty) {
      return;
    }
    addTask(ten);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                name = value;
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "Nhập Task"),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  hendl_Add(context);
                },
                style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.blue),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero))),
                child: const Text(
                  "Add Task",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
