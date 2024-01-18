import 'package:easy_localization/easy_localization.dart';

extension IntExtension on int? {
  String convertToVietnamesMoney() {
    final currencyFormatter = NumberFormat('#,##0.00', 'VI');
    String money = currencyFormatter.format(this);
    // Lấy độ dài của chuỗi
    int moneyLength = money.length;
    // Cắt bỏ 3 ký tự cuối cùng
    money = money.substring(0, moneyLength - 3);
    return money;
  }
}
