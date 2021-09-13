import 'package:blog_app_flutter/services/networking.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  final String id;
  const PostScreen({required this.id, Key? key}) : super(key: key);
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  var blog;
  var loading = false;

  getPost() async {
    setState(() {
      loading = true;
    });
    var temp = await NetworkHelper().getPost(widget.id);
    setState(() {
      blog = temp["data"];
      loading = false;
    });
  }

  @override
  void initState() {
    getPost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Blog"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        onPressed: () {
          print("edit");
        },
        child: const Icon(
          Icons.edit,
        ),
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : (Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: widget.id,
                  child: Image.network(
                    "https://c4.wallpaperflare.com/wallpaper/826/524/865/3-316-16-9-aspect-ratio-s-sfw-wallpaper-preview.jpg",
                    fit: BoxFit.contain,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        blog["title"].toString().toUpperCase(),
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "By ${blog["createdBy"]["name"]}",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SelectableText(
                        blog["content"],
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                )
              ],
            )),
    );
  }
}
