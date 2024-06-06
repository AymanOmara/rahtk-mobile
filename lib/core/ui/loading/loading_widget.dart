import 'package:domain/common/network/exceptions/network_exception.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahtk_mobile/core/display/loading_states.dart';
import 'package:rahtk_mobile/core/ui/theme/colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
    required this.loadingState,
    required this.successWidget,
    required this.onRetry,
    this.emptyMessage,
    this.emptyImagePath = "assets/images/empty.png",
  });

  final Widget successWidget;
  final LoadingState loadingState;
  final void Function() onRetry;
  final String? emptyMessage;
  final String emptyImagePath;

  @override
  Widget build(BuildContext context) {
    final isLoading = loadingState is Loading;
    final showSuccessWidget = loadingState is LoadingSuccess &&
            _isDataNotEmpty((loadingState as LoadingSuccess).data) ||
        (loadingState is Loading &&
            (loadingState as Loading).showSuccessWidget);
    final data = loadingState is LoadingSuccess
        ? (loadingState as LoadingSuccess).data
        : null;

    return Stack(
      children: [
        Visibility(
          visible: showSuccessWidget,
          child: IgnorePointer(ignoring: isLoading, child: successWidget),
        ),
        if (isLoading) ...[
          const Center(
            child: CircularProgressIndicator(color: RahtkColors.tealColor),
          ),
        ],
        if (loadingState is LoadingSuccess && !_isDataNotEmpty(data))
          Center(
            child: _handleSuccessWidget(data),
          ),
        if (loadingState is LoadingException)
          _buildErrorWidget((loadingState as LoadingException).exception),
      ],
    );
  }

  bool _isDataNotEmpty(dynamic data) {
    if (data == null) {
      return false;
    }
    if (data is List && data.isEmpty) {
      return false;
    }
    return true;
  }

  Widget _handleSuccessWidget(dynamic data) {
    return const EmptyWidget();
  }

  Widget _buildErrorWidget(NetworkException exception) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(exception.message),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () => onRetry(),
          child: Text(
            "re_try".tr,
          ),
        ),
      ],
    );
  }
}

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "no_data_found".tr,
        ),
      ],
    );
  }
}