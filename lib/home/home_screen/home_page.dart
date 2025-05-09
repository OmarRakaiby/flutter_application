import 'dart:io';
import 'package:flutter/material.dart';
import '../../first_Screen.dart';
import '../../profile/profile_page/profile_page/profile_page.dart';
import '../home_widget/home_widget.dart';

class MyHomePage extends StatelessWidget {
  final String? title;
  final String? body;
  final List<File>? image;

  const MyHomePage({this.image, this.title, this.body, super.key});

  @override
  Widget build(BuildContext context) {
    final String displayTitle = title ?? "Tree";
    final String displayBody =
        body ??
        "A tree stands through every season — blooming in spring, thriving in summer, shedding in autumn, and resting in winter — yet never doubts that it will grow again. Be like the tree.";

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
            icon: const Icon(Icons.account_box),
          ),
        ],
        centerTitle: true,
        title: Text("The$displayTitle"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            image == null || image!.isEmpty
                ? Image.asset("assets/Tree1.jpeg")
                : Image.file(
                  image![0],
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                FavoriteWidget(),
                IconButton(onPressed: null, icon: Icon(Icons.share)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(displayBody, textAlign: TextAlign.justify),
            ),
            const SizedBox(height: 10),
            if (image == null || image!.isEmpty) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  MySeason(url: "Tree2.png", text: "Fall Tree"),
                  MySeason(url: "Tree1.jpeg", text: "Spring Tree"),
                ],
              ),
            ] else ...[
              SizedBox(
                height: 200,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 120,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: image!.length,
                  itemBuilder:
                      (context, index) =>
                          Image.file(image![index], fit: BoxFit.cover),
                  shrinkWrap: true,
                ),
              ),
            ],
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save functionality
              },
              child: const Text("Save"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FirstScreen()),
          );
        },
        child: Icon(Icons.next_plan),
      ),
    );
  }
}
