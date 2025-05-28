class Wallet {
  final int? walletId;
  final String? walletTitle;
  final double? walletBalance;
  final String? walletRemark;
  final int walletIconId;
  final String? walletMainColor;
  final int? isWalletTrackable;
  final String? walletTrackingEmail;

  Wallet({
    this.walletId,
    this.walletTitle,
    this.walletBalance,
    this.walletRemark,
    required this.walletIconId,
    this.walletMainColor,
    this.isWalletTrackable,
    this.walletTrackingEmail,
  });

  // Convert from Map (database) to Wallet object
  factory Wallet.fromMap(Map<String, dynamic> map) {
    return Wallet(
      walletId: map['wallet_id'],
      walletTitle: map['wallet_title'],
      walletBalance: map['wallet_balance']?.toDouble(),
      walletRemark: map['wallet_remark'],
      walletIconId: map['wallet_icon_id'],
      walletMainColor: map['wallet_main_color'],
      isWalletTrackable: map['is_wallet_trackable'],
      walletTrackingEmail: map['wallet_tracking_email'],
    );
  }

  // Convert Wallet object to Map (for database)
  Map<String, dynamic> toMap() {
    return {
      if (walletId != null) 'wallet_id': walletId,
      'wallet_title': walletTitle,
      'wallet_balance': walletBalance,
      'wallet_remark': walletRemark,
      'wallet_icon_id': walletIconId,
      'wallet_main_color': walletMainColor,
      'is_wallet_trackable': isWalletTrackable,
      'wallet_tracking_email': walletTrackingEmail,
    };
  }
}
