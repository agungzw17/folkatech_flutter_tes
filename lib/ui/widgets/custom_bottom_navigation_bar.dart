part of 'widgets.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  bool isPanel = false;

  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;

    return SlidingUpPanel(
      minHeight: heightScreen * 0.2,
      onPanelClosed: () {
        print("PanelClosed");
        isPanel = false;
        setState(() {});
      },
      onPanelOpened: () {
        print("Panel Open");
        isPanel = true;
        setState(() {});
      },
      onPanelSlide: (value) {
        // print("Slide");
      },
      header: (isPanel == false)
          ? Container(
          width: widthScreen,
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: widthScreen * 0.1,
                height: heightScreen * 0.005,
                decoration: BoxDecoration(color: Colors.black),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: widthScreen * 0.05),
                padding: EdgeInsets.symmetric(
                    horizontal: widthScreen * 0.05),
                width: widthScreen,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 1),
                      )
                    ]),
                child: DynamicHeightGridView(
                  rowCrossAxisAlignment: CrossAxisAlignment.start,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 4,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 0,
                  itemCount: listMenuHome.length,
                  builder: (context, index) {
                    if(index < 4) {
                      return InkWell(
                        onTap: () {
                          /// On TAP
                        },
                        child: MenuButtonWidget(
                          menuHomeModel: listMenuHome[index],
                        ),
                      );
                    } else {
                      return Container(color: Colors.blue,);
                    }
                  },
                ),
              ),
            ],
          )) : Container(),
      panel: (isPanel == true)
          ? Stack(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(top: heightScreen * 0,),
                  padding: EdgeInsets.only(top: widthScreen * 0.05),
                  height: heightScreen * 0.9,
                  width: widthScreen,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))
                  ),
                  child: Container(
                    alignment: Alignment.topCenter,
                    margin: EdgeInsets.only(left: widthScreen * 0.03,right: widthScreen * 0.03,),
                    child: DynamicHeightGridView(
                      rowCrossAxisAlignment: CrossAxisAlignment.start,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 4,
                      mainAxisSpacing: 20,
                      itemCount: listMenuHome.length,
                      builder: (context, index) {
                        return Align(
                          alignment: Alignment.topLeft,
                          child: InkWell(
                            onTap: () {
                              /// On TAP
                            },
                            child: MenuButtonWidget(
                              menuHomeModel: listMenuHome[index],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: widthScreen * 0.35),
                child: Divider(
                  height: heightScreen * 0.01,
                  thickness: 4,
                  color: Colors.black,
                ),
              ),
            ],
          )
          : Container(),
      color: Colors.transparent,
      maxHeight: heightScreen * 0.9,
      boxShadow: [BoxShadow(color: Colors.transparent)],
    );

    ///Tidak dihapus karena sebagai bahan belajar kedepannya
    // return SizedBox.expand(
    //   child: DraggableScrollableSheet(
    //     initialChildSize: 0.3,
    //     minChildSize: 0.13,
    //     maxChildSize: 0.9,
    //     builder: (BuildContext context, ScrollController scrollController) {
    //       // print(scrollController.position.viewportDimension);
    //       // if(scrollController.position.viewportDimension > 270) {
    //       //   scrollController.position.animateTo(10, duration: const Duration(seconds: 2), curve: Curves.easeInOut,);
    //       // } else {
    //       //   scrollController.position.animateTo(0, duration: const Duration(seconds: 2), curve: Curves.easeInOut,);
    //       // }
    //       return SingleChildScrollView(
    //         controller: scrollController,
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: <Widget>[
    //             Container(
    //               width: widthScreen * 0.1,
    //               height: heightScreen * 0.005,
    //               decoration: BoxDecoration(
    //                   color: redDarkColor
    //               ),
    //             ),
    //             Container(
    //               padding: EdgeInsets.symmetric(
    //                   vertical: heightScreen * 0.01, horizontal: widthScreen * 0.08),
    //               width: widthScreen * 0.9,
    //               decoration: BoxDecoration(
    //                   color: Colors.white,
    //                   borderRadius: BorderRadius.circular(20),
    //                   boxShadow: [
    //                     BoxShadow(
    //                       color: Colors.grey.withOpacity(0.5),
    //                       spreadRadius: 1,
    //                       blurRadius: 1,
    //                       offset: Offset(0, 1),
    //                     )
    //                   ]),
    //               child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: <Widget>[
    //                   Column(
    //                     mainAxisAlignment: MainAxisAlignment.start,
    //                     children: <Widget>[
    //                       Container(
    //                         margin: EdgeInsets.only(bottom: 5),
    //                         width: widthScreen * 0.14,
    //                         height: heightScreen * 0.08,
    //                         decoration: BoxDecoration(
    //                             color: redDarkColor,
    //                             borderRadius: BorderRadius.circular(25)),
    //                         child: Center(
    //                           child: SizedBox.fromSize(
    //                             size: Size.fromRadius(widthScreen * 0.04),
    //                             child: FittedBox(
    //                               child: Icon(
    //                                 Icons.live_tv,
    //                                 color: Colors.white,
    //                               ),
    //                             ),
    //                           ),
    //                         ),
    //                       ),
    //                       AutoSizeText(
    //                         "Live Show",
    //                         minFontSize: 8,
    //                         style: TextStyle(fontSize: 11),
    //                       )
    //                     ],
    //                   ),
    //                   Column(
    //                     mainAxisAlignment: MainAxisAlignment.start,
    //                     children: <Widget>[
    //                       Container(
    //                         margin: EdgeInsets.only(bottom: 5),
    //                         width: widthScreen * 0.14,
    //                         height: heightScreen * 0.08,
    //                         decoration: BoxDecoration(
    //                             color: redDarkColor,
    //                             borderRadius: BorderRadius.circular(25)),
    //                         child: Center(
    //                           child: SizedBox.fromSize(
    //                             size: Size.fromRadius(widthScreen * 0.04),
    //                             child: FittedBox(
    //                               child: Icon(
    //                                 Icons.maps_home_work_outlined,
    //                                 color: Colors.white,
    //                               ),
    //                             ),
    //                           ),
    //                         ),
    //                       ),
    //                       AutoSizeText(
    //                         "Live Class",
    //                         minFontSize: 8,
    //                         style: TextStyle(fontSize: 11),
    //                       )
    //                     ],
    //                   ),
    //                   Column(
    //                     mainAxisAlignment: MainAxisAlignment.start,
    //                     children: <Widget>[
    //                       Container(
    //                         margin: EdgeInsets.only(bottom: 5),
    //                         width: widthScreen * 0.14,
    //                         height: heightScreen * 0.08,
    //                         decoration: BoxDecoration(
    //                             color: redDarkColor,
    //                             borderRadius: BorderRadius.circular(25)),
    //                         child: Center(
    //                           child: SizedBox.fromSize(
    //                             size: Size.fromRadius(widthScreen * 0.04),
    //                             child: FittedBox(
    //                               child: Icon(
    //                                 Icons.book,
    //                                 color: Colors.white,
    //                               ),
    //                             ),
    //                           ),
    //                         ),
    //                       ),
    //                       AutoSizeText(
    //                         "E-Course",
    //                         minFontSize: 8,
    //                         style: TextStyle(fontSize: 11),
    //                       )
    //                     ],
    //                   ),
    //                   Column(
    //                     mainAxisAlignment: MainAxisAlignment.start,
    //                     children: <Widget>[
    //                       Container(
    //                         margin: EdgeInsets.only(bottom: 5),
    //                         width: widthScreen * 0.14,
    //                         height: heightScreen * 0.08,
    //                         decoration: BoxDecoration(
    //                             color: redDarkColor,
    //                             borderRadius: BorderRadius.circular(25)),
    //                         child: Center(
    //                           child: SizedBox.fromSize(
    //                             size: Size.fromRadius(widthScreen * 0.04),
    //                             child: FittedBox(
    //                               child: Icon(
    //                                 Icons.people_alt_outlined,
    //                                 color: Colors.white,
    //                               ),
    //                             ),
    //                           ),
    //                         ),
    //                       ),
    //                       AutoSizeText(
    //                         "Community",
    //                         minFontSize: 8,
    //                         style: TextStyle(fontSize: 11),
    //                       )
    //                     ],
    //                   )
    //                 ],
    //               ),
    //             ),
    //           ],
    //         ),
    //       );
    //     },
    //   ),
    // );
  }
}
