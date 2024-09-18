// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:my_app/Box_Widget.dart';
import 'package:my_app/Btn_Widget.dart';
import 'package:my_app/modal/item.dart';

class ListApp extends StatefulWidget {
  const ListApp({
    super.key,
  });

  @override
  State<ListApp> createState() => _ListAppState();
}

class _ListAppState extends State<ListApp> {
  final List<DataItem> items = [];

  void hendalAddTask(String name) {
    var newItem = DataItem(id: DateTime.now().toString(), name: name);
    setState(() {
      items.add(newItem);
    });
  }

  void hendalDelete(String id) {
    setState(() {
      items.removeWhere((item) => item.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "ToDoList",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: items
              .map((item) => boxWidget(
                    item: item,
                    hendalDelete: hendalDelete,
                    index: items.indexOf(item),
                  ))
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          shape: const CircleBorder(),
          onPressed: () => {
                showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (BuildContext context) {
                      return btnWidget(addTask: hendalAddTask);
                    }),
              },
          child: const Icon(
            Icons.add,
            size: 40,
            color: Colors.white,
          )),
    );
  }
}
