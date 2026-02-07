import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';

class EditProfileAvatar extends StatelessWidget {
  const EditProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: .center,
      crossAxisAlignment: .center,
      children: [
        Center(
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 8.r),
                child: SizedBox.square(
                  dimension: 100.r,
                  child: BlocBuilder<ImagePickerCubit, ImagePickerState>(
                    builder: (context, state) {
                      if (state.files.isNotEmpty) {
                        return Container(
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          clipBehavior: Clip.hardEdge,
                          child: Image.file(
                            state.files.first,
                            fit: BoxFit.cover,
                            //
                          ),
                        );
                      } else {
                        return CustomImageAvatar.network(
                          imageUrl: context.currentUser?.phone ?? '',
                          fit: BoxFit.cover,
                          placeHolderImage: AssetRoutes.defaultAvatarImagePath,
                          placeHolderFit: BoxFit.contain,
                        );
                      }
                    },
                  ),
                ),
              ),
              Positioned(
                bottom: 10.r,
                right: 0,
                child: Container(
                  padding: .all(AppSpacing.sm.r),
                  decoration: BoxDecoration(
                    color: context.customTheme.textInverse,
                    shape: BoxShape.circle,
                    boxShadow: [AppShadow.shadowX0Y5B10SR0],
                  ),
                  child: InkWell(
                    onTap: () async {
                      await DialogUtils.showImagePicker(
                        context: context,
                        imagePickerCubit: context.read<ImagePickerCubit>(),
                      );
                    },
                    splashFactory: NoSplash.splashFactory,
                    borderRadius: AppBorderRadius.chipBorderRadius,
                    child: Icon(Icons.camera, size: 16.r),
                  ),
                ),
              ),
              //
            ],
          ),
        ),
        AppGaps.gapH8,
        ParentTextWidget(
          'Change Picture',
          style: context.textTheme.bodySmall?.copyWith(
            fontWeight: AppFontWeight.regular,
            color: context.customTheme.textPrimary,
          ),
        ),
      ],
    );
  }
}
