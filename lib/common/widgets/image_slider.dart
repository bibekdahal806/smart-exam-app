import 'package:flutter/material.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';

class CustomImageSlider extends StatefulWidget {
  final List<String> sliderItems;
  final double? height;
  final double? width;
  final BoxFit boxFit;
  final String? placeHolderImage;
  final BoxFit? placeHolderFit;
  const CustomImageSlider({
    super.key,
    required this.sliderItems,
    this.height,
    this.width,
    this.boxFit = BoxFit.cover,
    this.placeHolderImage,
    this.placeHolderFit,
  });

  @override
  State<CustomImageSlider> createState() => _CustomImageSliderState();
}

class _CustomImageSliderState extends State<CustomImageSlider> {
  late PageController controller;
  var index = 1;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: Stack(
        children: [
          PageView.builder(
            controller: controller,
            physics: ClampingScrollPhysics(),
            itemCount: widget.sliderItems.length,
            onPageChanged: (value) {
              setState(() {
                index = (value + 1);
              });
              //
            },
            itemBuilder: (context, index) {
              return CustomCachedNetworkImage(
                imageUrl: widget.sliderItems[index],
                fit: widget.boxFit,
                height: widget.height,
                width: widget.width,
                placeHolderFit: widget.placeHolderFit,
                placeHolderImage: widget.placeHolderImage,
              );
            },
          ),
          Positioned(
            top: AppSpacing.md.h,
            right: AppSpacing.md.w,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.lg.w,
                vertical: AppSpacing.sm.h,
              ),
              decoration: BoxDecoration(
                color: context.customTheme.textPrimary.withAlphaOpacity(0.7),
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: ParentTextWidget(
                "$index/${widget.sliderItems.length}",
                style: context.textTheme.bodySmall?.copyWith(
                  fontWeight: AppFontWeight.bold,
                  color: context.customTheme.textPrimary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
