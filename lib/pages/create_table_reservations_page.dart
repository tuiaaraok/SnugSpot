import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_control/core/drift/tables.dart';
import 'package:game_control/core/injactable/injectable.dart';
import 'package:game_control/data_sources/table_reservation_data_source.dart';
import 'package:game_control/my_text_field.dart';
import 'package:game_control/pages/menu_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CreateTableReservationsPage extends StatefulWidget {
  const CreateTableReservationsPage({super.key});

  @override
  State<CreateTableReservationsPage> createState() =>
      _CreateTableReservationsPageState();
}

class _CreateTableReservationsPageState
    extends State<CreateTableReservationsPage> {
  final TableReservationDataSource tableReservationDataSource =
      TableReservationDataSource(getIt<AppDatabase>());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberOfController = TextEditingController();
  final TextEditingController tableController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController startController = TextEditingController();
  final TextEditingController endController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final _dateFormatter = MaskTextInputFormatter(
    mask: '##/##/##',
    filter: {"#": RegExp(r'[0-9]')},
  );

  final _timeFormatter = MaskTextInputFormatter(
    mask: '##:##',
    filter: {"#": RegExp(r'[0-9]')},
  );

  bool get isAdding =>
      nameController.text.isNotEmpty &&
      numberOfController.text.isNotEmpty &&
      int.tryParse(numberOfController.text) != null &&
      tableController.text.isNotEmpty &&
      int.tryParse(tableController.text) != null &&
      dateController.text.isNotEmpty &&
      _isValidDate(dateController.text) &&
      startController.text.isNotEmpty &&
      _isValidTime(startController.text) &&
      endController.text.isNotEmpty &&
      _isValidTime(endController.text) &&
      descriptionController.text.isNotEmpty;

  bool _isValidDate(String date) {
    try {
      DateFormat('dd/MM/yy').parseStrict(date);
      return true;
    } catch (_) {
      return false;
    }
  }

  bool _isValidTime(String time) {
    try {
      DateFormat('HH:mm').parseStrict(time);
      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    numberOfController.dispose();
    tableController.dispose();
    dateController.dispose();
    startController.dispose();
    endController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                _buildAppBar(context),
                SizedBox(height: 45.h),
                _buildForm(),
                SizedBox(height: 120.h),
                _buildBookButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Center(
        child: Text(
          "Table reservations",
          style: GoogleFonts.jura(
            fontSize: 32.sp,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return SizedBox(
      width: 318.w,
      child: Column(
        children: [
          MyTextField.textFieldForm("Guest's Name", 318.w, nameController),
          SizedBox(height: 16.h),
          MyTextField.textFieldForm(
            "Number of people",
            318.w,
            numberOfController,
            keyboard: TextInputType.number,
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyTextField.textFieldForm(
                "No. table",
                148.w,
                tableController,
                keyboard: TextInputType.number,
              ),
              MyTextField.textFieldForm(
                "Date",
                148.w,
                dateController,
                inputFormatters: [_dateFormatter],
                keyboard: TextInputType.datetime,
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyTextField.textFieldForm(
                "Start time",
                148.w,
                startController,
                inputFormatters: [_timeFormatter],
                keyboard: TextInputType.datetime,
              ),
              MyTextField.textFieldForm(
                "End time",
                148.w,
                endController,
                inputFormatters: [_timeFormatter],
                keyboard: TextInputType.datetime,
              ),
            ],
          ),
          SizedBox(height: 16.h),
          MyTextField.textFieldForm(
            "Description",
            318.w,
            descriptionController,
          ),
        ],
      ),
    );
  }

  Widget _buildBookButton() {
    return GestureDetector(
      onTap: () {
        if (isAdding) {
          _createReservation();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please fill all fields correctly')),
          );
        }
      },
      child: menuBtn(323.w, 76.h, "To book"),
    );
  }

  Future<void> _createReservation() async {
    try {
      final date = DateFormat('dd/MM/yy').parseStrict(dateController.text);
      final startTime = DateFormat('HH:mm').parseStrict(startController.text);
      final endTime = DateFormat('HH:mm').parseStrict(endController.text);

      final table = TableReservationsCompanion.insert(
        name: nameController.text,
        numberOfPeople: int.parse(numberOfController.text),
        numberTable: int.parse(tableController.text),
        date: date,
        startTime: DateTime(
          date.year,
          date.month,
          date.day,
          startTime.hour,
          startTime.minute,
        ),
        endTime: DateTime(
          date.year,
          date.month,
          date.day,
          endTime.hour,
          endTime.minute,
        ),
        description: descriptionController.text,
      );

      await tableReservationDataSource.insertTableReservation(table);
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }
}
