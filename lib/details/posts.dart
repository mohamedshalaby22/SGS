import 'package:flutter/material.dart';
import 'package:flutter_application_3/Services/api.dart';
import 'package:flutter_application_3/components/leading_icon.dart';
import 'package:flutter_application_3/components/text1.dart';
import 'package:flutter_application_3/constant/const.dart';
import 'package:flutter_application_3/details/add_post.dart';
import 'package:flutter_application_3/main.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class Posts extends StatefulWidget {
  const Posts(this.id, {Key? key}) : super(key: key);
  final String id;
  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  Future<void> _handel() async {
    setState(() {});
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: isDoctor
            ? FloatingActionButton.extended(
                icon: const Icon(Icons.add),
                onPressed: () {
                  Get.to(() => AddPostScreen(widget.id),
                      transition: Transition.zoom);
                },
                label: const Text('Add Post'))
            : null,
        appBar: AppBar(
          leading: const LeadingIcon(),
        ),
        body: FutureBuilder<List>(
            future: Api.getPosts(widget.id),
            builder: (_, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasData && snapshot.data!.isEmpty) {
                return Center(
                    child: Column(
                  children: [
                    Image.asset('assets/no data.gif'),
                    Text1(
                      text: 'No posts found',
                      color: Colors.grey.shade600,
                    ),
                  ],
                ));
              }

              final posts = snapshot.data ?? [];
              return LiquidPullToRefresh(
                  height: 210,
                  backgroundColor: Colors.lightBlue,
                  color: Colors.white,
                  animSpeedFactor: 2,
                  showChildOpacityTransition: false,
                  onRefresh: _handel,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: posts.length,
                      itemBuilder: (context, index) {
                        return DefPosts(posts[index]);
                      }));
            }));
  }
}

// ignore: constant_identifier_names
enum _MenuValue { update, delete }

class DefPosts extends StatelessWidget {
  const DefPosts(
    this.post, {
    Key? key,
  }) : super(key: key);
  final Map post;

  void cheackOnDeleted(context) {
    final snackbar = SnackBar(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(20),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      content: const Text(
        'Post Deleted Successfully!',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          ListTile(
              leading: CircleAvatar(
                  radius: 20,
                  backgroundImage: ((post['doctor']['image'] != null
                      ? NetworkImage(post['doctor']['image'])
                      : const AssetImage('assets/p1.png')) as ImageProvider)),
              title: Text(
                post['doctor']['name'],
                style: const TextStyle(color: Colors.black),
              ),
              trailing: PopupMenuButton<_MenuValue>(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                icon: const Icon(Icons.more_horiz),
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    child: Text('Update'),
                    value: _MenuValue.update,
                  ),
                  const PopupMenuDivider(height: 3),
                  const PopupMenuItem(
                    child: Text('Delete'),
                    value: _MenuValue.delete,
                  ),
                ],
                onSelected: (value) async {
                  switch (value) {
                    case _MenuValue.update:
                      await Get.to(
                          () => AddPostScreen(
                                post['subject']['id'].toString(),
                                post: post,
                              ),
                          transition: Transition.leftToRight);
                      break;
                    case _MenuValue.delete:
                      deafultDialog(context);

                      break;
                  }
                },
              )),
          Container(
            margin: const EdgeInsets.only(
                top: defaultPading / 2, bottom: defaultPading),
            padding: const EdgeInsets.all(defaultPading / 2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.shade50,
                border: Border.all(color: Colors.grey.shade300)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post['body'],
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.grey.shade700,
                      height: 1.5),
                ),
                (post['file'] != null &&
                        post['file'].toString().contains("https"))
                    ? Padding(
                        padding: const EdgeInsets.only(
                            top: defaultPading, bottom: defaultPading),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(post['file'],
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: 200),
                        ),
                      )
                    : const SizedBox(height: 50),
                Text('0 Comment',
                    style: TextStyle(color: Colors.grey.shade500)),
                const Padding(
                  padding: EdgeInsets.only(
                      top: defaultPading / 3, bottom: defaultPading / 3),
                  child: Divider(
                    thickness: 1,
                  ),
                ),
                Row(
                  children: [
                    const CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage('assets/p1.png')),
                    const SizedBox(
                      width: defaultPading / 2,
                    ),
                    Expanded(
                      child: Container(
                          padding:
                              const EdgeInsets.only(left: defaultPading / 2),
                          height: 45,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(20)),
                          child: TextFormField(
                            decoration: const InputDecoration(
                                hintText: 'Add comment',
                                border: InputBorder.none),
                          )),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> deafultDialog(
    BuildContext context,
  ) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          actions: [
            TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Colors.white),
                )),
            TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.redAccent),
              onPressed: () async {
                Get.back();
                await Api.deletePost(post['id'].toString(), showLoading: true);
              },
              child: const Text(
                'Delete Post',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Delete Post',
              ),
              Icon(
                Icons.delete_forever_rounded,
                color: Colors.grey,
              ),
            ],
          ),
          content: Text(
              'Are you sure that you would like to Delete Delete Post? You will lose this Delete Post',
              style: TextStyle(
                color: Colors.grey.shade600,
              ))),
    );
  }
}
