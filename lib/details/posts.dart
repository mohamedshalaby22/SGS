import 'package:flutter/material.dart';
import 'package:flutter_application_3/Services/api.dart';
import 'package:flutter_application_3/components/leading_icon.dart';
import 'package:flutter_application_3/constant/const.dart';
import 'package:flutter_application_3/details/add_post.dart';
import 'package:get/get.dart';

class Posts extends StatefulWidget {
  const Posts(this.id, {Key? key}) : super(key: key);
  final String id;
  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: isVisible
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
                return const Center(child: Text('لا توجد بيانات'));
              }

              final posts = snapshot.data ?? [];
              return RefreshIndicator(
                  onRefresh: () async => setState(() {}),
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

//{id: 2, title: null, body: First Post, file: posts/1656630190images.jpeg, time: 2022-07-01 01:03:10, subject: {id: 44, subject_name: System Analysis}, doctor: {id: 1, name: Doctor 1, email: doctor1@gmail.com, photo: null}}

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
                    borderRadius: BorderRadius.circular(10)),
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
                      await Api.deletePost(post['id'].toString(),
                          showLoading: true);
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
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                      fontSize: 18, color: Colors.black, height: 1.5),
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
}
