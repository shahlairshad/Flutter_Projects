
import 'package:badges/badges.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:get/get.dart';
import 'package:my_flutter_1/february/flutter_getx/view/screen/product_list_view.dart';
import '../../controller/product_controller.dart';
void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:ProductListScreen() ,));
}

final ProductController controller = Get.put(ProductController());

class ProductListScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[200],
        title: const Text("Smart Watches"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0), // Adjust the padding as needed
            child: IconButton(
              icon: Badge(
                badgeContent: Obx(() => Text(controller.itemCount.value.toString())),
                child: Icon(Icons.shopping_cart),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: controller.navigateToCartScreen,
                  ),
                );
              },
            ),
          ),
        ],
      ),

      body:  ProductListView(),
    );
  }
}