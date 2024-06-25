// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:pdfx/pdfx.dart' as pdfx; // Alias for pdfx
// import 'package:path_provider/path_provider.dart';
// import 'package:image/image.dart' as img;

// class PDFExtractor {
//   final String pdfPath;

//   PDFExtractor(this.pdfPath);

//   Future<void> extractImages() async {
//     // Use the alias to specify which PdfDocument to use
//     final document = await pdfx.PdfDocument.openFile(pdfPath);
//     final outputDir = await getApplicationDocumentsDirectory();

//     for (int pageIndex = 0; pageIndex < document.pagesCount; pageIndex++) {
//       final page = await document.getPage(pageIndex + 1);

//       // Render the page to an image
//       final pageImage = await page.render(
//         width: page.width,
//         height: page.height,
//       );

//       if (pageImage != null) {
//         final bytes = pageImage.bytes;

//         // Save the rendered page as an image for further processing
//         final filePath = '${outputDir.path}/page_$pageIndex.png';
//         final file = File(filePath);
//         await file.writeAsBytes(bytes);
//         print('Saved page image to $filePath');

//         // Use the image package to manipulate the image and extract portions
//         final image = img.decodeImage(bytes);
//         if (image != null) {
//           await _extractImagesFromPage(image, outputDir, pageIndex);
//         }
//       }

//       await page.close();
//     }

//     await document.close();
//   }

//   Future<void> _extractImagesFromPage(
//       img.Image image, Directory outputDir, int pageIndex) async {
//     // Placeholder for extracting specific regions
//     // For simplicity, this example treats the entire page as a single image
//     // You can implement more complex logic to detect and extract individual images

//     // Save the entire page as an image
//     final imageFilePath = '${outputDir.path}/extracted_page_$pageIndex.png';
//     final imageFile = File(imageFilePath);
//     await imageFile.writeAsBytes(img.encodePng(image));
//     print('Extracted image saved to $imageFilePath');
//   }
// }
