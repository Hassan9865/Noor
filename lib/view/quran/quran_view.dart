import 'package:flutter/material.dart';
import 'package:noor/view/quran/quran_viewModel.dart';
import 'package:stacked/stacked.dart';

class QuranView extends StatelessWidget {
  const QuranView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => QuranViewmodel(),
      builder: (context, QuranViewmodel viewModel, child) {
        return Scaffold();
      },
    );
  }
}
