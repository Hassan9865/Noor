import 'package:flutter/material.dart';
import 'package:noor/view/dua/dua_viewModel.dart';
import 'package:stacked/stacked.dart';

class DuaView extends StatelessWidget {
  const DuaView({super.key});

  @override
  Widget build(BuildContext context) {
    // final Txtsize = MediaQuery.of(context).size.width;
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => DuaViewmodel(),
      builder: (context, DuaViewmodel viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text("Dua", style: TextStyle(color: Colors.black)),
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

                double titleSize = isTablet ? 30 : 18;
                double arabicSize = isTablet ? 36 : 22;
                double meaningSize = isTablet ? 24 : 14;
                double buttonText = isTablet ? 18 : 14;
                double iconSize = isTablet ? 26 : 20;
                return SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    vertical: isTablet ? 30 : 20,
                    horizontal: isTablet ? 16 : 12,
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
                              padding: const EdgeInsets.all(20),
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
                                    viewModel.currentDua.name,
                                    style: TextStyle(
                                      fontSize: titleSize,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: isTablet ? 20 : 10),
                                  Text(
                                    viewModel.currentDua.dua,
                                    style: TextStyle(
                                      fontSize: arabicSize,
                                      color: Colors.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const Divider(),
                                  Text(
                                    viewModel.currentDua.meaning,
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
                          SizedBox(height: isTablet ? 40 : 20),
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
                                    horizontal: isTablet ? 20 : 12,
                                    vertical: isTablet ? 12 : 8,
                                  ),
                                ),
                                onPressed: () {
                                  viewModel.backDua();
                                },
                              ),
                              const SizedBox(width: 20),
                              ElevatedButton.icon(
                                icon: Icon(Icons.navigate_next, size: iconSize),
                                label: Text(
                                  "Next",
                                  style: TextStyle(fontSize: buttonText),
                                ),
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: isTablet ? 25 : 12,
                                    vertical: isTablet ? 12 : 8,
                                  ),
                                ),
                                onPressed: () {
                                  viewModel.nextDua();
                                },
                              ),
                            ],
                          ),
                          const Spacer(flex: 1),
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
