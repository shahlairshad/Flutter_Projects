import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter_1/february/flutter_getx/view/screen/product_list_view.dart';
import '../../controller/product_controller.dart';


final ProductController controller = Get.put(ProductController());

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.navigateToListItemScreen,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Cart"),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                onPressed:controller.removeItems,
                icon: const Icon(Icons.delete_forever),
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(child: ProductListView()),
            SizedBox(
              height: 70,
              child: Column(
                children: [
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Obx(
                          () {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    ElevatedButton(
                                        onPressed: controller.isCheckOutButtonEnabled(),
                                        child: const Text("Check out")),
                                    SizedBox(width: 200,),
                                    Text(
                                      "Total : ",
                                      style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue[900]),
                                    ),
                                    Text(controller.price.value.toString(),
                                      style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue[900]),
                                    ),

                                  ],
                                ),

                              ],
                            ),
                            // ElevatedButton(
                            //     onPressed: controller.isCheckOutButtonEnabled(),
                            //     child: const Text("Check out"))
                          ],
                        );
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}