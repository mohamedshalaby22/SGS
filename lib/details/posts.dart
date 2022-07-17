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
    await Future.delayed(const Duration(seconds: 2));
    setState(() {});
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
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: posts.length,
                      itemBuilder: (context, index) {
                        return DefPosts(posts[index]);
                      }));
            }));
  }
}

// ignore: constant_identifier_names
enum _MenuValue { update, delete }

class DefPosts extends StatefulWidget {
  const DefPosts(
    this.post, {
    Key? key,
  }) : super(key: key);
  final Map post;

  @override
  State<DefPosts> createState() => _DefPostsState();
}

class _DefPostsState extends State<DefPosts> {
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

  final _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          ListTile(
              leading: CircleAvatar(
                  radius: 20,
                  backgroundImage: ((widget.post['doctor']['image'] != null
                      ? NetworkImage(widget.post['doctor']['image'])
                      : const AssetImage('assets/p1.png')) as ImageProvider)),
              title: Text(
                widget.post['doctor']['name'],
                style: const TextStyle(color: Colors.black),
              ),
              trailing: isDoctor
                  ? PopupMenuButton<_MenuValue>(
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
                                      widget.post['subject']['id'].toString(),
                                      post: widget.post,
                                    ),
                                transition: Transition.leftToRight);
                            break;
                          case _MenuValue.delete:
                            await Api.deletePost(widget.post['id'].toString(),
                                showLoading: true);
                            break;
                        }
                      },
                    )
                  : null),
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
                    widget.post['body'],
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.grey.shade700,
                        height: 1.5),
                  ),
                  (widget.post['file'] != null &&
                          widget.post['file'].toString().contains("https"))
                      ? Padding(
                          padding: const EdgeInsets.only(
                              top: defaultPading, bottom: defaultPading),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(widget.post['file'],
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: 200),
                          ),
                        )
                      : const SizedBox(height: 50),
                  const Divider(
                    thickness: 1.2,
                  ),
                  FutureBuilder<List>(
                      future: Api.getComments(widget.post['id'].toString()),
                      builder: (_, snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        if (snapshot.hasData && snapshot.data!.isEmpty) {
                          return Center(
                              child: Column(
                            children: [
                              Text1(
                                text: 'No Comments found',
                                color: Colors.grey.shade600,
                              ),
                            ],
                          ));
                        }

                        final comments = snapshot.data ?? [];
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...comments
                                .map((e) => Container(
                                      margin: const EdgeInsets.only(bottom: 15),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors.grey.shade200,
                                      ),
                                      child: ListTile(
                                          contentPadding:
                                              const EdgeInsets.only(bottom: 8),
                                          leading: Image.asset('assets/p1.png'),
                                          title: Text(e['name']),
                                          subtitle: Text(e['comment']),
                                          trailing: isDoctor
                                              ? IconButton(
                                                  onPressed: () async {
                                                    await Api.deleteCmment(
                                                        e['id'].toString(),
                                                        showLoading: true);
                                                    setState(() {});
                                                  },
                                                  color: Colors.red,
                                                  icon:
                                                      const Icon(Icons.delete))
                                              : null),
                                    ))
                                .toList(),
                            const SizedBox(height: 16),
                            Text('${comments.length} Comment',
                                style: TextStyle(color: Colors.grey.shade500)),
                            const Padding(
                              padding: EdgeInsets.only(
                                  top: defaultPading / 3,
                                  bottom: defaultPading / 3),
                              child: Divider(
                                thickness: 1,
                              ),
                            ),
                          ],
                        );
                      }),
                  const SizedBox(height: 16),
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
                              controller: _commentController,
                              maxLines: 3,
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                      onPressed: () async {
                                        if (_commentController.text
                                            .trim()
                                            .isNotEmpty) {
                                          await Api.addComment(
                                              widget.post['id'].toString(),
                                              _commentController.text.trim(),
                                              showLoading: true);
                                          _commentController.clear();
                                          setState(() {});
                                        }
                                      },
                                      icon: const Icon(Icons.send)),
                                  hintText: 'Add comment',
                                  border: InputBorder.none),
                            )),
                      ),
                    ],
                  )
                ],
              )),
        ],
      ),
    );
  }
}
