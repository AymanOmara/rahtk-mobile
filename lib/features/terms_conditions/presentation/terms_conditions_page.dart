import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahtk_mobile/core/ui/rahtk_navigation_bar.dart';

class TermsConditionsPage extends StatelessWidget {
  const TermsConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          RahtkNavigationBar(
            title: "terms_and_conditions".tr,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20,),
                    Text(
                      'terms_conditions_intro'.tr,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    _buildSectionTitle('definitions_title'.tr),
                    _buildSectionContent('definitions_content'.tr),
                    const SizedBox(height: 10),
                    _buildSectionTitle('user_account_title'.tr),
                    _buildSectionContent('user_account_content'.tr),
                    const SizedBox(height: 10),
                    _buildSectionTitle('eligibility_title'.tr),
                    _buildSectionContent('eligibility_content'.tr),
                    const SizedBox(height: 10),
                    _buildSectionTitle('user_conduct_title'.tr),
                    _buildSectionContent('user_conduct_content'.tr),
                    const SizedBox(height: 10),
                    _buildSectionTitle('transactions_title'.tr),
                    _buildSectionContent('transactions_content'.tr),
                    const SizedBox(height: 10),
                    _buildSectionTitle('returns_refunds_title'.tr),
                    _buildSectionContent('returns_refunds_content'.tr),
                    const SizedBox(height: 10),
                    _buildSectionTitle('intellectual_property_title'.tr),
                    _buildSectionContent('intellectual_property_content'.tr),
                    const SizedBox(height: 10),
                    _buildSectionTitle('limitation_liability_title'.tr),
                    _buildSectionContent('limitation_liability_content'.tr),
                    const SizedBox(height: 10),
                    _buildSectionTitle('indemnification_title'.tr),
                    _buildSectionContent('indemnification_content'.tr),
                    const SizedBox(height: 10),
                    _buildSectionTitle('modifications_title'.tr),
                    _buildSectionContent('modifications_content'.tr),
                    const SizedBox(height: 10),
                    _buildSectionTitle('termination_title'.tr),
                    _buildSectionContent('termination_content'.tr),
                    const SizedBox(height: 10),
                    _buildSectionTitle('governing_law_title'.tr),
                    _buildSectionContent('governing_law_content'.tr),
                    const SizedBox(height: 10),
                    _buildSectionTitle('contact_info_title'.tr),
                    _buildSectionContent('contact_info_content'.tr),
                    const SizedBox(height: 30,),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildSectionContent(String content) {
    return Text(
      content,
      style: const TextStyle(
        fontSize: 16,
      ),
    );
  }
}
