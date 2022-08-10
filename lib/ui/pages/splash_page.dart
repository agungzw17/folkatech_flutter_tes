part of 'pages.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    moveToLoginPage();
  }

  //Function for moving to HomePage in 3 seconds
  void moveToLoginPage() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              pageBuilder: (context, animation1, animation2) => HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Color of status bar
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          //Color of body or Background
          SafeArea(
              child: Container(
                color: Colors.white,
              )),
          //Content of body
          const SafeArea(
            child: Center(
              child: AutoSizeText(
                "Folkatech",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Colors.black,),
                minFontSize: 8,
              ),
            ),
          )
        ],
      ),
    );
  }
}
