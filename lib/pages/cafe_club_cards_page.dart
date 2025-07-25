import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_control/core/drift/tables.dart';
import 'package:game_control/core/injactable/injectable.dart';
import 'package:game_control/data_sources/club_card_data_source.dart';
import 'package:game_control/my_text_field.dart';
import 'package:game_control/pages/adding_club_card_page.dart';
import 'package:google_fonts/google_fonts.dart';

class CafeClubCardsPage extends StatefulWidget {
  const CafeClubCardsPage({super.key});

  @override
  State<CafeClubCardsPage> createState() => _CafeClubCardsPageState();
}

class _CafeClubCardsPageState extends State<CafeClubCardsPage> {
  final ClubCardDataSource _dataSource =
      ClubCardDataSource(getIt<AppDatabase>());
  final TextEditingController _searchController = TextEditingController();
  late Stream<List<CafeClubCardData>> _clubCardsStream;

  @override
  void initState() {
    super.initState();
    _clubCardsStream = _dataSource.getClubCard();
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    final query = _searchController.text.trim();
    if (query.isEmpty) {
      _clubCardsStream = _dataSource.getClubCard();
    } else {
      _clubCardsStream = _dataSource.searchClubCards(query);
    }
    setState(() {});
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(height: 16.h),
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: _buildHeader()),
              SizedBox(height: 25.h),
              _buildSearchField(),
              SizedBox(height: 25.h),
              Expanded(child: _buildClubCardsList()),
            ],
          ),
        ),
      ),
      floatingActionButton: _buildAddButton(context),
    );
  }

  Widget _buildHeader() {
    return Text(
      "Cafe Club Card",
      style: GoogleFonts.jura(
        fontSize: 32.sp,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
    );
  }

  Widget _buildSearchField() {
    return MyTextField.search(_searchController);
  }

  Widget _buildClubCardsList() {
    return StreamBuilder<List<CafeClubCardData>>(
      stream: _clubCardsStream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final cards = snapshot.data!;
        if (cards.isEmpty) {
          return Center(
            child: Text(
              'No club cards found',
              style: GoogleFonts.jura(fontSize: 18.sp),
            ),
          );
        }

        return ListView.builder(
          itemCount: cards.length,
          itemBuilder: (context, index) {
            return _buildClubCardItem(cards[index]);
          },
        );
      },
    );
  }

  Widget _buildClubCardItem(CafeClubCardData card) {
    return Card(
      margin: EdgeInsets.only(bottom: 16.h),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            _buildInfoRow("Number", card.numberCard),
            SizedBox(height: 8.h),
            _buildInfoRow("Name", card.name),
            SizedBox(height: 8.h),
            _buildInfoRow("Phone", card.phoneNumber),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildAddButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AddingClubCardPage()),
        );
      },
      backgroundColor: const Color(0xFFE36036),
      child: Icon(Icons.add, size: 32.w, color: Colors.white),
    );
  }
}
