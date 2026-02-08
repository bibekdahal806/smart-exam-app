// import 'package:flutter/material.dart';
// import 'package:q_bank/common/common.dart';
// import 'package:q_bank/modules/exam/exam.dart';

// class ExamScreen extends StatefulWidget {
//   const ExamScreen({super.key});

//   @override
//   State<ExamScreen> createState() => _ExamScreenState();
// }

// class _ExamScreenState extends State<ExamScreen> {
//   final _formKey = GlobalKey<FormState>();
//   List<QuestionResult> _questionResults = [];
//   final List<Question> _initialData = [
//     Question(
//       question:
//           "The property of a conductor due to which it allows current to pass easily is called:",
//       isMandatory: true,
//       answerChoices: {
//         "Conductivity": null,
//         "Resistance": null,
//         "Insulation": null,
//         "Inductance": null,
//       },
//     ),

//     Question(
//       question: "Kirchhoff’s Current Law (KCL) is applicable to:",
//       isMandatory: true,
//       answerChoices: {
//         "Closed loop in a network": null,
//         "Electronic circuits only": null,
//         "Junctions in a network": null,
//         "Electric circuit": null,
//       },
//     ),

//     Question(
//       question: "Unit of electrical resistance is:",
//       isMandatory: true,
//       answerChoices: {"Ampere": null, "Volt": null, "Ohm": null, "Watt": null},
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBarWidget(showBackButton: true),
//       body: Form(
//         key: _formKey,
//         child: Survey(
//           onNext: (questionResults) {
//             _questionResults = questionResults;
//           },
//           initialData: _initialData,
//         ),
//       ),
//       // bottomNavigationBar: Column(
//       //   mainAxisSize: MainAxisSize.min,
//       //   children: [
//       //     SizedBox(
//       //       width: double.infinity,
//       //       height: 56,
//       //       child: TextButton(
//       //         style: TextButton.styleFrom(
//       //           foregroundColor: Colors.white,
//       //           backgroundColor: Colors.cyanAccent, // Background Color
//       //         ),
//       //         child: const Text("Validate"),
//       //         onPressed: () {
//       //           if (_formKey.currentState!.validate()) {
//       //             //do something
//       //           }
//       //         },
//       //       ),
//       //     ),
//       //   ],
//       // ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';

