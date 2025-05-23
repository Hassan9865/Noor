// import 'package:flutter/material.dart';
// import 'package:noor/model/zakat_calculatin.dart';

// class ZakatTypeSelector extends StatelessWidget {
//   final ZakatType selectedType;
//   final Function(ZakatType) onChanged;

//   const ZakatTypeSelector({
//     Key? key,
//     required this.selectedType,
//     required this.onChanged,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 2,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       child: Padding(
//         padding: const EdgeInsets.all(12),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Zakat Type',
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//             ),
//             const SizedBox(height: 10),
//             Row(
//               children:
//                   ZakatType.values.map((type) {
//                     final isSelected = selectedType == type;
//                     return Expanded(
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 4),
//                         child: ChoiceChip(
//                           label: Text(
//                             type == ZakatType.wealth
//                                 ? 'Wealth'
//                                 : type == ZakatType.agricultural
//                                 ? 'Agricultural'
//                                 : 'Business',
//                           ),
//                           selected: isSelected,
//                           onSelected: (_) => onChanged(type),
//                           selectedColor: Theme.of(context).colorScheme.primary,
//                           labelStyle: TextStyle(
//                             color: isSelected ? Colors.white : Colors.black,
//                           ),
//                         ),
//                       ),
//                     );
//                   }).toList(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
