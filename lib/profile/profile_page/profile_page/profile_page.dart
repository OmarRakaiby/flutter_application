import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ImagePicker imagePicker = ImagePicker();
  File? selectedImage;

  Future<void> imageSelector(ImageSource source) async {
    XFile? image = await imagePicker.pickImage(source: source);
    if (image != null && mounted) {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Center(
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey.shade500,
                  radius: 100,
                  child:
                      selectedImage == null
                          ? const Icon(
                            Icons.person,
                            size: 200,
                            color: Colors.white38,
                          )
                          : ClipOval(
                            child: Image.file(
                              selectedImage!,
                              height: 200,
                              width: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 25,
                  child: IconButton(
                    icon: const Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder:
                            (context) => SizedBox(
                              height: 150,
                              child: Column(
                                children: [
                                  const SizedBox(height: 10),
                                  const Text(
                                    "Profile",
                                    style: TextStyle(fontSize: 25),
                                  ),
                                  const Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Options(
                                        onPressed: () {
                                          imageSelector(ImageSource.camera);
                                          Navigator.pop(context);
                                        },
                                        title: "Camera",
                                        icon: Icons.camera_alt,
                                      ),
                                      Options(
                                        onPressed: () {
                                          imageSelector(ImageSource.gallery);
                                          Navigator.pop(context);
                                        },
                                        title: "Gallery",
                                        icon: Icons.image,
                                      ),
                                      if (selectedImage != null)
                                        Options(
                                          onPressed: () {
                                            setState(() {
                                              selectedImage = null;
                                            });
                                            Navigator.pop(context);
                                          },
                                          title: "Delete",
                                          icon: Icons.delete,
                                          isDelete: true,
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name Section using ListTile
                ListTile(
                  leading: Icon(Icons.person, color: Colors.grey),
                  title: Text(
                    "Name",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("Omar"),
                ),

                // Email Section using ListTile
                ListTile(
                  leading: Icon(Icons.email, color: Colors.grey),
                  title: Text(
                    "Email",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("Omar@gmail.com"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Options extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;
  final bool isDelete;

  const Options({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
    this.isDelete = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = isDelete ? Colors.red : Colors.grey.shade800;

    return Column(
      children: [
        IconButton(icon: Icon(icon, color: color), onPressed: onPressed),
        Text(title, style: TextStyle(color: color)),
      ],
    );
  }
}
