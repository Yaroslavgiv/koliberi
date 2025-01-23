import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CartController extends GetxController {
  final RxList<Map<String, dynamic>> cartItems = <Map<String, dynamic>>[].obs;
  final GetStorage storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    loadCartItems();
  }

  void addToCart(Map<String, dynamic> product) {
    cartItems.add(product);
    saveCartItems();
    Get.snackbar(
      "Успешно",
      "Товар добавлен в корзину",
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void removeFromCart(Map<String, dynamic> product) {
    cartItems.remove(product);
    saveCartItems();
    Get.snackbar(
      "Успешно",
      "Товар удалён из корзины",
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void saveCartItems() {
    storage.write('cartItems', cartItems);
  }

  void loadCartItems() {
    final storedItems = storage.read<List<dynamic>>('cartItems') ?? [];
    cartItems.assignAll(storedItems.cast<Map<String, dynamic>>());
  }
}
