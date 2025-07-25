import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_control/core/injactable/injectable.dart';
import 'package:game_control/firebase_options.dart';
import 'package:game_control/pages/menu_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter();
  await Hive.openBox('settings');
  await Hive.openBox("privacyLink");
  await configureDependencies();
  final InAppReview inAppReview = InAppReview.instance;
  if (await inAppReview.isAvailable()) {
    Future.delayed(const Duration(seconds: 10), () {
      inAppReview.requestReview();
    });
  }
  await _initializeRemoteConfig().then((onValue) {
    runApp(MyApp(link: onValue));
  });
}

Future<String> _initializeRemoteConfig() async {
  final remoteConfig = FirebaseRemoteConfig.instance;

  String link = '';

  if (Hive.box("privacyLink").isEmpty) {
    await remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: const Duration(minutes: 1),
      ),
    );

    try {
      await remoteConfig.fetchAndActivate();
      link = remoteConfig.getString("link");
    } catch (e) {
      log("Failed to fetch remote config: $e");
    }
  } else {
    if (Hive.box("privacyLink").get('link').contains("showAgreebutton")) {
      await remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(minutes: 1),
          minimumFetchInterval: const Duration(minutes: 1),
        ),
      );

      try {
        await remoteConfig.fetchAndActivate().whenComplete(() {
          link = remoteConfig.getString("link");

          if (!link.contains("showAgreebutton") && link.isNotEmpty) {
            Hive.box("privacyLink").put('link', link);
          }
        });
      } catch (e) {
        log("Failed to fetch remote config: $e");
      }
    } else {
      link = Hive.box("privacyLink").get('link');
    }
  }

  return link == ""
      ? "https://telegra.ph/SnugSpot-Relax-Realm---Privacy-Policy-07-23?showAgreebutton"
      : link;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.link});
  final String link;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(402, 874),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: Color(0xFFC6C1DF),
            appBarTheme: const AppBarTheme(
                backgroundColor: Colors.transparent,
                systemOverlayStyle: SystemUiOverlayStyle.dark),
          ),
          home: Hive.box("privacyLink").isEmpty
              ? WebViewScreen(link: link)
              : Hive.box(
                  "privacyLink",
                ).get('link').contains("showAgreebutton")
                  ? const MenuPage()
                  : WebViewScreen(link: link),
        ));
  }
}

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({super.key, required this.link});
  final String link;

  @override
  State<WebViewScreen> createState() {
    return _WebViewScreenState();
  }
}

class _WebViewScreenState extends State<WebViewScreen> {
  bool loadAgree = false;
  WebViewController controller = WebViewController();
  final remoteConfig = FirebaseRemoteConfig.instance;

  @override
  void initState() {
    super.initState();

    _initializeWebView(widget.link); // Initialize WebViewController
  }

  void _initializeWebView(String url) {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            if (progress == 100) {
              loadAgree = true;
              setState(() {});
            }
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(url));
    setState(() {}); // Optional, if you want to trigger a rebuild elsewhere
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.paddingOf(context).top),
        child: Stack(
          children: [
            WebViewWidget(controller: controller),
            if (loadAgree) ...[
              if (widget.link.contains("showAgreebutton")) ...[
                GestureDetector(
                  onTap: () async {
                    await Hive.openBox('privacyLink').then((box) {
                      box.put('link', widget.link);
                      Navigator.push(
                        // ignore: use_build_context_synchronously
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => const MenuPage(),
                        ),
                      );
                    });
                  },
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Container(
                        width: 200,
                        height: 60,
                        color: Colors.amber,
                        child: const Center(child: Text("AGREE")),
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ],
        ),
      ),
    );
  }
}
