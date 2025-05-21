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
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Zikr Display
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
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
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          viewModel.currentZikr.meaning,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Counter Circle
                  GestureDetector(
                    onTap: viewModel.incrementCounter,
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey[400]!, width: 3),
                      ),
                      child: Center(
                        child: Text(
                          viewModel.counter.toString(),
                          style: const TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: Colors.black38,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Buttons Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Reset Button
                      ElevatedButton.icon(
                        icon: const Icon(Icons.refresh, size: 20),
                        label: const Text("Reset"),
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
                        icon: const Icon(Icons.navigate_next, size: 20),
                        label: const Text("Next"),
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
              ),
            ),
          ),
        );
      },
    );
  }
}
