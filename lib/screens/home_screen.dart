import 'package:blog_app_flutter/services/networking.dart';
import 'package:blog_app_flutter/widgets/blog_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const route = "/";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var blogs = [];
  bool loading = false;

  getBlogs() async {
    setState(() {
      loading = true;
    });
    final data = await NetworkHelper().getPosts();
    setState(() {
      blogs = data["data"];
      loading = false;
    });
  }

  @override
  void initState() {
    getBlogs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Blogs "),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        onPressed: () {
          print("FAB clicked");
        },
        child: const Icon(Icons.add),
      ),
      body: !loading
          ? (blogs.isNotEmpty
              ? ListView.builder(
                  padding: const EdgeInsets.only(
                      top: 5, bottom: 60, left: 5, right: 5),
                  itemCount: blogs.length,
                  itemBuilder: (BuildContext context, int i) {
                    return BlogWidget(blog: blogs[i]);
                  },
                )
              : const Text("EMPTY"))
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