class ExamScreen extends StatelessWidget {
  const ExamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        showBackButton: false,
        title: ParentTextWidget(
          "Exams",
          style: context.textTheme.bodyMedium?.copyWith(
            fontWeight: AppFontWeight.medium,
            color: context.customTheme.textPrimary,
          ),
        ),
        centerTitle: false,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  elevation: 0.5,
                  child: Container(
                    padding: .symmetric(horizontal: 8.w, vertical: 8.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: .start,
                          crossAxisAlignment: .center,
                          children: [
                            Expanded(
                              child: ParentTextWidget(
                                "Title of the exam Title of the examTitle of of the exam Title of the exam Title of the exam Title of the examTitle of ",
                                showTooltip: true,
                                style: context.textTheme.titleSmall?.copyWith(
                                  fontWeight: AppFontWeight.semiBold,
                                  overflow: .ellipsis,
                                ),
                                maxLines: 2,
                              ),
                            ),
                            12.horizontalSpace,
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.bookmark_rounded,
                                color: context.colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                        4.verticalSpace,
                        Row(
                          mainAxisAlignment: .start,
                          crossAxisAlignment: .center,
                          children: [
                            CustomImageAvatar.network(
                              imageUrl: "imageUrl",
                              size: 30.r,
                              //
                            ),
                            12.horizontalSpace,
                            Expanded(
                              child: ParentTextWidget(
                                "Near professor name",
                                style: context.textTheme.bodyMedium?.copyWith(
                                  color: context.colorScheme.primary,
                                  fontWeight: AppFontWeight.semiBold,
                                  overflow: .ellipsis,
                                ),
                                maxLines: 1,
                              ),
                            ),
                            12.horizontalSpace,
                            ParentTextWidget(
                              "Published 112 days ago",
                              style: context.textTheme.labelSmall?.copyWith(
                                color: context.customTheme.textSecondary,
                                fontWeight: AppFontWeight.regular,
                                overflow: .ellipsis,
                              ),
                              maxLines: 1,
                            ),
                          ],
                        ),
                        8.verticalSpace,
                        Wrap(
                          spacing: 8.r,
                          runSpacing: 0.r,
                          children: [
                            Chip(
                              label: ParentTextWidget(
                                "NEA",
                                style: context.textTheme.labelMedium
                                    ?.copyWith(),
                              ),
                              padding: .symmetric(
                                horizontal: 8.w,
                                vertical: 0.h,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: AppBorderRadius.chipBorderRadius,
                              ),
                              visualDensity: .compact,
                              //
                            ),
                            Chip(
                              label: ParentTextWidget(
                                "NEA",
                                style: context.textTheme.labelMedium
                                    ?.copyWith(),
                              ),
                              padding: .symmetric(
                                horizontal: 8.w,
                                vertical: 0.h,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: AppBorderRadius.chipBorderRadius,
                              ),
                              visualDensity: .compact,
                              //
                            ),
                            Chip(
                              label: ParentTextWidget(
                                "NEA",
                                style: context.textTheme.labelMedium
                                    ?.copyWith(),
                              ),
                              padding: .symmetric(
                                horizontal: 8.w,
                                vertical: 0.h,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: AppBorderRadius.chipBorderRadius,
                              ),
                              visualDensity: .compact,
                              //
                            ),
                            Chip(
                              label: ParentTextWidget(
                                "NEA",
                                style: context.textTheme.labelMedium
                                    ?.copyWith(),
                              ),
                              padding: .symmetric(
                                horizontal: 8.w,
                                vertical: 0.h,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: AppBorderRadius.chipBorderRadius,
                              ),
                              visualDensity: .compact,
                              //
                            ),
                            Chip(
                              label: ParentTextWidget(
                                "NEA",
                                style: context.textTheme.labelMedium
                                    ?.copyWith(),
                              ),
                              padding: .symmetric(
                                horizontal: 8.w,
                                vertical: 0.h,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: AppBorderRadius.chipBorderRadius,
                              ),
                              visualDensity: .compact,
                              //
                            ),
                            Chip(
                              label: ParentTextWidget(
                                "NEA",
                                style: context.textTheme.labelMedium
                                    ?.copyWith(),
                              ),
                              padding: .symmetric(
                                horizontal: 8.w,
                                vertical: 0.h,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: AppBorderRadius.chipBorderRadius,
                              ),
                              visualDensity: .compact,
                              //
                            ),
                          ],
                        ),
                        8.verticalSpace,
                        Row(
                          mainAxisAlignment: .spaceBetween,
                          crossAxisAlignment: .center,
                          children: [
                            Row(
                              mainAxisSize: .min,
                              children: [
                                Icon(
                                  Icons.groups_rounded,
                                  color: context.colorScheme.primary,
                                  size: 24.r,
                                ),
                                4.horizontalSpace,
                                Column(
                                  children: [
                                    ParentTextWidget(
                                      "435",
                                      style: context.textTheme.bodyMedium
                                          ?.copyWith(
                                            overflow: .ellipsis,
                                            fontWeight: AppFontWeight.semiBold,
                                          ),
                                      maxLines: 1,
                                    ),
                                    ParentTextWidget(
                                      "Appeared",
                                      style: context.textTheme.labelMedium
                                          ?.copyWith(
                                            overflow: .ellipsis,
                                            fontWeight: AppFontWeight.regular,
                                          ),
                                      maxLines: 1,
                                    ),
                                  ],
                                ),
                              ],

                              //
                            ),
                            Row(
                              mainAxisSize: .min,
                              children: [
                                Icon(
                                  Icons.star_rounded,
                                  color: context.colorScheme.primary,
                                  size: 24.r,
                                ),
                                4.horizontalSpace,
                                Column(
                                  children: [
                                    ParentTextWidget(
                                      "4.5",
                                      style: context.textTheme.bodyMedium
                                          ?.copyWith(
                                            overflow: .ellipsis,
                                            fontWeight: AppFontWeight.semiBold,
                                          ),
                                      maxLines: 1,
                                    ),
                                    ParentTextWidget(
                                      "Rating",
                                      style: context.textTheme.labelMedium
                                          ?.copyWith(
                                            overflow: .ellipsis,
                                            fontWeight: AppFontWeight.regular,
                                          ),
                                      maxLines: 1,
                                    ),
                                  ],
                                ),
                              ],

                              //
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //
              //
              //
            ],
          ),
        ),

        //
      ),
    );
  }
}
