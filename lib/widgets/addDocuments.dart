import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';

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


Future openFileStr ( String url) async {
  final file = await downloadFile(url, 'name.txt');

  print('path: ${file?.path}');

  if (file != null) {
    print('ey');
    OpenFile.open(file.path);
  }
}

void openFileString(String enlace) async {
   final Uri url = Uri.parse(enlace);
   print(url);
   if (!await launchUrl(url)) {
        throw Exception('No se pudo lanzar la url: $url');
    }
}

Future<File?> downloadFile(String url, String name) async {
  final appStorage = await getApplicationDocumentsDirectory();
  final file = File('/downloads/${name}.pdf');

  final response = await Dio().get(
    url,
    options: Options(
      responseType: ResponseType.bytes,
      followRedirects: false,
      receiveTimeout: Duration.zero,
    ),
  );
  final raf = file.openSync(mode: FileMode.write);
  raf.writeFromSync(response.data);
  await raf.close();
  return file;
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

String generarCadenaAleatoria(int longitud) {
  const String _chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  Random _rnd = Random();
  
  return String.fromCharCodes(Iterable.generate(
    longitud, 
    (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))
  ));
}
