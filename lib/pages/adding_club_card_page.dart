import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_control/core/drift/tables.dart';
import 'package:game_control/core/injactable/injectable.dart';
import 'package:game_control/data_sources/club_card_data_source.dart';
import 'package:google_fonts/google_fonts.dart';

class AddingClubCardPage extends StatefulWidget {
  const AddingClubCardPage({super.key});

  @override
  State<AddingClubCardPage> createState() => _AddingClubCardPageState();
}

class _AddingClubCardPageState extends State<AddingClubCardPage> {
  final ClubCardDataSource _dataSource =
      ClubCardDataSource(getIt<AppDatabase>());
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _numberController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Text(
            "Add Club Card",
            style: GoogleFonts.jura(
                fontSize: 32.sp,
                fontWeight: FontWeight.w700,
                color: Colors.black),
          ),
        ),
        leading: SizedBox.shrink(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 24.h),
              Card(
                margin: EdgeInsets.only(bottom: 16.h),
                child: Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    children: [
                      _buildTextField("Card Number", _numberController,
                          isRequired: true),
                      SizedBox(height: 16.h),
                      _buildTextField("Name", _nameController,
                          isRequired: true),
                      SizedBox(height: 16.h),
                      _buildTextField("Phone Number", _phoneController,
                          isRequired: true),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              _buildAddButton(context),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      {bool isRequired = false, FocusNode? node, TextInputType? keyboardType}) {
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
        Flexible(
          child: TextField(
            // inputFormatters: inputFormatters,
            textAlign: TextAlign.end,
            focusNode: node,
            controller: controller,
            decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: '',
                hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                    fontSize: 22.sp)),
            keyboardType: keyboardType ?? TextInputType.text,
            cursorColor: Colors.black,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 22.sp),
            onChanged: (text) {
              // Additional functionality can be added here
            },
          ),
        ),
      ],
    );
  }

  Widget _buildAddButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _submitForm,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          backgroundColor: const Color(0xFFE36036),
        ),
        child: Text(
          "+Add",
          style: GoogleFonts.jura(
              fontSize: 24.6.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
      ),
    );
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      try {
        final card = CafeClubCardCompanion.insert(
          numberCard: _numberController.text,
          name: _nameController.text,
          phoneNumber: _phoneController.text,
        );

        await _dataSource.insertGame(card);
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
      } catch (e) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }
}
