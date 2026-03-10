import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noor/core/responsive/responsive.dart';
import 'package:noor/list/card_item.dart';
import 'package:noor/view/home/home_viewModel.dart';
import 'package:noor/view/home/widget/my_card.dart';
import 'package:noor/view/home/widget/drawer.dart';
import 'package:noor/view/quran/quran%20option/quran_option_view.dart';
import 'package:stacked/stacked.dart';
import 'package:intl/intl.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => HomeviewModel(),
      builder: (context, viewModel, child) {
        final currentDay = DateFormat('EEEE').format(DateTime.now());
        final Txtsize = MediaQuery.of(context).size.width;
        return Scaffold(
          drawer: const MyDrawer(),
          body: SafeArea(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.teal[50]!, Colors.blue[50]!],
                ),
                color: Colors.teal[50],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Builder(
                          builder:
                              (context) => IconButton(
                                icon: Icon(Icons.menu, size: Txtsize * 0.04),
                                onPressed: () {
                                  Scaffold.of(context).openDrawer();
                                },
                              ),
                        ),
                        Text(
                          currentDay,
                          style: TextStyle(
                            fontSize: Txtsize * 0.03,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Column(
                      children: [
                        Text(
                          "بِسْمِ اللهِ الرَّحْمَٰنِ الرَّحِيمِ",
                          style: TextStyle(
                            fontSize: Txtsize * 0.05,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[800],
                          ),
                        ),
                        SizedBox(height: 8.sp),
                        // Text(
                        //   "Advance Muslim App",
                        //   style: TextStyle(
                        //     fontSize: 18.sp,
                        //     fontWeight: FontWeight.w500,
                        //     color: Colors.green[800],
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: Responsive.isMobile(context) ? 2 : 4,
                        mainAxisSpacing: 12.0,
                        crossAxisSpacing: 12.0,
                        childAspectRatio: 1.1,
                      ),
                      padding: const EdgeInsets.all(16.0),
                      itemCount: cardItem.length,
                      itemBuilder: (context, index) {
                        return MyCard(
                          text: cardItem[index].title,
                          imagePath: cardItem[index].image,
                          onTap: () {
                            switch (index) {
                              case 0:
                                viewModel.navigateToPrayertime();
                                break;
                              case 1:
                                viewModel.navigateToHadeesview();
                              case 2:
                                viewModel.navigateToTasbhih();

                              case 3:
                                viewModel.navigateToDua();

                              case 4:
                                viewModel.navigateToQiblaview();

                              case 5:
                                // viewModel.navigateToSurahView();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => QuranOptionView(),
                                  ),
                                );

                              case 6:
                                viewModel.navigateToZakat();
                              case 7:
                                viewModel.navigateToKalma();
                                break;
                              // Add more cases
                            }
                          },
                        );
                      },
                    ),
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
