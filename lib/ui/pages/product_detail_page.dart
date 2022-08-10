part of 'pages.dart';

class ProductDetailPage extends StatelessWidget {
  ProductDetailPage({Key? key, required this.productModel}) : super(key: key);

  ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: redDarkColor,
        title: AutoSizeText(
          "Detail Product",
          minFontSize: 8,
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: heightScreen * 0.35,
              decoration: BoxDecoration(
                color: Colors.red,
                image: DecorationImage(
                  image: NetworkImage(productModel.cover!),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  left: widthScreen * 0.04,
                  right: widthScreen * 0.04,
                  top: heightScreen * 0.03),
              child: AutoSizeText(
                productModel.name ?? "Tidak ada",
                minFontSize: 8,
                style: TextStyle(fontSize: 16),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: heightScreen * 0.01,
                left: widthScreen * 0.04,
                right: widthScreen * 0.04,
              ),
              child: AutoSizeText(
                SharedFunction.convertToIdr(
                    double.parse(productModel.price!), 2),
                minFontSize: 8,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: heightScreen * 0.025),
              color: Colors.black.withOpacity(0.3),
              height: heightScreen * 0.0005,
              width: widthScreen,
            ),
            Container(
              margin: EdgeInsets.only(
                top: heightScreen * 0.04,
                left: widthScreen * 0.04,
                right: widthScreen * 0.04,
              ),
              child: AutoSizeText(
                "Description",
                minFontSize: 8,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: heightScreen * 0.02,
                left: widthScreen * 0.04,
                right: widthScreen * 0.04,
              ),
              child: AutoSizeText(
                "${productModel.desc}",
                minFontSize: 8,
                style: TextStyle(
                    fontSize: 16, color: Colors.black.withOpacity(0.6)),
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(
              height: heightScreen * 0.1,
            )
          ],
        ),
      ),
    );
  }
}
