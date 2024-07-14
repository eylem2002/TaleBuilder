import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tale/core/functions/all_actions.dart';
import 'package:tale/core/providers/chart_provider.dart';
import 'package:tale/utils/layout_manager.dart';
import 'package:tale/utils/theme/text_theme.dart';
import 'package:tale/utils/theme/theme_manager.dart';

class ChartScreen extends ConsumerWidget {
  ChartScreen({super.key});
  TextEditingController textController = TextEditingController();

  Future<void> _downloadImageToGallery(
      Uint8List imageData, BuildContext context) async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      final result = await ImageGallerySaver.saveImage(imageData);
      if (result["isSuccess"]) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Image saved to gallery')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving image to gallery')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Permission denied')),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fWatch = ref.watch(chartProvider);
    final fRead = ref.read(chartProvider);

    return Scaffold(
      backgroundColor: Color(0xFF0A061C),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: GradientText(
          'Image Generator',
          gradient: ThemeManager.title,
          style: TextStyle(
            fontSize: LayoutManager.widthNHeight0(context, 1) * 0.05,
            fontFamily: ThemeManager.fontFamily,
          ),
          textAlign: TextAlign.center,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            onPressed: AllActions().showDevInfo,
            icon: Icon(
              Icons.info_outline_rounded,
              color: ThemeManager.primary,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: LayoutManager.widthNHeight0(context, 1) * 0.05,
          ),
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    fWatch.isLoading == true
                        ? Container(
                            alignment: Alignment.center,
                            height:
                                LayoutManager.widthNHeight0(context, 1) * 0.75,
                            width:
                                LayoutManager.widthNHeight0(context, 1) * 0.75,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Image.memory(fWatch.imageData!),
                          )
                        : Container(
                            alignment: Alignment.center,
                            height:
                                LayoutManager.widthNHeight0(context, 1) * 0.75,
                            width:
                                LayoutManager.widthNHeight0(context, 1) * 0.75,
                            decoration: BoxDecoration(
                              color: ThemeManager.second.withOpacity(0.07),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.image_outlined,
                                  size: 100,
                                  color: ThemeManager.second.withOpacity(0.4),
                                ),
                                SizedBox(
                                  height:
                                      LayoutManager.widthNHeight0(context, 1) *
                                          0.1,
                                ),
                                Text(
                                  'No Image has been generated yet.',
                                  style: TextStyle(
                                    color: ThemeManager.second.withOpacity(0.8),
                                    fontSize: LayoutManager.widthNHeight0(
                                            context, 1) *
                                        0.035,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: ThemeManager.fontFamily,
                                  ),
                                ),
                              ],
                            ),
                          ),
                    SizedBox(
                      height: LayoutManager.widthNHeight0(context, 1) * 0.06,
                    ),
                    Container(
                      height: LayoutManager.widthNHeight0(context, 1) * 0.4,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: ThemeManager.second.withOpacity(0.07),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: TextField(
                        controller: textController,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          fontFamily: ThemeManager.fontFamily,
                        ),
                        cursorColor: Colors.white,
                        maxLines: 5,
                        decoration: InputDecoration(
                          hintText: 'Enter your prompt here...',
                          hintStyle: TextStyle(
                            color: ThemeManager.second.withOpacity(0.6),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: ThemeManager.fontFamily,
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.all(12.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: LayoutManager.widthNHeight0(context, 1) * 0.15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            fRead.textToImage(textController.text, context);
                            fRead.searchingChange(true);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height:
                                LayoutManager.widthNHeight0(context, 1) * 0.15,
                            width:
                                LayoutManager.widthNHeight0(context, 1) * 0.4,
                            decoration: BoxDecoration(
                              gradient: ThemeManager.title,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)),
                            ),
                            child: fWatch.isSearching == false
                                ? Text(
                                    'Generate',
                                    style: TextStyle(
                                      color: ThemeManager.dark,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: ThemeManager.fontFamily,
                                    ),
                                  )
                                : CircularProgressIndicator(
                                    color: ThemeManager.dark,
                                  ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            fRead.loadingChange(false);
                            textController.clear();
                            fWatch.imageData = null;
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height:
                                LayoutManager.widthNHeight0(context, 1) * 0.15,
                            width:
                                LayoutManager.widthNHeight0(context, 1) * 0.4,
                            decoration: BoxDecoration(
                              gradient: ThemeManager.sideTopMenu,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)),
                            ),
                            child: Text(
                              'Clear',
                              style: TextStyle(
                                color: ThemeManager.dark,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: ThemeManager.fontFamily,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: LayoutManager.widthNHeight0(context, 1) * 0.06,
                    ),
                    if (fWatch.imageData != null)
                      IconButton(
                        icon: Icon(Icons.download, color: ThemeManager.second),
                        onPressed: () =>
                            _downloadImageToGallery(fWatch.imageData!, context),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
