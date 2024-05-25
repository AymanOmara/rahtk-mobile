class BasePaymentEntity {
  String holderName = "";
  String cardNumber = "";
  String expiryDate = "";
  String cvv = "";

  String secureCardNumber() {
    if (cardNumber.length < 12) {
      return cardNumber;
    }
    String firstSix = cardNumber.substring(0, 6);
    String lastFour = cardNumber.substring(cardNumber.length - 4);
    String maskedSection = '*' * (cardNumber.length - 10);
    return '$firstSix$maskedSection$lastFour';
  }

  BasePaymentEntity({
    this.holderName = "",
    this.cardNumber = "",
    this.expiryDate = "",
    this.cvv = "",
  });
}
