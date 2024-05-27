import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:rahtk_mobile/core/ui/loading/loading_widget.dart';
import 'package:rahtk_mobile/core/ui/rahtk_navigation_bar.dart';
import 'package:rahtk_mobile/features/pharmacy/all_drugs/business_logic/all_drugs_cubit.dart';
import 'package:rahtk_mobile/features/pharmacy/all_drugs/presentation/widgets/drug_widget.dart';

class AllDrugsPage extends StatelessWidget {
  const AllDrugsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AllDrugsCubit, AllDrugsState>(
      listener: (context, state) {},
      builder: (context, state) {
        AllDrugsCubit cubit = BlocProvider.of(context);
        return Scaffold(
          body: Column(
            children: [
              RahtkNavigationBar(
                title: "pharmacy".tr,
              ),
              Expanded(
                child: LoadingWidget(
                  loadingState: cubit.loadingState,
                  successWidget: SingleChildScrollView(
                    child: Wrap(
                      children:
                          cubit.drugs.map((e) => DrugWidget(drug: e)).toList(),
                    ),
                  ),
                  onRetry: () {
                    cubit.fetchDrugs();
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
