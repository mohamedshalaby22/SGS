import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_3/components/leading_icon.dart';
import 'package:flutter_application_3/constant/const.dart';
import 'package:flutter_application_3/details/add_post.dart';
import 'package:get/get.dart';

class Posts extends StatefulWidget {
  const Posts({Key? key}) : super(key: key);

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
                Get.to(() => const AddPostScreen(),
                    transition: Transition.zoom);
              },
              label: const Text('Add Post'))
          : null,
      appBar: AppBar(
        leading: const LeadingIcon(),
      ),
      body: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          if (notification.direction == ScrollDirection.forward) {
            if (!isVisible) {
              setState(() {
                isVisible = true;
              });
            }
          } else if (notification.direction == ScrollDirection.reverse) {
            if (isVisible) {
              setState(() {
                isVisible = false;
              });
            }
          }
          return true;
        },
        child: ListView.builder(
          itemBuilder: ((context, index) => const DefPosts()),
          itemCount: 3,
        ),
      ),
    );
  }
}

// ignore: constant_identifier_names
enum _MenuValue { update, delete }

class DefPosts extends StatelessWidget {
  const DefPosts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void cheackOnDeleted() {
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

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          ListTile(
              leading: const CircleAvatar(
                  radius: 20, backgroundImage: AssetImage('assets/p1.png')),
              title: const Text(
                'Dr:Marawa Kashaba',
                style: TextStyle(color: Colors.black),
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
                onSelected: (value) {
                  switch (value) {
                    case _MenuValue.update:
                      Get.to(() => const AddPostScreen(),
                          transition: Transition.leftToRight);
                      break;
                    case _MenuValue.delete:
                      cheackOnDeleted();
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
                const Text(
                  'غدا ان شاء الله بعد المحاضره الاولي كل التيمات تيجي عندي المكتب بالدور عشان نبدا نشوف مشاريع التخرج بالتوفيق',
                  textAlign: TextAlign.right,
                  style:
                      TextStyle(fontSize: 18, color: Colors.black, height: 1.5),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: defaultPading, bottom: defaultPading),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset('assets/re.png',
                        fit: BoxFit.cover, width: double.infinity, height: 200),
                  ),
                ),
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
