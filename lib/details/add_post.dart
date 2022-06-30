import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/Services/api.dart';
import 'package:flutter_application_3/components/default_button.dart';
import 'package:flutter_application_3/components/formfield.dart';
import 'package:flutter_application_3/constant/const.dart';
import 'package:flutter_application_3/controller/auth.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import '../components/text1.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen(this.id, {this.post = const {}, Key? key})
      : super(key: key);
  final String id;
  final Map post;
  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  var title = TextEditingController();
  File? image;
  String url = '';
  var formKey = GlobalKey<FormState>();
  AuthController controller = Get.put(AuthController());
  @override
  void initState() {
    if (widget.post.isNotEmpty) {
      title.text = widget.post['body'];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.post.isNotEmpty
                              ? "Update Post"
                              : 'Add New Post',
                          style: TextStyle(
                              color: primaryColor,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.add,
                          color: primaryColor,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Center(
                      child: Container(
                        width: 215,
                        height: 1.5,
                        color: aprimary,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: defaultPading * 2,
                ),
                SizedBox(
                    width: width,
                    height: height * 0.20,
                    child: Image.asset('assets/b1.png')),
                const SizedBox(
                  height: defaultPading,
                ),
                Text1(
                  text: '*post_Text',
                  size: 20,
                ),
                const SizedBox(
                  height: 10,
                ),
                DefaultFormField(
                    maxLines: 3,
                    controller: title,
                    onSave: (value) {},
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Post musn\'t be empty';
                      }
                      return null;
                    },
                    type: TextInputType.text,
                    icon: Icons.sort),
                const SizedBox(
                  height: defaultPading,
                ),
                Text1(
                  text: 'Upload Post File',
                  size: 20,
                ),
                const SizedBox(
                  height: defaultPading / 2,
                ),
                GestureDetector(
                  onTap: () async {
                    final result = await FilePicker.platform.pickFiles();
                    if (result == null) {
                      return;
                    }
                    image = File(result.files.first.path!);
                    setState(() {});
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(defaultPading),
                    decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Icon(
                          Icons.add_chart_rounded,
                          color: Colors.grey.shade600,
                        ),
                        const SizedBox(
                          width: defaultPading / 2,
                        ),
                        Text1(
                          text: 'Post File',
                          color: Colors.grey.shade600,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                if (image != null)
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                            fit: BoxFit.fill, image: FileImage(image!))),
                  )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: DefaultButton(
            text: widget.post.isNotEmpty ? "Update Post" : 'Add Post',
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                if (widget.post.isNotEmpty) {
                  await Api.updatePost(image, '', title.text.trim(), widget.id,
                          widget.post['id'].toString(),
                          showLoading: true)
                      .then((value) {
                    title.clear();
                    image = null;
                    setState(() {});
                  });
                } else {
                  await Api.addPost(image, '', title.text.trim(), widget.id, '',
                          showLoading: true)
                      .then((value) {
                    title.clear();
                    image = null;
                    setState(() {});
                  });
                }
              }
            }),
      ),
    );
  }

  void openFile(PlatformFile file) {
    OpenFile.open(file.path!);
  }
}
