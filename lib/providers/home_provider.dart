part of 'providers.dart';

class HomeProvider with ChangeNotifier {
  bool? _isLoading;
  List<ProductModel> products = [];

  set isLoading(bool? isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  bool? get isLoading {
    return _isLoading ?? false;
  }

  void fetchProducts() async {
    print("fetchProduct on Home Provider");
    isLoading = true;
    products = await ProductServices.getListProduct();
    isLoading = false;
  }
}
