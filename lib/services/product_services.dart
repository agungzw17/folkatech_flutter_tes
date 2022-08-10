part of 'services.dart';

class ProductServices {
  static Future<List<ProductModel>> getListProduct({String? query}) async {
    var response =
        await http.get(Uri.parse(apiKey));

    if (response.statusCode == 200) {
      var jsonObject = json.decode(response.body) as List;

      return jsonObject.map<ProductModel>((item) => ProductModel.fromJson(item)).toList();
    } else {
      return [];
    }
  }
}