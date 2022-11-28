import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

void showSnackbar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(text)),
  );
}

Future<List<File>> pickImages() async {
  List<File> images = [];
  try {
    var files = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );
    if (files != null && files.files.isNotEmpty) {
      print("file is not empty");
      for (int i = 0; i < files.files.length; i++) {
        images.add(File(files.files[i].path!));
      }
      print(files.count.toString() + " images Added to file");
      // print(images.length.toString() + " is the length of list images");
    }
  } catch (e) {
    print(e);
    debugPrint(
      e.toString(),
    );
  }

  return images;
}
