import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';

class ProfileInfoWidget extends StatelessWidget {
  const ProfileInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: context.isUnauthenticated
          ? LayoutBuilder(
              builder: (context, constraints) {
                return SizedBox.square(
                  dimension: constraints.maxWidth,
                  child: CustomImageAvatar.network(
                    placeHolderImage: AssetRoutes.defaultAvatarImagePath,
                    placeHolderFit: BoxFit.contain,
                    imageUrl: "${context.currentUser?.address}",
                  ),
                );
              },
            )
          : Row(
              crossAxisAlignment: .center,
              mainAxisAlignment: .start,
              children: [
                Center(
                  child: SizedBox.square(
                    dimension: 80.r,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        CustomImageAvatar.network(
                          // height: avatarSize,
                          // width: avatarSize,
                          height: 80.r,
                          width: 80.r,
                          imageUrl: "${context.currentUser?.address}",
                          placeHolderFit: BoxFit.contain,
                          placeHolderImage: AssetRoutes.defaultAvatarImagePath,
                        ),
                        Positioned(
                          bottom: 2.r,
                          right: 0,
                          child: Container(
                            padding: .all(6.r),
                            decoration: BoxDecoration(
                              color: context.customTheme.backgroundPrimary,
                              shape: BoxShape.circle,
                              boxShadow: AppShadow.shadow02,
                            ),
                            child: InkWell(
                              onTap: () {
                                context.pushNamed(Routes.editProfile.name);
                              },
                              splashFactory: NoSplash.splashFactory,
                              borderRadius: AppBorderRadius.chipBorderRadius,
                              child: Icon(
                                Icons.edit,
                                size: 16.r,
                                color: context.customTheme.icon,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                AppGaps.gapW16,
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: .start,
                    mainAxisAlignment: .center,
                    children: [
                      ParentTextWidget(
                        (context.currentUserFullName.isNullOrEmpty
                                ? AppConstants.defaultNullValue
                                : context.currentUserFullName ?? "")
                            .capitalize(),
                        style: context.textTheme.titleSmall?.copyWith(
                          fontWeight: AppFontWeight.bold,
                          color: context.customTheme.textPrimary,
                        ),
                      ),
                      AppGaps.gapH1,
                      ParentTextWidget(
                        (context.currentUser == null ||
                                context.currentUser!.phone.isNullOrEmpty)
                            ? AppConstants.defaultNullValue
                            : context.currentUser?.phone ?? "",

                        style: context.textTheme.bodySmall?.copyWith(
                          fontWeight: AppFontWeight.regular,
                          color: context.customTheme.textSecondary,
                        ),
                      ),
                      AppGaps.gapH1,
                      ParentTextWidget(
                        (context.currentUser == null ||
                                context.currentUser!.email.isNullOrEmpty)
                            ? AppConstants.defaultNullValue
                            : context.currentUser?.email ?? "",
                        style: context.textTheme.bodySmall?.copyWith(
                          fontWeight: AppFontWeight.regular,
                          color: context.customTheme.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
