class PaymentHistoryModel {
  final String icon;
  final String title;
  final String date;
  final double amount;
  final bool? isCredit;

  PaymentHistoryModel({
    required this.icon,
    required this.title,
    required this.date,
    required this.amount,
    this.isCredit,
  });
}
