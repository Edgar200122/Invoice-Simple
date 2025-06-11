
import 'package:hive/hive.dart';
import 'package:invoice_simple/core/helpers/app_constants.dart';
import 'package:invoice_simple/features/dashboard/data/models/invoice_model.dart';

Future<void> updateInvoiceByNumber({
  required int invoiceNumber,
  required InvoiceModel updatedInvoice,
}) async {
  final box = await Hive.openBox<InvoiceModel>(AppConstants.hiveInvoiceBox);

  // دور على مفتاح الفاتورة بالرقم
  final invoiceKey = box.keys.firstWhere(
    (key) => box.get(key)?.invoiceNumber == invoiceNumber,
    orElse: () => null,
  );

  if (invoiceKey != null) {
    // احفظ التعديلات مكان الفاتورة القديمة
    await box.put(invoiceKey, updatedInvoice);
    print("✅ تم تعديل الفاتورة رقم $invoiceNumber بنجاح");
  } else {
    print("❌ لم يتم العثور على فاتورة بالرقم $invoiceNumber");
  }
}


Future<void> deleteInvoiceByNumber({
  required int invoiceNumber,
}) async {
  final box = await Hive.openBox<InvoiceModel>(AppConstants.hiveInvoiceBox);

  // ابحث عن مفتاح الفاتورة التي رقمها invoiceNumber
  final invoiceKey = box.keys.firstWhere(
    (key) => box.get(key)?.invoiceNumber == invoiceNumber,
    orElse: () => null,
  );

  if (invoiceKey != null) {
    // امسح الفاتورة باستخدام المفتاح
    await box.delete(invoiceKey);
    print("✅ تم حذف الفاتورة رقم $invoiceNumber بنجاح");
  } else {
    print("❌ لم يتم العثور على فاتورة بالرقم $invoiceNumber");
  }
}
