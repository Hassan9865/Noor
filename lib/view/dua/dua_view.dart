import 'package:flutter/material.dart';
import 'package:noor/view/dua/dua_viewModel.dart';
import 'package:stacked/stacked.dart';

class DuaView extends StatelessWidget {
  const DuaView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => DuaViewmodel(),
      builder: (context, DuaViewmodel viewModel, child) {
        return Scaffold();
      },
    );
  }
}
