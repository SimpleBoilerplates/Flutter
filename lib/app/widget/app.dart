import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_boilerplate/shared/route/app_router.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
        ),
      ),
      routerConfig: router,
    );
  }

// @override
// Widget build(BuildContext context,WidgetRef ref) {
//   final goRouter = ref.watch(goRouterProvider);
//
//   return MaterialApp.router(
//     builder: (context, child) => ResponsiveWrapper.builder(
//         child,
//         maxWidth: 1200,
//         minWidth: 480,
//         defaultScale: true,
//         breakpoints: [
//           const ResponsiveBreakpoint.resize(480, name: MOBILE),
//           const ResponsiveBreakpoint.autoScale(800, name: TABLET),
//           const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
//           const ResponsiveBreakpoint.autoScale(1700, name: 'XL'),
//           const ResponsiveBreakpoint.autoScale(2460, name: '4K'),
//         ],
//         background: Container(color: const Color(0xFFF5F5F5)),),
//
//     theme: ThemeData(
//       visualDensity: VisualDensity.adaptivePlatformDensity,
//       appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
//       colorScheme: ColorScheme.fromSwatch(
//         accentColor: const Color(0xFF13B9FF),
//       ),
//     ),
//     routerConfig: goRouter,
//   );
// }
//
// @override
// Widget build(BuildContext context,WidgetRef ref) {
//   return MaterialApp(
//     builder: (context, child) => ResponsiveWrapper.builder(
//         child,
//         maxWidth: 1200,
//         minWidth: 480,
//         defaultScale: true,
//         breakpoints: [
//           const ResponsiveBreakpoint.resize(480, name: MOBILE),
//                     const ResponsiveBreakpoint.autoScale(800, name: TABLET),
//                     const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
//                     const ResponsiveBreakpoint.autoScale(1700, name: 'XL'),
//                     const ResponsiveBreakpoint.autoScale(2460, name: '4K'),
//         ],
//         background: Container(color: Color(0xFFF5F5F5))),
//    home: HomePage(),
//   );
// }
}
