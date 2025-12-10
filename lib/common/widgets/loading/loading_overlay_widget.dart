// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:loader_overlay/loader_overlay.dart';
// import 'package:q_bank/common/common.dart';
// import 'package:q_bank/core/utils/utils.dart';

// class LoadingOverlayWidget extends StatelessWidget {
//   final Widget child;
//   const LoadingOverlayWidget({super.key, required this.child});

//   @override
//   Widget build(BuildContext context) {
//     return GlobalLoaderOverlay(
//       closeOnBackButton: false,
//       overlayColor: Colors.transparent,
//       overlayWholeScreen: false,
//       child: child,
//     );
//   }
// }

// extension ContextX on BuildContext {
//   void showPopupLoading({String? message}) => loaderOverlay.show(
//     showOverlay: true,
//     widgetBuilder: (progress) {
//       return BackdropFilter(
//         filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
//         child: Center(
//           child: Container(
//             padding: EdgeInsets.all(24.adaptSize),
//             constraints: BoxConstraints(
//               minHeight: 150.adaptSize,
//               minWidth: 150.adaptSize,
//             ),
//             decoration: BoxDecoration(
//               color: const Color(0xFFD6D4D4),
//               borderRadius: BorderRadius.circular(16.adaptSize),
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 InkDrop(size: 30.adaptSize, color: const Color(0xFF1F1F1F)),
//                 gapH24,
//                 Text(
//                   message ?? 'Loading...',
//                   textAlign: TextAlign.center,
//                   style: textTheme.bodyMedium?.copyWith(
//                     fontWeight: AppFontWeight.semiBold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//     },
//   );
//   void hidePopupLoading() {
//     return loaderOverlay.visible ? loaderOverlay.hide() : null;
//   }
// }
