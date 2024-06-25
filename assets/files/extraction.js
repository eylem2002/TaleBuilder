
import pdfjsLib from 'pdfjs-dist';
async function extractFirstImageFromPDF(pdfFile) {

    const loadingTask = pdfjsLib.getDocument(pdfFile);
    const pdfDocument = await loadingTask.promise;


    const pageNumber = 1;
    const page = await pdfDocument.getPage(pageNumber);


    const content = await page.getTextContent();
    const firstImage = content.items.find(item => item.image);

    if (!firstImage) {
        throw new Error('No image found in the PDF');
    }


    const { width, height, transform } = firstImage;
    const viewport = page.getViewport({ viewTransform: transform });
    const canvas = document.createElement('canvas');
    const context = canvas.getContext('2d');
    canvas.width = width;
    canvas.height = height;


    await page.render({
        canvasContext: context,
        viewport: viewport,
        transform: transform
    }).promise;


    const imageUrl = canvas.toDataURL();

    return imageUrl;
}
