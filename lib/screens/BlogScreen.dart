import 'package:flutter/material.dart';

class Blogscreen extends StatefulWidget {
  const Blogscreen({super.key});

  @override
  State<Blogscreen> createState() => _BlogscreenState();
}

class _BlogscreenState extends State<Blogscreen> {
  List<String> blogs = []; // List to store blog titles
  final TextEditingController _blogController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blog Dashboard'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Create a New Blog',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Text Input for Blog
            TextField(
              controller: _blogController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Enter your blog content here...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Upload Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // Functionality to upload text file
                  },
                  icon: const Icon(Icons.file_upload),
                  label: const Text('Upload Text'),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // Functionality to upload video
                  },
                  icon: const Icon(Icons.video_library),
                  label: const Text('Upload Video'),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Publish Button
            ElevatedButton(
              onPressed: () {
                if (_blogController.text.isNotEmpty) {
                  setState(() {
                    blogs.add(_blogController.text);
                    _blogController.clear();
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
              ),
              child: const Text('Publish Blog'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Published Blogs',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // List of Blogs
            Expanded(
              child: blogs.isNotEmpty
                  ? ListView.builder(
                itemCount: blogs.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(
                        blogs[index],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            blogs.removeAt(index);
                          });
                        },
                      ),
                    ),
                  );
                },
              )
                  : const Center(
                child: Text('No blogs published yet.'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
