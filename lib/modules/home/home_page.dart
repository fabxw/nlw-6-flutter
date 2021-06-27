import 'package:flutter/material.dart';
import 'package:payflow/modules/home/home_controller.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = HomeController();

  final pages = [
    Container(color: Colors.amber),
    Container(color: Colors.pink),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[homeController.currentPage],
      appBar: PreferredSize(
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.background,
            gradient: RadialGradient(
              center: Alignment.bottomCenter,
              colors: [AppColors.backgroundGradient, AppColors.primary],
              radius: 1.15,
              stops: [0, 1],
            ),
          ),
          height: 152,
          child: Stack(children: [
            Center(
              child: ListTile(
                title: Text.rich(
                    TextSpan(
                      text: "Olá, ",
                      style: TextStyles.titleRegular,
                      children: [
                        TextSpan(
                            text: "Fab", style: TextStyles.titleBoldBackground),
                      ],
                    ),
                    style: TextStyles.titleRegular),
                subtitle: Text("Mantenha suas contas em dia",
                    style: TextStyles.captionBoldShape),
                trailing: Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
            ),
          ]),
        ),
        preferredSize: Size.fromHeight(152),
      ),
      bottomNavigationBar: Container(
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                homeController.setPage(0);
                setState(() {});
              },
              icon: Icon(Icons.home, color: AppColors.primary),
            ),
            InkWell(
              onTap: () {
                print("tap");
                Navigator.pushNamed(context, "/barcode_scanner");
              },
              child: Container(
                height: 56,
                width: 56,
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(5)),
                child: Container(
                  child:
                      Icon(Icons.add_box_outlined, color: AppColors.background),
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  homeController.setPage(1);
                  setState(() {});
                },
                icon: Icon(Icons.description_outlined)),
          ],
        ),
      ),
    );
  }
}
