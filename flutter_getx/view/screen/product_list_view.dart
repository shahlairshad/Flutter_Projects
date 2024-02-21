import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter_1/february/flutter_getx/view/screen/product_detail_screen.dart';

import '../../controller/product_controller.dart';
import '../../model/product.dart';

void main() {
  runApp(MaterialApp(home: ProductListView(),));
}

final ProductController controller = Get.put(ProductController());

class ProductListView extends StatelessWidget {
  Widget countButton(int index, void Function(int index) counter,
      {IconData icon = Icons.add}) {
    return RawMaterialButton(
      onPressed: () {
        counter(index);
      },
      elevation: 2.0,
      fillColor: Colors.white,
      child: Icon(
        icon,
        size: 15,
      ),
      shape: const CircleBorder(),
    );
  }


  @override
  Widget build(BuildContext context) {
    Widget listViewBody(Product item, int index) {
      return GestureDetector(
          onTap: ()
      {
        Navigator.push(context,
          MaterialPageRoute(builder: (_) {
            return ProductDetailScreen(item.name, item.image);
          },),);
      },
        child: Card(
          elevation: 4.0,
          // You can adjust the elevation as needed
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          // Adjust the margin as needed
          child: Padding(
            padding: EdgeInsets.all(15.0), // Adjust the padding as needed
            child: SizedBox(
              height: 120, // Adjust the height of the card as needed
              child: Row(
                children: [
                  SizedBox(width: 20),
                  Image.asset(
                    item.image,
                    fit: BoxFit.contain,
                    height:120,
                    width: 100, // Adjust the image width as needed
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          item.name,
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),

                            Text(
                              item.description, // Color name
                            ),

                        Text(
                          item.price,
                        ),
                      ],
                    ),
                  ),
                 // Spacer(),
                  Row(
                    children: [
                      countButton(index, controller.increase),
                      Obx(() =>
                          Text(controller.allProducts[index].count.toString())),
                      countButton(index, controller.decrease,
                          icon: Icons.remove),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }


    return ListView.builder(
      padding: const EdgeInsets.all(15),
      itemCount: controller.allProducts.length,
      itemBuilder: (_, index) {
        Product item = controller.allProducts[index];
        if (controller.isItemListScreen) {
          return listViewBody(item, index);
        } else if (controller.isCartScreen && item.count > 0) {
          return listViewBody(item, index);
        } else {
          return Container();
        }
      },
    );
  }
}

