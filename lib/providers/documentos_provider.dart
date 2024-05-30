import 'package:flutter/material.dart';
import 'package:inforas/models/documento.dart';

class DocumentsProvider extends ChangeNotifier {
  final List<Documento> _documentos = [];

  List<Documento> get documentos => _documentos;

  DateTime _selectedDate = DateTime.now();

  DateTime get selectedDate => _selectedDate;

  void setDate(DateTime date) => _selectedDate = date;

  List<Documento> get documentsOfSelectedDate => _documentos;
  
  void addDocumento(Documento documento) {
    _documentos.add(documento);
    notifyListeners();
  }
  void deleteDocumento(Documento documento) {
    _documentos.remove(documento);
    notifyListeners();
  }

  void editDocumento(Documento documento, Documento documentoOld) {
    final index = _documentos.indexOf(documentoOld);
    _documentos[index] = documento;
    notifyListeners();
  }
}