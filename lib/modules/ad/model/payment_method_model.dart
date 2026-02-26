class PaymentMethodModel {
  final PaymentMethodType type;
  final String title;
  final String subtitle;
  final String? maskedNumber;
  final String? icon;
  final String? helperText;

  PaymentMethodModel({
    required this.type,
    required this.title,
    required this.subtitle,
    this.maskedNumber,
    this.icon,
    this.helperText,
  });
}

enum PaymentMethodType {
  card,
  upi,
  netBanking,
  wallet,
}

