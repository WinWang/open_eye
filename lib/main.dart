
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:open_eye/business/main_page/main_page.dart';
import 'package:open_eye/route/routes.dart';
import 'package:open_eye/utils/injection.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'base/pageWidget/common_stateful_widget.dart';
import 'constant/http_url.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initSDK();
  runApp(MyApp());
  // DoKit.runApp(app: DoKitApp( MyApp()));
}

///初始化SDK
Future<void> initSDK() async {
  SharedPreferences.setMockInitialValues({});
  await Injection().init();
}

class MyApp extends CommonStatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final MethodChannel _channel =
      const MethodChannel("com.flutter/method_channel");

  @override
  void initState() {
    super.initState();
    // _handlerRouteMethodChannel();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshConfiguration(
      footerTriggerDistance: 15,
      dragSpeedRatio: 0.91,
      headerBuilder: () => const MaterialClassicHeader(),
      footerBuilder: () => const ClassicFooter(),
      enableLoadingWhenNoData: false,
      enableRefreshVibrate: false,
      enableLoadMoreVibrate: false,
      shouldFooterFollowWhenNotFull: (state) {
        // If you want load more with noMoreData state ,may be you should return false
        return false;
      },
      child: ScreenUtilInit(
          designSize: const Size(750, 1334),
          builder: () => GetMaterialApp(
                getPages: AppRoutes.routerPages,
                defaultTransition: Transition.rightToLeft,
                transitionDuration: const Duration(milliseconds: 200),
                title: 'OpenEye',
                theme: ThemeData(
                  primarySwatch: Colors.red,
                ),
                // initialBinding: TestBinding(),
                // home: TestPage(),
                initialBinding: MainBinding(),
                home: const MainPage(),
                locale: const Locale('zh'),
              )),
    );
  }

  // void _handlerRouteMethodChannel() {
  //   _channel.setMethodCallHandler((call) async {
  //     var method = call.method;
  //     if (method == "changeRouter") {
  //       var arguments = call.arguments;
  //       var map = arguments as Map;
  //       var routePath = map["router"];
  //       _handleRouter(routePath);
  //       // LogD("<><><><><>${arguments.toString()}");
  //       // Get.toNamed(AppRoutes.DEFAULT_PAGE, arguments: arguments,preventDuplicates: false);
  //     }
  //   });
  // }
}
