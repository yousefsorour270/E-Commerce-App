import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_first_project/core/design/app_button.dart';
import 'package:flutter_first_project/core/design/app_image.dart';
import 'package:flutter_first_project/core/design/app_input.dart';
import 'package:flutter_first_project/core/logic/helper_methods.dart';

class AddProductView extends StatefulWidget {
  final bool isAdd;

  const AddProductView({super.key, this.isAdd = true});

  @override
  State<AddProductView> createState() => _AddProductViewState();
}

class _AddProductViewState extends State<AddProductView> {
  String? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isAdd ? "Add Product" : "Edit Product"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => Container(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Choose Image Source",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w700),
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () async {
                                  final image = await ImagePicker().pickImage(
                                    source: ImageSource.camera,
                                  );
                                  Navigator.pop(context);

                                  if (image != null) {
                                    selectedImage = image.path;
                                    setState(() {});
                                  }
                                  print("******");
                                  print(image?.path);
                                },
                                icon: Icon(
                                  Icons.camera_alt,
                                  size: 100,
                                ),
                              ),
                              IconButton(
                                onPressed: () async {
                                  final image = await ImagePicker().pickImage(
                                    source: ImageSource.gallery,
                                  );
                                  Navigator.pop(context);

                                  if (image != null) {
                                    selectedImage = image.path;
                                    setState(() {});
                                  }
                                  print("******");
                                  print(image?.path);
                                },
                                icon: Icon(
                                  Icons.image,
                                  size: 100,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
                child: Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    ClipOval(
                      child: AppImage(
                        selectedImage != null
                            ? selectedImage!
                            : "pick_image.png",
                        height: 153,
                        width: 153,
                      ),
                    ),
                    CircleAvatar(
                      child: AppImage("add.png"),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),
            AppInput(text: "Name"),
            AppInput(text: "Description"),
            AppInput(text: "Buy Price"),
            AppInput(text: "Sell Price"),
            AppButton(
              text: widget.isAdd ? "Add Product" : "Edit Product",
              onPressed: () {
                navigateTo(AddProductView(
                  isAdd: false,
                ));
              },
            )
          ],
        ),
      ),
    );
  }
}
