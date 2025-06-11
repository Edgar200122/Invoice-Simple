import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:invoice_simple/core/functions/get_invoice_total.dart';
import 'package:invoice_simple/core/theme/app_colors.dart';
import 'package:invoice_simple/core/theme/app_text_styles.dart';
import 'package:invoice_simple/features/dashboard/data/models/invoice_model.dart';
import 'package:invoice_simple/features/dashboard/ui/widgets/invoice_table_row.dart';

class InvoicePreviewViewBody extends StatelessWidget {
  const InvoicePreviewViewBody({super.key, required this.invoice});
  final InvoiceModel invoice;
  @override
  Widget build(BuildContext context) {
         final invoiceCalculationResult= calculateInvoiceTotals(invoice.items);
    final total =invoice.invoiceTotal?? invoiceCalculationResult.total;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 23),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      invoice.businessAccount.name,
                      style: AppTextStyles.poFont20BlackWh600.copyWith(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'INVOICE',
                        style: AppTextStyles.poFont20BlackWh600.copyWith(
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        "#${invoice.invoiceNumber.toString().padLeft(3, '0')}",
                        style: AppTextStyles.poFont20BlackWh400.copyWith(
                          color: AppColors.blueGrey,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Issued ${DateFormat('dd/MM/yyyy').format(invoice.issuedDate)}",
                        style: AppTextStyles.poFont20BlackWh400.copyWith(
                          color: AppColors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 32),
              // FROM - BILL TO
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "FROM",
                    style: AppTextStyles.poFont20BlackWh600.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "BILL TO",
                    style: AppTextStyles.poFont20BlackWh600.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    invoice.client.clientName,
                    style: AppTextStyles.poFont20BlackWh600.copyWith(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              // From name (business account name)
              Text(
                invoice.businessAccount.name,
                style: AppTextStyles.poFont20BlackWh600.copyWith(fontSize: 12),
              ),
              const SizedBox(height: 8),
              // Table header row
              InvoiceTableRow(
                backgroundColor: AppColors.extraLightGrey,
                height: 44,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        "Name",
                        style: AppTextStyles.poFont20BlackWh600.copyWith(
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "QTY",
                    style: AppTextStyles.poFont20BlackWh600.copyWith(
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    "Price, ${invoice.currency}",
                    style: AppTextStyles.poFont20BlackWh600.copyWith(
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    "Amount, ${invoice.currency}",
                    style: AppTextStyles.poFont20BlackWh600.copyWith(
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
              Column(
                children:
                    invoice.items.map((item) {
                      final qty = item.quantity ?? 0;
                      final price = item.unitPrice ?? 0.0;
                      final amount = qty * price;

                      return InvoiceTableRow(
                        height: 44,
                        showBottomBorder: true,
                        children: [
                          // اسم العنصر
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              item.name ?? '',
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.poFont20BlackWh400.copyWith(
                                fontSize: 10,
                              ),
                            ),
                          ),
                          // الكمية
                          Text(
                            qty.toString(),
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.poFont20BlackWh400.copyWith(
                              fontSize: 10,
                            ),
                          ),
                          // السعر
                          Text(
                            price.toStringAsFixed(2),
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.poFont20BlackWh400.copyWith(
                              fontSize: 10,
                            ),
                          ),
                          // المجموع = كمية * سعر
                          Text(
                            amount.toStringAsFixed(2),
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.poFont20BlackWh400.copyWith(
                              fontSize: 10,
                            ),
                          ),
                        ],
                      );
                    }).toList(),
              ),

              // Total Row
              Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 8,
                      ),
                      child: Text(
                        "Total",
                        style: AppTextStyles.poFont20BlackWh600.copyWith(
                          fontSize: 10.sp,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 8,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.white,

                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(2),
                        ),
                      ),
                      child: Text(
                        total.toStringAsFixed(2),
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.poFont20BlackWh600.copyWith(
                          fontSize: 10.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              if(invoice.imagePath != "" && invoice.imagePath.isNotEmpty)
              Align(
                alignment: Alignment.centerLeft,
                child:Image.file(
        File(invoice.imagePath),
        width:MediaQuery.of(context).size.width * 0.3,
      
        fit: BoxFit.cover,
      ) ,
              ),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}
