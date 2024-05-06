import 'package:flutter/material.dart';
import 'package:rahtk_mobile/core/display/loading_states.dart';

class RahtkLoadingButton extends StatelessWidget {
  const RahtkLoadingButton({
    super.key,
    required this.child,
    required this.loadingState,
  });

  final Widget child;
  final LoadingState loadingState;

  @override
  Widget build(BuildContext context) {
    return loadingState is Loading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : child;
  }
}
