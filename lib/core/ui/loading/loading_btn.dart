import 'package:flutter/material.dart';
import 'package:rahtk_mobile/core/display/loading_states.dart';
import 'package:rahtk_mobile/core/ui/theme/colors.dart';

class RahtkLoadingButton extends StatelessWidget {
  const RahtkLoadingButton({
    super.key,
    required this.child,
    required this.loadingState,
    this.loaderColor = RahtkColors.tealColor,
  });

  final Widget child;
  final LoadingState loadingState;
  final Color loaderColor;

  @override
  Widget build(BuildContext context) {
    return loadingState is Loading
        ? Center(
            child: CircularProgressIndicator(
              color: loaderColor,
            ),
          )
        : child;
  }
}
