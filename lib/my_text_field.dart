import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextField {
  static Widget textFieldForm(String description, double widthContainer,
      TextEditingController myController,
      {FocusNode? myNode,
      TextInputType? keyboard,
      List<TextInputFormatter>? inputFormatters}) {
    return Column(
      children: [
        SizedBox(
          width: widthContainer,
          child: Text(
            description,
            style: GoogleFonts.jura(
                fontSize: 22.sp,
                color: Colors.black,
                fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          height: 58.h,
          width: widthContainer,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
              color: Colors.white),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Center(
              child: TextField(
                inputFormatters: inputFormatters,
                focusNode: myNode,
                controller: myController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: '',
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                        fontSize: 22.sp)),
                keyboardType: keyboard ?? TextInputType.text,
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
          ),
        ),
      ],
    );
  }

  static Widget textFieldCalendar(
      String description,
      double widthContainer,
      TextEditingController myController,
      bool isStartDate,
      VoidCallback onToggle,
      void Function(String) onChange) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 14.h, bottom: 8.h),
          child: SizedBox(
            width: widthContainer,
            child: Text(
              description,
              style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
        Container(
          height: 46.h,
          width: widthContainer,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(3.r)),
            border: Border.all(color: Color(0xFFDAE0E6), width: 2.w),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 8.h),
                    child: TextField(
                      controller: myController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: '',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                              fontSize: 14.sp)),
                      keyboardType: TextInputType.text,
                      cursorColor: Colors.black,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp),
                      onChanged: (text) {
                        onChange(text);
                      },
                    ),
                  ),
                ),
                GestureDetector(
                    onTap: onToggle,
                    child: Icon(
                      isStartDate
                          ? Icons.keyboard_arrow_down
                          : Icons.keyboard_arrow_up,
                      size: 20.w,
                    ))
              ],
            ),
          ),
        ),
      ],
    );
  }

  static Widget textFieldViewCategory(
      String description,
      double widthContainer,
      TextEditingController myController,
      bool isOpenMenuCategory,
      VoidCallback onToggle,
      List<String> categoryMenu,
      void Function(String) onTapMenuElem) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 14.h, bottom: 8.h),
          child: SizedBox(
            width: widthContainer,
            child: Text(
              description,
              style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
        Container(
          height: isOpenMenuCategory
              ? categoryMenu.isEmpty
                  ? 46.h
                  : null
              : 46.h,
          width: widthContainer,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(3.r)),
            border: Border.all(color: Color(0xFFDAE0E6), width: 2.w),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: isOpenMenuCategory
                ? Stack(
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: categoryMenu.map((toElement) {
                            return GestureDetector(
                              onTap: () {
                                onTapMenuElem(toElement);
                              },
                              child: Text(
                                toElement,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.sp),
                              ),
                            );
                          }).toList()),
                      Positioned(
                        right: 0.w,
                        top: 0.h,
                        child: GestureDetector(
                            onTap: onToggle,
                            child: Icon(
                              isOpenMenuCategory
                                  ? Icons.keyboard_arrow_down
                                  : Icons.keyboard_arrow_up,
                              size: 20.w,
                            )),
                      ),
                    ],
                  )
                : Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 8.h),
                          child: TextField(
                            controller: myController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                hintText: '',
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                    fontSize: 14.sp)),
                            keyboardType: TextInputType.text,
                            cursorColor: Colors.black,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp),
                            onChanged: (text) {},
                          ),
                        ),
                      ),
                      GestureDetector(
                          onTap: onToggle,
                          child: Icon(
                            isOpenMenuCategory
                                ? Icons.keyboard_arrow_down
                                : Icons.keyboard_arrow_up,
                            size: 20.w,
                          )),
                    ],
                  ),
          ),
        ),
      ],
    );
  }

  static Widget search(TextEditingController controller) {
    return Container(
      height: 56.h,
      width: 371.w,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20.r))),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: 'Enter card number or phone number',
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black.withValues(alpha: 0.57),
                        fontSize: 15.43.sp)),
                keyboardType: TextInputType.text,
                cursorColor: Colors.black,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 15.43.sp),
                onChanged: (text) {
                  // Additional functionality can be added here
                },
              ),
            ),
            Container(
                width: 38.13.w,
                height: 40.68,
                decoration: BoxDecoration(
                    color: Color(0xFFE36036),
                    borderRadius: BorderRadius.all(Radius.circular(10.r))),
                child:
                    Center(child: SvgPicture.asset("assets/icons/search.svg")))
          ],
        ),
      ),
    );
  }

  static Widget descriptionTextFieldForm(
      String description,
      double widthContainer,
      TextEditingController myController,
      FocusNode focus) {
    return Column(
      children: [
        SizedBox(
          width: widthContainer,
          child: Text(
            description,
            style: GoogleFonts.jura(
                fontSize: 22.sp,
                color: Colors.black,
                fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          height: 178.h,
          width: widthContainer,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
            color: Colors.white,
          ),
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: TextField(
                maxLines: null,
                focusNode: focus,
                controller: myController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: '',
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                        fontSize: 22.sp)),
                keyboardType: TextInputType.multiline,
                cursorColor: Colors.black,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 22.sp),
                onChanged: (text) {},
              )),
        ),
      ],
    );
  }
}
