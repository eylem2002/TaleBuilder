// import 'dart:io';
// import 'package:path_provider/path_provider.dart';
// import 'package:pdf_render/pdf_render.dart';
// import 'package:image/image.dart' as img;

// Future<List<File>> extractImagesFromPdf(File pdfFile) async {
//   // Get the temporary directory for storing extracted images
//   final outputDir = await getTemporaryDirectory();
  
//   // Open the PDF document
//   final document = await PdfDocument.openFile(pdfFile.path);

//   List<File> extractedImages = [];

//   // Loop through each page in the PDF
//   for (var i = 1; i <= document.pageCount; i++) {
//     // Get the page
//     final page = await document.getPage(i);
    
//     // Convert page dimensions to integers
//     final width = page.width.toInt();
//     final height = page.height.toInt();
    
//     // Render the page as an image
//     final pageImage = await page.render(
//       width: width,
//       height: height,
//       fullWidth: width,
//       fullHeight: height,
//     );

//     // Create an image object from the rendered bytes
//     final image = img.Image.fromBytes(
//       pageImage.width.toInt(),
//       pageImage.height,
//       pageImage.bytes,
//     );

//     // Save the image to a file in the temporary directory
//     final file = File('${outputDir.path}/image_page${i}_${DateTime.now().millisecondsSinceEpoch}.png');
//     file.writeAsBytesSync(img.encodePng(image));
//     extractedImages.add(file);

//     // Dispose of the page to free up resources
//     await page.dispose();
//   }

//   // Close the PDF document to free up resources
//   await document.dispose();

//   return extractedImages;
// }
