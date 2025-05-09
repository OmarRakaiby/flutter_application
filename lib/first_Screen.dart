import 'dart:io'; // for File
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'home/home_screen/home_page.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final ImagePicker imagePicker = ImagePicker();
  List<File> selectedImages = [];

  final TextEditingController title = TextEditingController();
  final TextEditingController body = TextEditingController();

  Future<void> imageSelector() async {
    List<XFile>? images = await imagePicker.pickMultiImage();
    if (mounted) {
      setState(() {
        selectedImages.addAll(images.map((img) => File(img.path)).toList());
      });
    }
  }

  @override
  void dispose() {
    title.dispose();
    body.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("Tree2.png"),
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            const SizedBox(height: 40),
            selectedImages.isEmpty
                ? Container(
                  color: Colors.white38,
                  height: 150,
                  width: MediaQuery.sizeOf(context).width - 20,
                  child: IconButton(
                    onPressed: imageSelector,
                    icon: const Icon(Icons.camera_alt),
                  ),
                )
                : Row(
                  children: [
                    Container(
                      color: Colors.white38,
                      height: 100,
                      width: 100,
                      child: IconButton(
                        onPressed: imageSelector,
                        icon: const Icon(Icons.camera_alt),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: SizedBox(
                        height: 100,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children:
                              selectedImages.map((imgFile) {
                                return Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 4,
                                      ),
                                      child: Image.file(
                                        imgFile,
                                        height: 100,
                                        width: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: IconButton(
                                        icon: const Icon(
                                          Icons.cancel,
                                          color: Colors.red,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            selectedImages.remove(imgFile);
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                );
                              }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
            const SizedBox(height: 20),
            TextField(
              controller: title,
              decoration: const InputDecoration(
                hintText: "Title",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: body,
              minLines: 3,
              maxLines: 7,
              decoration: const InputDecoration(
                hintText: "Body",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder:
                  (context) => MyHomePage(
                    title: title.text,
                    body: body.text,
                    image: selectedImages,
                  ),
            ),
          );
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
