class EPricingCalculator {
  /* ----------------------------------------------------------------------- */

  //! Tính toán tổng giá dựa trên thuế và phí vận chuyển
  static double calculateTotalPrice(double productPrice, String location) {
    // Lấy tỉ lệ thuế theo khu vực
    double taxRate = getTaxRateForLocation(location);
    // Tính tổng số tiền thuế
    double taxAmount = productPrice * taxRate;

    // Lấy phí ship theo khu vực
    double shippingCost = getShippingCost(location);

    // Tính tổng giá tiền sản phẩm
    double totalPrice = productPrice + taxAmount + shippingCost;
    return totalPrice;
  }

  //! Tính riêng phí vận chuyển
  static String calculateShippingCost(double productPrice, String location) {
    // Lấy phí ship theo khu vực
    double shippingCost = getShippingCost(location);

    return shippingCost.toStringAsFixed(2);
  }

  //! Tính riêng tiền thuế
  static String calculateTax(double productPrice, String location) {
    // Lấy tỉ lệ thuế theo khu vực
    double taxRate = getTaxRateForLocation(location);
    // Tính tổng số tiền thuế
    double taxAmount = productPrice * taxRate;

    return taxAmount.toStringAsFixed(2);
  }

  /* ----------------------------------------------------------------------- */

  // Tra cứu tỉ lệ thuế theo khu vực
  static double getTaxRateForLocation(String location) {
    // Lookup the tax rate for the given location from a tax rate database or API
    // Return the appropriate tax rate
    // Example tax rate of 10%
    return 0.10;
  }

  // Tra cứu phí ship theo khu vực
  static double getShippingCost(String location) {
    // Lookup the shipping cost for the given location using a shipping rate API
    // Calculate the shipping cost based on various factors like distance, weight, etc...
    // Example shipping cost of $5
    return 5.0;
  }

  /* ----------------------------------------------------------------------- */
}
