import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_control/core/injactable/injectable.dart';
import 'package:game_control/data_sources/table_reservation_data_source.dart';
import 'package:game_control/pages/create_table_reservations_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:game_control/core/drift/tables.dart';

class TableReservationsPage extends StatefulWidget {
  final int totalTablesCount;

  const TableReservationsPage({
    super.key,
    required this.totalTablesCount,
  });

  @override
  State<TableReservationsPage> createState() => _TableReservationsPageState();
}

class _TableReservationsPageState extends State<TableReservationsPage> {
  late DateTime _selectedDate;
  late Stream<TableReservationWithFreeTable> _reservationsStream;
  final TableReservationDataSource _dataSource =
      TableReservationDataSource(getIt<AppDatabase>());
  @override
  void initState() {
    super.initState();
    // Initialize with date only (time set to 00:00:00)
    _selectedDate = DateTime.now().toDateOnly();
    _reservationsStream = _dataSource.getTableReservation(
      _selectedDate,
      widget.totalTablesCount,
    );
  }

  void _changeDate(int daysToAdd) {
    setState(() {
      // Create new date with time set to 00:00:00
      _selectedDate = _selectedDate.add(Duration(days: daysToAdd)).toDateOnly();
      _reservationsStream = _dataSource.getTableReservation(
        _selectedDate,
        widget.totalTablesCount,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildDateSelector(),
            SizedBox(height: 60.h),
            _buildTablesInfo(),
            SizedBox(height: 60.h),
            _buildReservationsList(),
          ],
        ),
      ),
      floatingActionButton: _buildAddButton(context),
    );
  }

  Widget _buildDateSelector() {
    final isToday = _selectedDate.isSameDate(DateTime.now());

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back_ios, size: 24.w),
          onPressed: () => _changeDate(-1),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 11.w),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
              isToday
                  ? DateFormat("'Today', dd'th' MMM").format(_selectedDate)
                  : DateFormat("yyyy, dd'th' MMM").format(_selectedDate),
              style: GoogleFonts.jura(
                fontSize: 28.sp,
                fontWeight: FontWeight.w700,
                height: 1,
              ),
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.arrow_forward_ios, size: 24.w),
          onPressed: () => _changeDate(1),
        ),
      ],
    );
  }

  // ... rest of the methods remain the same ...

  Widget _buildTablesInfo() {
    return StreamBuilder<TableReservationWithFreeTable>(
      stream: _reservationsStream,
      builder: (context, snapshot) {
        final freeTables =
            snapshot.data?.freeTableTables ?? widget.totalTablesCount;

        return SizedBox(
          width: 337.w,
          height: 105.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildTableInfoCard(
                "Gaming tables",
                widget.totalTablesCount.toString(),
                const Color(0xFFAF6B13),
              ),
              _buildTableInfoCard(
                "Free tables",
                freeTables.toString(),
                const Color(0xFFA4AF13),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTableInfoCard(String title, String count, Color color) {
    return Container(
      width: 160.w,
      height: 105.h,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 6.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              count,
              style: GoogleFonts.jura(
                fontSize: 60.sp,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                height: 1,
              ),
            ),
            Text(
              title,
              style: GoogleFonts.jura(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReservationsList() {
    return Expanded(
      child: Column(
        children: [
          Text(
            "Reserved tables",
            style: GoogleFonts.jura(
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 20.h),
          Expanded(
            child: StreamBuilder<TableReservationWithFreeTable>(
              stream: _reservationsStream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }

                final reservations = snapshot.data?.tableReservations ?? [];

                if (reservations.isEmpty) {
                  return Center(
                    child: Text(
                      'No reservations for this date',
                      style: GoogleFonts.jura(fontSize: 18.sp),
                    ),
                  );
                }

                return ListView.builder(
                  padding: EdgeInsets.only(bottom: 100.h), // Space for FAB
                  itemCount: reservations.length,
                  itemBuilder: (context, index) {
                    return _buildReservationItem(reservations[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReservationItem(TableReservation reservation) {
    return Padding(
      padding: EdgeInsets.only(bottom: 3.h),
      child: Center(
        child: Container(
          width: 383.w,
          height: 67.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
          ),
          child: IntrinsicHeight(
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 8.h, left: 10.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DateFormat('HH:mm').format(reservation.startTime),
                        style: GoogleFonts.jura(
                          fontSize: 32.sp,
                          fontWeight: FontWeight.w400,
                          height: 1,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        DateFormat('dd.MM.yy').format(reservation.date),
                        style: GoogleFonts.jura(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                          height: 1,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 18.w),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 270.w,
                        child: Text(
                          "${reservation.name} - ${reservation.numberOfPeople} people",
                          style: GoogleFonts.jura(
                            fontSize: 24.6.sp,
                            fontWeight: FontWeight.w400,
                            height: 1,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 270.w,
                        child: Text(
                          "Table No. ${reservation.numberTable} - ${reservation.description}",
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.jura(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            height: 1,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAddButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CreateTableReservationsPage(),
          ),
        );
      },
      child: Container(
        width: 100.w,
        height: 100.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0xFFE36036),
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
    );
  }
}

extension DateOnlyCompare on DateTime {
  DateTime toDateOnly() {
    return DateTime(year, month, day);
  }

  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}
