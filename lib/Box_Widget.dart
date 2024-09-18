// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class boxWidget extends StatelessWidget {
  boxWidget({
    super.key,
    required this.item,
    required this.hendalDelete,
    required this.index,
  });
  var item;

  var hendalDelete;

  var index;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 74,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: (index % 2 == 0)
              ? const Color.fromARGB(255, 143, 234, 255)
              : const Color(0xffDFDFDF),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              item.name,
              style: const TextStyle(
                  fontSize: 20,
                  color: Color(0xff4B4B4B),
                  fontWeight: FontWeight.bold),
            ),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Xác nhận xóa"),
                      content: const Text("Bạn có chắc chắn muốn xóa không?"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pop(); // Đóng hộp thoại nếu chọn "Không"
                          },
                          child: const Text("Không"),
                        ),
                        TextButton(
                          onPressed: () {
                            // Thực hiện hành động xóa tại đây
                            hendalDelete(item.id);
                            Navigator.of(context)
                                .pop(); // Đóng hộp thoại sau khi xóa
                          },
                          child: const Text("Có"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Icon(
                Icons.delete_outlined,
                color: Color(0xff4B4B4B),
                size: 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}
