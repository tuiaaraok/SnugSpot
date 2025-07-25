import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_control/core/drift/tables.dart';
import 'package:game_control/core/injactable/injectable.dart';
import 'package:game_control/data_sources/board_game_data_source.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:game_control/pages/adding_board_game_page.dart';

class AvailableGamesPage extends StatefulWidget {
  const AvailableGamesPage({super.key});

  @override
  State<AvailableGamesPage> createState() => _AvailableGamesPageState();
}

class _AvailableGamesPageState extends State<AvailableGamesPage> {
  final BoardGameDataSource _dataSource =
      BoardGameDataSource(getIt<AppDatabase>());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.paddingOf(context).top),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Available Games",
                  style: GoogleFonts.jura(
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
              ),
              SizedBox(height: 50.h),
              Expanded(
                child: StreamBuilder<List<BoardGameData>>(
                  stream: _dataSource.getBoardGame(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.hasError) {
                      return Center(child: Text('Error loading games'));
                    }

                    final games = snapshot.data ?? [];

                    if (games.isEmpty) {
                      return Center(child: Text('No games available'));
                    }

                    return ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      itemCount: games.length,
                      itemBuilder: (context, index) {
                        final game = games[index];
                        return _buildGameCard(game);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddingBoardGamePage(),
            ),
          );
        },
        child: Container(
          width: 100.w,
          height: 100.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFE36036),
            boxShadow: [
              BoxShadow(
                offset: Offset(2.w, 4.h),
                blurRadius: 4.r,
                color: Colors.black.withValues(alpha: 0.25),
              ),
            ],
          ),
          child: Center(
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 55.w,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGameCard(BoardGameData game) {
    return Container(
      width: 364.w,
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12.r)),
      ),
      child: Row(
        children: [
          Container(
            width: 74.w,
            height: 74.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12.r)),
              // ignore: unnecessary_null_comparison
              image: game.image != null
                  ? DecorationImage(
                      image: MemoryImage(game.image), fit: BoxFit.cover)
                  : DecorationImage(image: AssetImage("assets/image_game.png")),
            ),
          ),
          SizedBox(width: 16.w),
          SizedBox(
            width: 259.w,
            height: 53.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    game.name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    game.description,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 19.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
