import 'package:blog_app_flutter/screens/post_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlogWidget extends StatelessWidget {
  final Map blog;

  const BlogWidget({required this.blog, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 5,
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PostScreen(id: blog["_id"])));
          },
          child: Column(
            children: [
              Hero(
                tag: blog["_id"],
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
                      blog["date"],
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    RichText(
                      text: TextSpan(
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text:
                                  blog["content"].toString().substring(0, 100) +
                                      "..",
                            ),
                            const TextSpan(
                                text: " Read More",
                                style: TextStyle(
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.bold)),
                          ]),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "- ${blog["createdBy"]["name"]}",
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 15),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
