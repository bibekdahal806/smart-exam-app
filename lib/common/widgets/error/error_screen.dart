import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';
import 'package:go_router/go_router.dart';

class ErrorScreen extends StatelessWidget {
  final String error;
  final String location;

  const ErrorScreen({super.key, required this.error, required this.location});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        showBackButton: true,
        showBackButtonColor: context.customTheme.textPrimary,

        title: ParentTextWidget(
          "Error",
          style: context.textTheme.bodyLarge!.copyWith(
            fontWeight: AppFontWeight.medium,
            color: context.customTheme.textPrimary,
          ),
        ),

        centerTitle: false,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.error, color: Colors.red, size: 60),
              SizedBox(height: 20),
              ParentTextWidget(
                'Navigation Error',
                style: context.textTheme.headlineSmall?.copyWith(
                  fontWeight: AppFontWeight.bold,
                  color: context.customTheme.textPrimary,
                ),
              ),
              SizedBox(height: 20),
              ParentTextWidget(
                'Error: $error',
                style: context.textTheme.bodyLarge?.copyWith(
                  color: context.customTheme.textPrimary,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              if (kDebugMode) ...[
                ParentTextWidget(
                  'Failed location: $location',
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: context.customTheme.textPrimary,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),
              ],
              ElevatedButton(
                onPressed: () {
                  // Navigate back
                  if (context.canPop()) {
                    context.pop();
                  }
                },
                child: Text('Go back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
