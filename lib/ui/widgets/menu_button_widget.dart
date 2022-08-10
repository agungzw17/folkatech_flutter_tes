part of 'widgets.dart';

class MenuButtonWidget extends StatelessWidget {
  MenuButtonWidget(
      {Key? key, required this.menuHomeModel})
      : super(key: key);

  MenuHomeModel menuHomeModel;

  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: 5),
          width: widthScreen * 0.14,
          height: heightScreen * 0.08,
          decoration: BoxDecoration(
              color: menuHomeModel.backgroundColor, shape: BoxShape. circle,),
          child: Center(
            child: SizedBox.fromSize(
              size: Size.fromRadius(widthScreen * 0.04),
              child: FittedBox(
                child: Icon(
                  menuHomeModel.iconData,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Container(
          width: widthScreen * 0.2,
          child: AutoSizeText(
            menuHomeModel.title,
            textAlign: TextAlign.center,
            minFontSize: 8,
            style: TextStyle(fontSize: 11),
          ),
        )
      ],
    );
  }
}
