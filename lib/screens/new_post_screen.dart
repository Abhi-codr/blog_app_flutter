import 'package:flutter/material.dart';

class NewPostScreen extends StatefulWidget {
  const NewPostScreen({Key? key}) : super(key: key);

  @override
  _NewPostScreenState createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  var title = "";
  var content = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Post"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Save");
        },
        backgroundColor: Colors.redAccent,
        child: const Icon(Icons.save),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(title),
            TextFormField(
              onChanged: (val) => setState(() {
                title = val;
              }),
              decoration: const InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  labelText: 'Title',
                  labelStyle: TextStyle(fontSize: 20),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF969397), width: 2),
                  ),
                  border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              maxLines: 10,
              onChanged: (val) => setState(() {
                title = val;
              }),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF969397), width: 2),
                ),
                labelStyle: TextStyle(fontSize: 20),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                labelText: 'Content',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
