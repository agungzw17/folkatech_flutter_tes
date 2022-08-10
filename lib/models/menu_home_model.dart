part of 'models.dart';

class MenuHomeModel {
  String title;
  IconData iconData;
  Color backgroundColor;

  MenuHomeModel(
      {required this.title,
      required this.iconData,
      required this.backgroundColor});
}

List<MenuHomeModel> listMenuHome = [
  MenuHomeModel(
      backgroundColor: redDarkColor,
      iconData: Icons.live_tv,
      title: "Live Show"),
  MenuHomeModel(
      backgroundColor: redDarkColor,
      iconData: Icons.maps_home_work_outlined,
      title: "Live Class"),
  MenuHomeModel(
      backgroundColor: redDarkColor, iconData: Icons.book, title: "E-Course"),
  MenuHomeModel(
      backgroundColor: redDarkColor,
      iconData: Icons.people_alt_outlined,
      title: "Community"),
  MenuHomeModel(
      backgroundColor: Colors.blue,
      iconData: Icons.live_tv,
      title: "My Profile"),
  MenuHomeModel(
      backgroundColor: Colors.blue,
      iconData: Icons.maps_home_work_outlined,
      title: "Saved Course"),
  MenuHomeModel(
      backgroundColor: Colors.blue,
      iconData: Icons.book,
      title: "Recent Courses"),
  MenuHomeModel(
      backgroundColor: Colors.blue,
      iconData: Icons.people_alt_outlined,
      title: "My List"),
  MenuHomeModel(
      backgroundColor: Colors.green, iconData: Icons.live_tv, title: "My Cart"),
  MenuHomeModel(
      backgroundColor: Colors.green,
      iconData: Icons.maps_home_work_outlined,
      title: "Purchased History"),
  MenuHomeModel(
      backgroundColor: Colors.grey,
      iconData: Icons.book,
      title: "Market Place (Beta)"),
];
