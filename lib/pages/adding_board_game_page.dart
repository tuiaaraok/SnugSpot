import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:game_control/core/drift/tables.dart';
import 'package:game_control/core/injactable/injectable.dart';
import 'package:game_control/data_sources/board_game_data_source.dart';
import 'package:game_control/pages/menu_page.dart';
import 'package:game_control/my_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class AddingBoardGamePage extends StatefulWidget {
  const AddingBoardGamePage({super.key});

  @override
  State<AddingBoardGamePage> createState() => _AddingBoardGamePageState();
}

class _AddingBoardGamePageState extends State<AddingBoardGamePage> {
  Uint8List? _image;
  TextEditingController nameController = TextEditingController();
  TextEditingController numberPeoplePlayController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  Future getLostData() async {
    XFile? picker = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picker == null) return;
    List<int> imageBytes = await picker.readAsBytes();
    _image = Uint8List.fromList(imageBytes);
    setState(() {});
  }

  final BoardGameDataSource _dataSource =
      BoardGameDataSource(getIt<AppDatabase>());
  Future<void> _submitForm() async {
    if (nameController.text.isNotEmpty &&
        numberPeoplePlayController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty &&
        _image != null) {
      try {
        final game = BoardGameCompanion.insert(
          name: nameController.text,
          description: descriptionController.text,
          numberCard: (numberPeoplePlayController.text),
          image: _image!,
        );

        await _dataSource.insertGame(game);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.paddingOf(context).top),
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Adding a club card",
                    style: GoogleFonts.jura(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                GestureDetector(
                  onTap: () {
                    getLostData();
                  },
                  child: Container(
                    width: 318.w,
                    height: 105.h,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        image: _image != null
                            ? DecorationImage(
                                image: MemoryImage(_image!), fit: BoxFit.fill)
                            : null,
                        borderRadius: BorderRadius.all(Radius.circular(20.r))),
                    child: _image == null
                        ? Center(
                            child: SvgPicture.asset(
                              "assets/default_image.svg",
                              width: 101.w,
                              height: 101.h,
                              fit: BoxFit.fill,
                            ),
                          )
                        : SizedBox.shrink(),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                MyTextField.textFieldForm(
                    "Name of the game", 318.w, nameController),
                SizedBox(
                  height: 20.h,
                ),
                MyTextField.textFieldForm("Number of People to Play", 318.w,
                    numberPeoplePlayController),
                SizedBox(
                  height: 20.h,
                ),
                MyTextField.descriptionTextFieldForm(
                    "Description", 318.w, descriptionController, FocusNode()),
                SizedBox(
                  height: 60.h,
                ),
                GestureDetector(
                  onTap: () {
                    _submitForm();
                  },
                  child: menuBtn(323.w, 61.h, "+Add"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
