import 'package:invoice_simple/features/dashboard/data/models/invoice_model.dart';
import 'package:invoice_simple/features/settings/data/model/item_model.dart';


double getInvoiceTotal(InvoiceModel invoice) {
  
  if(invoice.invoiceTotal != null ) {
  
    return invoice.invoiceTotal!;
  }else{
 
  
    
final invoiceCalculationResult = calculateInvoiceTotals(invoice.items);
    return invoiceCalculationResult.total;
  }
 
}
 



class InvoiceCalculationResult {
  final double subtotal;
  final double totalDiscount;
  final double totalTax;
  final double total;

  InvoiceCalculationResult({
    required this.subtotal,
    required this.totalDiscount,
    required this.totalTax,
    required this.total,
  });
}
InvoiceCalculationResult calculateInvoiceTotals(List<ItemModel> items) {

  double subtotal = 0;
  double totalDiscount = 0;
  double totalTax = 0;
   print("*********************************");
  for (final item in items) {   
      print("-------------------------------------");
    print("price ${item.unitPrice}");
print("quantity ${item.quantity}");  
    print("discount ${item.discount}");
    print("taxable ${item.taxableAmount}");
    print("-------------------------------------");
    final double price = item.unitPrice ?? 0; 
    final int qty = item.quantity ?? 0;

    final double amountBeforeDiscount = price * qty;

    final double discountPercent = item.discountActive ? (item.discount ?? 0) : 0;
    final double discountAmount = amountBeforeDiscount * (discountPercent / 100);

    final double amountAfterDiscount = amountBeforeDiscount - discountAmount;

    final double taxPercent = item.taxable ? (item.taxableAmount ?? 0) : 0;
    final double itemTax = amountAfterDiscount * (taxPercent / 100);

    subtotal += amountBeforeDiscount;
    totalDiscount += discountAmount;
    totalTax += itemTax;
  }

  final double total = subtotal - totalDiscount + totalTax;

  return InvoiceCalculationResult(
    subtotal: subtotal,
    totalDiscount: totalDiscount,
    totalTax: totalTax,
    total: total,
  );
}
