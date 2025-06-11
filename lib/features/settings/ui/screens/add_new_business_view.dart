import 'package:flutter/material.dart';
import 'package:invoice_simple/core/theme/app_colors.dart';
import 'package:invoice_simple/core/widgets/cusotm_text_back_appbar.dart';
import 'package:invoice_simple/core/widgets/custom_scaffold.dart';
import 'package:invoice_simple/features/settings/ui/widgets/add_new_business_view_body.dart';

class AddNewBusinessView extends StatelessWidget {
  const AddNewBusinessView({super.key});
  static const String routeName = '/addNewBusiness';
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: AppColors.background,
      appBar: CusotmTextBackAppbar(title: "Business"),
      body: AddNewBusinessViewBody(),
    );
  }
}
