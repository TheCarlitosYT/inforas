import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

void pickFile() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    allowedExtensions: ['pdf'],
  );

  if (result != null && result.files.isNotEmpty) {
    PlatformFile file = result.files.first;

    print(file.name);
    print(file.bytes);
    print(file.size);
    print(file.extension);
    print(file.path);

    // File _file = File(result.files.single.path!);
    // setState(() {
    //   _fileText = _file.path;
    // });
  } else {
    // User canceled the picker
  }
}
