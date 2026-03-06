import 'package:flutter/material.dart';
import 'package:noor/view/kalma/kalma_viewModel.dart';
import 'package:stacked/stacked.dart';

class KalmaView extends StatelessWidget {
  const KalmaView({super.key});

  @override
  Widget build(BuildContext context) {
    final Txtsize = MediaQuery.of(context).size.width;

    return ViewModelBuilder.reactive(
      viewModelBuilder: () => KalmaViewmodel(),
      builder: (context, KalmaViewmodel viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text(
              "Kalma",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
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

                double titleSize = isTablet ? 26 : 18;
                double arabicSize = isTablet ? 32 : 22;
                double meaningSize = isTablet ? 20 : 14;
                double buttonText = isTablet ? 18 : 14;
                double iconSize = isTablet ? 26 : 20;

                return SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    vertical: isTablet ? 40 : 30,
                    horizontal: isTablet ? 40 : 16,
                  ),

                  scrollDirection: Axis.vertical,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        children: [
                          const Spacer(flex: 1),
                          Center(
                            child: Container(
                              width: cardWidth,
                              padding: EdgeInsets.all(isTablet ? 30 : 20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.grey[400]!,
                                  width: 3,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    viewModel.currentKalma.title,
                                    style: TextStyle(
                                      fontSize: titleSize,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: isTablet ? 20 : 10),
                                  Text(
                                    viewModel.currentKalma.arabic,
                                    style: TextStyle(
                                      fontSize: arabicSize,
                                      color: Colors.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const Divider(),
                                  Text(
                                    viewModel.currentKalma.meaning,
                                    style: TextStyle(
                                      fontSize: meaningSize,
                                      color: Colors.black54,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: isTablet ? 60 : 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton.icon(
                                icon: Icon(Icons.arrow_back, size: iconSize),
                                label: Text(
                                  "Back",
                                  style: TextStyle(fontSize: buttonText),
                                ),
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: isTablet ? 30 : 20,
                                    vertical: isTablet ? 16 : 12,
                                  ),
                                ),
                                onPressed: () {
                                  viewModel.backkalma();
                                },
                              ),
                              SizedBox(width: isTablet ? 40 : 20),
                              ElevatedButton.icon(
                                icon: Icon(Icons.navigate_next, size: iconSize),
                                label: Text(
                                  "Next",
                                  style: TextStyle(fontSize: buttonText),
                                ),
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: isTablet ? 35 : 25,
                                    vertical: isTablet ? 16 : 12,
                                  ),
                                ),
                                onPressed: () {
                                  viewModel.nextKalma();
                                },
                              ),
                            ],
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
