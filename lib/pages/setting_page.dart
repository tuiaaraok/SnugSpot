import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  late final Box _settingsBox;
  final TextEditingController _tablesController = TextEditingController();
  final FocusNode _tableNode = FocusNode();
  @override
  void initState() {
    super.initState();
    _settingsBox = Hive.box('settings');
    _loadTableCount();
  }

  void _loadTableCount() {
    final count = _settingsBox.get('tableCount', defaultValue: 0);
    _tablesController.text = count.toString();
  }

  void _saveTableCount(int count) {
    _settingsBox.put('tableCount', count);
  }

  void _incrementTables() {
    final current = int.tryParse(_tablesController.text) ?? 0;
    final newValue = current + 1;
    _tablesController.text = newValue.toString();
    _saveTableCount(newValue);
  }

  void _decrementTables() {
    final current = int.tryParse(_tablesController.text) ?? 0;
    if (current > 0) {
      final newValue = current - 1;
      _tablesController.text = newValue.toString();
      _saveTableCount(newValue);
    }
  }

  @override
  void dispose() {
    _tablesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: KeyboardActions(
        config: KeyboardActionsConfig(
          keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
          nextFocus: false,
          actions: [
            KeyboardActionsItem(focusNode: _tableNode),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.paddingOf(context).top),
          child: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Settings Title
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Settings",
                      style: GoogleFonts.jura(
                        fontSize: 26.sp,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF362C6A),
                      ),
                    ),
                  ),
                  SizedBox(height: 17.16.h),

                  // Gaming Tables Count Control
                  Container(
                    width: 360.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.r)),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Number of gaming tables",
                            style: GoogleFonts.jura(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF362C6A),
                            ),
                          ),
                          SizedBox(
                            width: 80.w,
                            child: TextField(
                              controller: _tablesController,
                              focusNode: _tableNode,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              textAlign: TextAlign.center,
                              style: GoogleFonts.jura(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF362C6A),
                              ),
                              onChanged: (value) {
                                final count = int.tryParse(value) ?? 0;
                                _saveTableCount(count);
                              },
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.zero,
                              ),
                            ),
                          ),
                          Flexible(
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: _incrementTables,
                                  child: SvgPicture.asset("assets/up.svg"),
                                ),
                                GestureDetector(
                                  onTap: _decrementTables,
                                  child: SvgPicture.asset("assets/down.svg"),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 46.h),

                  // Help Center Title
                  Text(
                    "Help center",
                    style: GoogleFonts.jura(
                      fontSize: 26.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF362C6A),
                    ),
                  ),
                  SizedBox(height: 17.h),

                  // Help Center Buttons
                  SizedBox(
                    height: 208.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: () async {
                              String? encodeQueryParameters(
                                Map<String, String> params,
                              ) {
                                return params.entries
                                    .map(
                                      (MapEntry<String, String> e) =>
                                          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}',
                                    )
                                    .join('&');
                              }

                              // ···
                              final Uri emailLaunchUri = Uri(
                                scheme: 'mailto',
                                path: 'com.SnugSpot.WV68Application',
                                query: encodeQueryParameters(<String, String>{
                                  '': '',
                                }),
                              );
                              try {
                                if (await canLaunchUrl(emailLaunchUri)) {
                                  await launchUrl(emailLaunchUri);
                                } else {
                                  throw Exception(
                                    "Could not launch $emailLaunchUri",
                                  );
                                }
                              } catch (e) {
                                log(
                                  'Error launching email client: $e',
                                ); // Log the error
                              }
                            },
                            child: _buildHelpButton("Contact Us")),
                        GestureDetector(
                            onTap: () async {
                              final Uri url = Uri.parse(
                                'https://docs.google.com/document/d/1FshNlTi-jgQUjH97pYc5NzJ5fMKq3y2sUsmpVOi9WSo/mobilebasic',
                              );
                              if (!await launchUrl(url)) {
                                throw Exception('Could not launch $url');
                              }
                            },
                            child: _buildHelpButton("Privacy Policy")),
                        GestureDetector(
                            onTap: () async {
                              await InAppReview.instance.openStoreListing(
                                appStoreId: '6749011014',
                              );
                            },
                            child: _buildHelpButton("Rate Us")),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 78.h,
                  ),
                  // Bottom Menu Image
                  Image.asset(
                    "assets/menu.png",
                    fit: BoxFit.fill,
                    width: double.infinity,
                    height: 321.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHelpButton(String title) {
    return Container(
      width: 360.w,
      height: 60.55.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: GoogleFonts.jura(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF362C6A),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 13.w,
              color: const Color(0xFF362C6A),
            ),
          ],
        ),
      ),
    );
  }
}
