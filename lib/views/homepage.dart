import 'package:apiexample1/models/photos.dart';
import 'package:apiexample1/models/post.dart';
import 'package:apiexample1/services/photoservice.dart';
import 'package:apiexample1/services/remoteservice.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Photos>? photos;
  List<Post>? posts;
  var isLoaded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //fetch data from API
    getData();
    getPhoto();
  }

  getPhoto() async {
    photos = await Photoservice().getphoto();
    if (photos != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  getData() async {
    posts = await RemoteServices().getPosts();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts"),
      ),
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
          itemCount: posts?.length,
          itemBuilder: ((context, index) {
            return Container(
              child: Column(
                children: [
                  Text(
                    posts![index].title,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[900]),
                  ),
                  Container(
                    height: 250,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(photos![index].url))),
                  ),
                  Text(
                    posts![index].body,
                    maxLines: 2,
                  ),
                ],
              ),
            );
          }),
        ),
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
