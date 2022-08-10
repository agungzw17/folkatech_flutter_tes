part of 'pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeProvider homeProvider;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;

    homeProvider = Provider.of<HomeProvider>(context);

    return Scaffold(
        //Color of status bar
        backgroundColor: Colors.black,
        body: Stack(
          children: <Widget>[
            SafeArea(
                child: Container(
              color: Colors.white,
            )),
            SafeArea(
                child: RefreshIndicator(
              onRefresh: () async {
                homeProvider.fetchProducts();
              },
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    //Top bar
                    topBar(widthScreen, heightScreen),
                    //Content of body
                    listProduct(widthScreen, heightScreen),
                    //Checking Scrollable
                    listProduct(widthScreen, heightScreen),
                    SizedBox(
                      height: heightScreen * 0.3,
                    )
                  ],
                ),
              ),
            )),
            CustomBottomNavigationBar()
          ],
        ));
  }

  Widget listProduct(double widthScreen, double heightScreen) {
    return Consumer<HomeProvider>(builder: (context, value, _) {
      if (value.isLoading == true) {
        return Center(
          child: Container(
            margin: EdgeInsets.only(top: heightScreen * 0.3),
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              color: redDarkColor,
            ),
          ),
        );
      } else if (value.products.isEmpty) {
        return Center(
          child: Container(
            margin: EdgeInsets.only(top: heightScreen * 0.3),
            child: AutoSizeText(
              "Produk tidak ada",
              minFontSize: 8,
              style: TextStyle(fontSize: 15),
            ),
          ),
        );
      } else {
        return Container(
          margin: EdgeInsets.only(
              top: heightScreen * 0.06, left: widthScreen * 0.03),
          child: DynamicHeightGridView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 2,
            mainAxisSpacing: 25,
            itemCount: value.products.length,
            builder: (context, index) => Align(
              alignment: Alignment.topLeft,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  ProductDetailPage(
                                    productModel: value.products[index],
                                  )));
                },
                child: ProductCardItemWidget(
                  productModel: value.products[index],
                ),
              ),
            ),
          ),
        );
      }
    });
  }

  Widget topBar(double widthScreen, double heightScreen) {
    return Container(
      width: widthScreen,
      height: heightScreen * 0.1,
      color: redDarkColor,
      child: const Center(
        child: AutoSizeText(
          "List Product",
          minFontSize: 8,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
