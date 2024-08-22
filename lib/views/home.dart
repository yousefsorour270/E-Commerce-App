import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_first_project/core/logic/helper_methods.dart';
import 'package:flutter_first_project/views/add_product.dart';

import '../../core/design/app_image.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //leadingWidth: 32,
        leading: Padding(
          padding: EdgeInsetsDirectional.only(start: 24),
          child: AppImage(
            "Vector.png",
          ),
        ),
        actions: [
          GestureDetector(
              onTap: () {
                print("Hello");
              },
              child: AppImage("cart.png")),
          SizedBox(width: 24),
        ],
        title: Text(
          "TECO",
          style: TextStyle(fontFamily: "NewRocker"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateTo(AddProductView());
        },
        child: AppImage("add.png"),
      ),
      body: ListView.separated(
          padding: EdgeInsets.all(24),
          itemBuilder: (context, index) => _Item(),
          separatorBuilder: (context, index) => SizedBox(
            height: 16,
          ),
          itemCount: 3),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateTo(AddProductView(isAdd: false,));
      },
      child: Container(
        padding: EdgeInsets.all(8),
        //height: 100,
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) => SimpleDialog(
                      children: [
                        AppImage(
                          "https://assets.clevelandclinic.org/transform/47cdb246-3c9d-4efb-8b3b-1e6b85567a16/Fruit-Juice-155376375-770x533-1_jpg",
                        ),
                      ],
                    ));
              },
              child: AppImage(
                "https://assets.clevelandclinic.org/transform/47cdb246-3c9d-4efb-8b3b-1e6b85567a16/Fruit-Juice-155376375-770x533-1_jpg",
                height: 95,
                radius: 16,
                width: 102,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Product",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Fruit juice is made from a wide variety of fruits, including oranges, apples,grapes, cranberries, grapefruits, tomatoes, bayberries",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).secondaryHeaderColor),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      "25",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).primaryColor),
                    ),
                    SizedBox(width: 4),
                    Text(
                      "USD",
                      style: TextStyle(
                          fontSize: 10, color: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                FloatingActionButton(
                  mini: true,
                  onPressed: () {},
                  child: AppImage("add.png"),
                )
              ],
            )
          ],
        ),
        decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(16), boxShadow: [
          BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 4,
              blurStyle: BlurStyle.outer,
              color: Colors.black.withOpacity(.15))
        ]
          //color: Colors.green,
        ),
      ),
    );
  }
}