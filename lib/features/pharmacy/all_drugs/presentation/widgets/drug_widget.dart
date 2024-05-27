import 'package:cached_network_image/cached_network_image.dart';
import 'package:common/common.dart';
import 'package:domain/features/drugs/entity/drug_entity.dart';
import 'package:flutter/material.dart';
import 'package:rahtk_mobile/core/helper/constants.dart';
import 'package:rahtk_mobile/core/ui/theme/colors.dart';

class DrugWidget extends StatelessWidget {
  const DrugWidget({
    super.key,
    required this.drug,
  });

  final DrugEntity drug;

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          AppRoutes.drugDetails,
          arguments: drug,
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 5,
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          padding: const EdgeInsets.all(
            1,
          ),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: RahtkColors.lightGray,
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(
                  0.1,
                ),
                blurRadius: 6,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      20,
                    ),
                    topRight: Radius.circular(
                      20,
                    ),
                  ),
                ),
                child: CachedNetworkImage(
                  imageUrl: "${Common.baseUrl}${drug.image}",
                  width: 160,
                  height: 127,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Stack(
                    alignment: Alignment.center,
                    children: [
                      CircularProgressIndicator(),
                    ],
                  ),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 160,
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(
                    start: 10,
                    end: 5,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              drug.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
