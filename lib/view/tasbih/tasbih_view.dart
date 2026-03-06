import 'package:flutter/material.dart';
import 'package:noor/view/tasbih/tasbih_viewModel.dart';
import 'package:stacked/stacked.dart';

class TasbihView extends StatelessWidget {
  const TasbihView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TasbihViewmodel>.reactive(
      viewModelBuilder: () => TasbihViewmodel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white.withValues(),
            title: const Text("Digital Tasbih"),
            centerTitle: true,

            elevation: 0,
          ),
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                // colors: [Colors.teal.shade800, Colors.teal.shade400],
                colors: [Colors.teal[50]!, Colors.blue[50]!],
              ),
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                bool isTablet = constraints.maxWidth >= 600;

                double cardWidth =
                    isTablet
                        ? constraints.maxWidth * 0.6
                        : constraints.maxWidth * 0.9;

                double arabicSize = isTablet ? 36 : 22;
                double meaningSize = isTablet ? 24 : 14;
                double buttonText = isTablet ? 18 : 14;
                double iconSize = isTablet ? 26 : 20;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Zikr Display
                    Container(
                      width: cardWidth,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(),
                        border: Border.all(color: Colors.grey[400]!, width: 3),

                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Text(
                            viewModel.currentZikr.arabic,
                            style: TextStyle(
                              fontSize: arabicSize,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            viewModel.currentZikr.meaning,
                            style: TextStyle(
                              fontSize: meaningSize,
                              color: Colors.black54,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: isTablet ? 40 : 20),

                    // Counter Circle
                    GestureDetector(
                      onTap: viewModel.incrementCounter,
                      child: Container(
                        width: isTablet ? 150 : 120,
                        height: isTablet ? 150 : 120,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.grey[400]!,
                            width: 3,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            viewModel.counter.toString(),
                            style: TextStyle(
                              fontSize: isTablet ? 48 : 36,
                              fontWeight: FontWeight.bold,
                              color: Colors.black38,
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: isTablet ? 40 : 20),

                    // Buttons Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Reset Button
                        ElevatedButton.icon(
                          icon: Icon(Icons.refresh, size: iconSize),
                          label: Text(
                            "Reset",
                            style: TextStyle(fontSize: buttonText),
                          ),
                          style: ElevatedButton.styleFrom(
                            // primary: Colors.red.shade400,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 12,
                            ),
                          ),
                          onPressed: viewModel.resetCounter,
                        ),

                        const SizedBox(width: 20),

                        // Next Button
                        ElevatedButton.icon(
                          icon: Icon(Icons.navigate_next, size: iconSize),
                          label: Text(
                            "Next",
                            style: TextStyle(fontSize: buttonText),
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 25,
                              vertical: 12,
                            ),
                          ),
                          onPressed: viewModel.nextZikr,
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
