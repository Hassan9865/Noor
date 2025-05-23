import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'zakat_viewmodel.dart';

class ZakatView extends StatelessWidget {
  const ZakatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return ViewModelBuilder<ZakatViewModel>.reactive(
      viewModelBuilder: () => ZakatViewModel(),
      builder: (context, ZakatViewModel model, child) {
        return Scaffold(
          backgroundColor: Colors.teal[50],
          appBar: AppBar(
            title: const Text('Zakat Calculator'),
            actions: [
              IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: model.resetCalculator,
                tooltip: 'Reset Calculator',
              ),
            ],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInfoCard(
                  context,
                  title: 'Zakat Eligibility',
                  content:
                      'Zakat is obligatory on those who meet the Nisab threshold and have possessed the wealth for one lunar year.',
                ),
                const SizedBox(height: 24),
                _buildSectionTitle('Zakat Calculation Type'),
                _buildZakatTypeSelector(model),
                const SizedBox(height: 16),
                _buildSectionTitle('Current Gold Price (per gram)'),
                _buildGoldPriceInput(model),
                const SizedBox(height: 16),
                _buildSectionTitle('Your Assets'),
                _buildAssetInputs(model),
                const SizedBox(height: 24),
                _buildActionButtons(model),
                const SizedBox(height: 24),
                if (model.lastCalculationDate.isNotEmpty) ...[
                  _buildResultsSection(model, theme, isDarkMode),
                  const SizedBox(height: 16),
                  Text(
                    'Calculated on: ${model.lastCalculationDate}',
                    // style: theme.textTheme.caption,
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _buildInfoCard(
    BuildContext context, {
    required String title,
    required String content,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
      ),

      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            Text(content),
          ],
        ),
      ),
    );
  }

  Widget _buildZakatTypeSelector(ZakatViewModel model) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            RadioListTile<ZakatType>(
              title: const Text('All Assets (Gold, Silver, Cash, Savings)'),
              value: ZakatType.full,
              groupValue: model.zakatType,
              onChanged: model.updateZakatType,
              dense: true,
            ),
            RadioListTile<ZakatType>(
              title: const Text('Gold Only'),
              value: ZakatType.goldOnly,
              groupValue: model.zakatType,
              onChanged: model.updateZakatType,
              dense: true,
            ),
            RadioListTile<ZakatType>(
              title: const Text('Cash & Savings Only'),
              value: ZakatType.cashOnly,
              groupValue: model.zakatType,
              onChanged: model.updateZakatType,
              dense: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGoldPriceInput(ZakatViewModel model) {
    return TextField(
      controller: model.goldPriceController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Gold Price (per gram)',
        suffixText: 'PKR',
        prefixIcon: const Icon(Icons.monetization_on),
      ),
      onChanged: (_) => model.notifyListeners(),
    );
  }

  Widget _buildAssetInputs(ZakatViewModel model) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children:
              [
                    if (model.zakatType == ZakatType.full ||
                        model.zakatType == ZakatType.goldOnly)
                      _buildInputField(
                        controller: model.goldController,
                        label: 'Gold',
                        hint: 'Weight in grams',
                        icon: Icons.workspace_premium,
                        suffixText: 'grams',
                      ),
                    if (model.zakatType == ZakatType.full)
                      _buildInputField(
                        controller: model.silverController,
                        label: 'Silver',
                        hint: 'Value in PKR',
                        icon: Icons.money,
                        suffixText: 'PKR',
                      ),
                    if (model.zakatType == ZakatType.full ||
                        model.zakatType == ZakatType.cashOnly)
                      _buildInputField(
                        controller: model.cashController,
                        label: 'Cash',
                        hint: 'Amount in PKR',
                        icon: Icons.currency_exchange,
                        suffixText: 'PKR',
                      ),
                    if (model.zakatType == ZakatType.full ||
                        model.zakatType == ZakatType.cashOnly)
                      _buildInputField(
                        controller: model.savingsController,
                        label: 'Savings & Investments',
                        hint: 'Amount in PKR',
                        icon: Icons.account_balance,
                        suffixText: 'PKR',
                      ),
                    _buildInputField(
                      controller: model.debtsController,
                      label: 'Debts & Liabilities',
                      hint: 'Amount in PKR',
                      icon: Icons.credit_card,
                      suffixText: 'PKR',
                    ),
                  ]
                  .map(
                    (widget) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: widget,
                    ),
                  )
                  .toList(),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    String? suffixText,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: const OutlineInputBorder(),
        prefixIcon: Icon(icon),
        suffixText: suffixText,
      ),
    );
  }

  Widget _buildActionButtons(ZakatViewModel model) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            icon: const Icon(Icons.calculate),
            label: const Text('CALCULATE ZAKAT'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            onPressed: model.calculateZakat,
          ),
        ),
      ],
    );
  }

  Widget _buildResultsSection(
    ZakatViewModel model,
    ThemeData theme,
    bool isDarkMode,
  ) {
    return Card(
      color: isDarkMode ? Colors.grey[900] : Colors.grey[50],
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Zakat Calculation Results',
              // style: theme.textTheme.subtitle1?.copyWith(
              //   fontWeight: FontWeight.bold,
              // ),
            ),
            const SizedBox(height: 16),
            _buildResultRow(
              'Nisab Value:',
              '${model.nisabValue.toStringAsFixed(2)} PKR',
              theme,
            ),
            _buildResultRow(
              'Eligible for Zakat:',
              model.isEligible ? 'Yes' : 'No',
              theme,
              valueColor: model.isEligible ? Colors.green : Colors.red,
            ),
            const Divider(height: 32),
            _buildResultRow(
              'Zakat Amount (2.5%):',
              '${model.zakatAmount.toStringAsFixed(2)} PKR',
              theme,
              isTotal: true,
            ),
            if (model.isEligible) ...[
              const SizedBox(height: 16),
              Text(
                'Note: This is the minimum amount. You may give more as charity.',
                // style: theme.textTheme.caption,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildResultRow(
    String label,
    String value,
    ThemeData theme, {
    Color? valueColor,
    bool isTotal = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            // style: isTotal
            //     ? theme.textTheme.subtitle1?.copyWith(
            //         fontWeight: FontWeight.bold,
            //       )
            //     : theme.textTheme.bodyText1,
          ),
          Text(
            value,
            // style: (isTotal
            //     ? theme.textTheme.headline6?.copyWith(
            //         color: Colors.green,
            //         fontWeight: FontWeight.bold,
            //       )
            //     : theme.textTheme.bodyText1?.copyWith(
            //         color: valueColor,
            //       )),
          ),
        ],
      ),
    );
  }
}
