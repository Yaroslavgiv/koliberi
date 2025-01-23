import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/styles/colors.dart';
import '../../../utils/device/screen_util.dart';
import '../../buyer/product_card/views/product_card_screen.dart';
import '../controllers/cart_controller.dart';

class CartScreen extends StatelessWidget {
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Корзина",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        backgroundColor: KColors.primary,
      ),
      body: Obx(() {
        if (cartController.cartItems.isEmpty) {
          return Center(
            child: Text(
              "Корзина пуста",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          );
        }
        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: ListView.builder(
            itemCount: cartController.cartItems.length,
            itemBuilder: (context, index) {
              final product = cartController.cartItems[index];
              return ListTile(
                leading: Image.asset(
                  product['image'],
                  width: ScreenUtil.adaptiveWidth(50),
                  height: ScreenUtil.adaptiveHeight(50),
                ),
                title: Text(
                  product['name'],
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                subtitle: Text(
                  "${product['price']} ₽",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                onTap: () {
                  Get.to(() => ProductCardScreen(
                        imageUrl: product['image'],
                        name: product['name'],
                        description: product['description'],
                        price: product['price'],
                      ));
                },
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    cartController.removeFromCart(product);
                  },
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
