import 'package:flutter/material.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';

class ProfileParentTile extends StatelessWidget {
  final String title;
  final List<ProfileTile> children;
  const ProfileParentTile({
    super.key,
    required this.children,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ParentPaddingWidget(
      top: 0,
      bottom: 0,
      child: Column(
        mainAxisAlignment: .start,
        crossAxisAlignment: .start,
        children: [
          ParentTextWidget(
            title,
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: AppFontWeight.bold,
              color: context.customTheme.textPrimary,
            ),
          ),
          AppGaps.gapH12,
          ...children,
        ],
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool hasDivider;
  const ProfileTile({
    super.key,
    required this.title,
    required this.onTap,
    this.hasDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: .fromLTRB(
          AppSpacing.lg.r,
          AppSpacing.lg.r,
          AppSpacing.lg.r,
          !hasDivider ? AppSpacing.lg.r : 0,
        ),
        decoration: BoxDecoration(
          color: context.theme.cardTheme.color,
          //
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Expanded(
                  child: ParentTextWidget(
                    title,
                    style: context.textTheme.bodySmall?.copyWith(
                      fontWeight: AppFontWeight.medium,
                      color: context.customTheme.textPrimary,
                    ),
                  ),
                ),
                SvgViewer.fromAsset(
                  path: AssetRoutes.arrowForwardIosIconPath,
                  size: AppSpacing.xlg.r,
                  colorFilter: ColorFilter.mode(
                    context.customTheme.icon,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
            if (hasDivider) ...[
              AppGaps.gapH8,
              // AppGaps.gapH8,
              Divider(color: AppColors.borderDefault, height: 1),
            ],
          ],
        ),
      ),
    );
  }
}
