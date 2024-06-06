import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:open_file/open_file.dart';

Future<PlatformFile?> pickDocumentFile() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['pdf'],
  );

  if (result != null && result.files.isNotEmpty) {
    PlatformFile file = result.files.first;
    print(file.name);
    print(file.bytes);
    print(file.size);
    print(file.extension);
    print(file.path);

    openFile(file);
    
    return file;

    
    // File _file = File(result.files.single.path!);
    // setState(() {
    //   _fileText = _file.path;
    // });
  } else {
    return null;
  }
}

void openFile(PlatformFile file) {
  OpenFile.open(file.path!);
}

Future<String?> uploadtoFirebaseFile(PlatformFile? file) async {
  UploadTask? uploadTask;
  if (file != null) {
    final String route = 'documentosPDF/${file.name}';
    final firebaseFile = File(file.path!);

    final ref = FirebaseStorage.instance.ref().child(route);
    uploadTask = ref.putFile(firebaseFile);

    final snapshot = await uploadTask.whenComplete(() {});

    final url = await snapshot.ref.getDownloadURL();
    return url;
  } else {
    return null;
  }
}
