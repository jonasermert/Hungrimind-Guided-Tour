import 'package:flutter/foundation.dart';
import 'package:guidedtour/core/utils/http/http_abstraction.dart';
import 'package:guidedtour/core/utils/http/http_interceptor.dart';
import 'package:guidedtour/config/route_config.dart';
import 'package:guidedtour/core/utils/locator.dart';
import 'package:guidedtour/core/utils/navigation/router_service.dart';
import 'package:guidedtour/core/utils/internal_notification/notify_service.dart';

final modules = [
  Module<RouterService>(
    builder: () => RouterService(routes: routes),
    lazy: false,
  ),
  Module<NotifyService>(builder: () => NotifyService(), lazy: false),
  Module<HttpAbstraction>(
    builder: () => HttpAbstraction(
      interceptors: [
        LoggingInterceptor(
          logBody: !kReleaseMode, // Only log bodies in debug mode
        ),
      ],
    ),
    lazy: true,
  ),
];
