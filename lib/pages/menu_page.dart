import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_control/pages/available_games_page.dart';
import 'package:game_control/pages/cafe_club_cards_page.dart';
import 'package:game_control/pages/setting_page.dart';
import 'package:game_control/pages/table_reservations_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 321.h,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/menu.png",
                    ),
                    fit: BoxFit.fill)),
          ),
          SizedBox(
            height: 26.h,
          ),
          SizedBox(
            width: 324.w,
            height: 358.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              TableReservationsPage(
                                  totalTablesCount: Hive.box('settings')
                                      .get('tableCount', defaultValue: 0)),
                        ),
                      );
                    },
                    child: menuBtn(323.w, 76.h, "Table reservations")),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            const AvailableGamesPage(),
                      ),
                    );
                  },
                  child: menuBtn(323.w, 76.h, "List of board games"),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            const CafeClubCardsPage(),
                      ),
                    );
                  },
                  child: menuBtn(323.w, 76.h, "Cafe Club card"),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const SettingPage(),
                      ),
                    );
                  },
                  child: menuBtn(323.w, 76.h, "Settings"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget menuBtn(double width, double height, String description) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.r)),
        color: Color(0xFFE36036),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 4.h),
              blurRadius: 4.r,
              color: Colors.black.withValues(alpha: 0.25)),
        ]),
    child: Center(
      child: Text(
        description,
        style: GoogleFonts.jura(
            fontSize: 24.6.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white),
      ),
    ),
  );
}
