import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:intl/intl.dart';

enum ZakatType { full, goldOnly, cashOnly }

class ZakatViewModel extends BaseViewModel {
  // Constants
  static const double defaultGoldPricePerGram = 12000.0;
  static const double nisabThreshold = 87.48; // Nisab in grams of gold

  // State
  ZakatType zakatType = ZakatType.full;
  double zakatAmount = 0.0;
  bool isEligible = false;
  double nisabValue = defaultGoldPricePerGram * nisabThreshold;
  String lastCalculationDate = '';

  // Controllers
  final TextEditingController goldController = TextEditingController();
  final TextEditingController silverController = TextEditingController();
  final TextEditingController cashController = TextEditingController();
  final TextEditingController savingsController = TextEditingController();
  final TextEditingController debtsController = TextEditingController();
  final TextEditingController goldPriceController = TextEditingController(
    text: defaultGoldPricePerGram.toStringAsFixed(2),
  );

  // Add this missing method
  updateZakatType(ZakatType? type) {
    if (type == null) return;
    zakatType = type;
    notifyListeners();
  }

  // Validation
  String? validateInput(String? value, String fieldName) {
    if (value == null || value.isEmpty) return null;
    final numValue = double.tryParse(value);
    if (numValue == null) return 'Invalid $fieldName amount';
    if (numValue < 0) return '$fieldName cannot be negative';
    return null;
  }

  // Calculations
  void calculateZakat() {
    // Validate all inputs
    final gold = double.tryParse(goldController.text) ?? 0;
    final silver = double.tryParse(silverController.text) ?? 0;
    final cash = double.tryParse(cashController.text) ?? 0;
    final savings = double.tryParse(savingsController.text) ?? 0;
    final debts = double.tryParse(debtsController.text) ?? 0;
    final currentGoldPrice =
        double.tryParse(goldPriceController.text) ?? defaultGoldPricePerGram;

    double totalAssets = 0;

    switch (zakatType) {
      case ZakatType.full:
        totalAssets = (gold * currentGoldPrice) + silver + cash + savings;
        break;
      case ZakatType.goldOnly:
        totalAssets = gold * currentGoldPrice;
        break;
      case ZakatType.cashOnly:
        totalAssets = cash + savings;
        break;
    }

    final netAssets = totalAssets - debts;
    nisabValue = currentGoldPrice * nisabThreshold;
    isEligible = netAssets >= nisabValue;
    zakatAmount = isEligible ? netAssets * 0.025 : 0;
    lastCalculationDate = DateFormat(
      'dd MMM yyyy, hh:mm a',
    ).format(DateTime.now());

    notifyListeners();
  }

  void resetCalculator() {
    goldController.clear();
    silverController.clear();
    cashController.clear();
    savingsController.clear();
    debtsController.clear();
    goldPriceController.text = defaultGoldPricePerGram.toStringAsFixed(2);
    zakatAmount = 0.0;
    isEligible = false;
    notifyListeners();
  }

  @override
  void dispose() {
    goldController.dispose();
    silverController.dispose();
    cashController.dispose();
    savingsController.dispose();
    debtsController.dispose();
    goldPriceController.dispose();
    super.dispose();
  }
}
