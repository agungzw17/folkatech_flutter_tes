part of 'widgets.dart';

class ProductCardItemWidget extends StatelessWidget {
  ProductCardItemWidget({Key? key, required this.productModel})
      : super(key: key);

  ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 1,
              offset: Offset(0, 1),
            )
          ]),
      width: widthScreen * 0.45,
      padding: EdgeInsets.symmetric(
          vertical: heightScreen * 0.015, horizontal: widthScreen * 0.02),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("${productModel.cover}"),
                fit: BoxFit.cover,
              ),
              color: redDarkColor,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10), topLeft: Radius.circular(10)),
            ),
            height: heightScreen * 0.18,

          ),
          Container(
            margin: EdgeInsets.only(top: heightScreen * 0.01),
            alignment: Alignment.centerLeft,
            child: AutoSizeText(
              "${productModel.name}",
              minFontSize: 8,
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: heightScreen * 0.001),
            alignment: Alignment.centerLeft,
            child: AutoSizeText(
              SharedFunction.convertToIdr(double.parse(productModel.price!), 2),
              minFontSize: 8,
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
