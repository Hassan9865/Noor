// import 'package:flutter/material.dart';
// import 'package:noor/view/kalma/kalma_viewModel.dart';
// import 'package:stacked/stacked.dart';

// class KalmaView extends StatelessWidget {
//   const KalmaView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final Txtsize = MediaQuery.of(context).size.width;

//     return ViewModelBuilder.reactive(
//       viewModelBuilder: () => KalmaViewmodel(),
//       builder: (context, KalmaViewmodel viewModel, child) {
//         return Scaffold(
//           appBar: AppBar(
//             backgroundColor: Colors.white.withValues(),
//             title: const Text("Kalma"),
//             centerTitle: true,
//             elevation: 0,
//           ),
//           body: Container(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 // colors: [Colors.teal.shade800, Colors.teal.shade400],
//                 colors: [Colors.teal[50]!, Colors.blue[50]!],
//               ),
//             ),
//             child: ListView(
//               children: [
//                 Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       // Zikr Display
//                       Container(
//                         width: MediaQuery.of(context).size.width * 0.9,
//                         padding: const EdgeInsets.all(20),
//                         decoration: BoxDecoration(
//                           color: Colors.white.withValues(),
//                           border: Border.all(
//                             color: Colors.grey[400]!,
//                             width: 3,
//                           ),

//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: Column(
//                           children: [
//                             Text(
//                               viewModel.currentKalma.title,
//                               style: TextStyle(
//                                 fontSize: Txtsize * 0.05,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.grey,
//                               ),
//                               textAlign: TextAlign.center,
//                             ),
//                             const SizedBox(height: 10),
//                             Text(
//                               viewModel.currentKalma.arabic,
//                               style: TextStyle(
//                                 fontSize: Txtsize * 0.07,
//                                 color: Colors.black,
//                               ),
//                               textAlign: TextAlign.center,
//                             ),
//                             Divider(),
//                             Text(
//                               viewModel.currentKalma.meaning,
//                               style: TextStyle(
//                                 fontSize: Txtsize * 0.04,
//                                 color: Colors.black54,
//                               ),
//                               textAlign: TextAlign.center,
//                             ),
//                           ],
//                         ),
//                       ),

//                       const SizedBox(height: 40),

//                       // Buttons Row
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           // Reset Button
//                           ElevatedButton.icon(
//                             icon: const Icon(Icons.backpack, size: 20),
//                             label: const Text("Back"),
//                             style: ElevatedButton.styleFrom(
//                               // primary: Colors.red.shade400,
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 20,
//                                 vertical: 12,
//                               ),
//                             ),
//                             onPressed: () {
//                               viewModel.backkalma();
//                             },
//                           ),

//                           const SizedBox(width: 20),

//                           // Next Button
//                           ElevatedButton.icon(
//                             icon: const Icon(Icons.navigate_next, size: 20),
//                             label: const Text("Next"),
//                             style: ElevatedButton.styleFrom(
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 25,
//                                 vertical: 12,
//                               ),
//                             ),
//                             onPressed: () {
//                               viewModel.nextKalma();
//                             },
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

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
            title: const Text("Kalma", style: TextStyle(color: Colors.black)),
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
                return SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    vertical: 30,
                    horizontal: 16,
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
                              width: MediaQuery.of(context).size.width * 0.9,
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
                                    viewModel.currentKalma.title,
                                    style: TextStyle(
                                      fontSize: Txtsize * 0.05,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    viewModel.currentKalma.arabic,
                                    style: TextStyle(
                                      fontSize: Txtsize * 0.07,
                                      color: Colors.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const Divider(),
                                  Text(
                                    viewModel.currentKalma.meaning,
                                    style: TextStyle(
                                      fontSize: Txtsize * 0.04,
                                      color: Colors.black54,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton.icon(
                                icon: const Icon(Icons.arrow_back, size: 20),
                                label: const Text("Back"),
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 12,
                                  ),
                                ),
                                onPressed: () {
                                  viewModel.backkalma();
                                },
                              ),
                              const SizedBox(width: 20),
                              ElevatedButton.icon(
                                icon: const Icon(Icons.navigate_next, size: 20),
                                label: const Text("Next"),
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 25,
                                    vertical: 12,
                                  ),
                                ),
                                onPressed: () {
                                  viewModel.nextKalma();
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
