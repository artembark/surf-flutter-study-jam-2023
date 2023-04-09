import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

/// Экран просмотра PDF
class PdfViewScreen extends StatelessWidget {
  const PdfViewScreen({Key? key, required this.filePath, this.fileName})
      : super(key: key);

  final String filePath;
  final String? fileName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(fileName ?? ''),
        ),
        body: PDFView(
          filePath: filePath,
          fitPolicy: FitPolicy.BOTH,
          autoSpacing: false,
        ));
  }
}
