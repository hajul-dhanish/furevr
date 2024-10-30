// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:furevr/theme/color_palette.dart';

// class CategoryItem extends StatelessWidget {
//   const CategoryItem({
//     super.key,
//     required this.data,
//     this.selected = false,
//     this.onTap,
//   });

//   final data;
//   final bool selected;
//   final GestureTapCallback? onTap;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 500),
//         curve: Curves.fastOutSlowIn,
//         padding: const EdgeInsets.fromLTRB(5, 20, 5, 0),
//         margin: const EdgeInsets.only(right: 10),
//         width: 90,
//         height: 90,
//         decoration: BoxDecoration(
//           color: selected ? ColorPalette.secondary : ColorPalette.cardColor,
//           borderRadius: BorderRadius.circular(10),
//           boxShadow: [
//             BoxShadow(
//               color: ColorPalette.shadowColor.withOpacity(0.1),
//               spreadRadius: .5,
//               blurRadius: .5,
//               offset: const Offset(0, 1), // changes position of shadow
//             ),
//           ],
//         ),
//         child: Column(
//           children: [
//             SvgPicture.asset(
//               data["icon"],
//               width: 35,
//               height: 35,
//               color: selected ? Colors.white : Colors.black,
//             ),
//             const SizedBox(
//               height: 8,
//             ),
//             Expanded(
//               child: Text(
//                 data["name"],
//                 maxLines: 1,
//                 overflow: TextOverflow.ellipsis,
//                 style: TextStyle(
//                   fontSize: 13,
//                   fontWeight: FontWeight.w500,
//                   color: selected ? ColorPalette.white : ColorPalette.primary,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
