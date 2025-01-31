import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_portfolio/configs/app_colors.dart';

class BasicListItem extends StatelessWidget {
  final String text;
  const BasicListItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        Container(
          width: 5,
          height: 5,
          decoration: BoxDecoration(
            color: AppColors.quillGray,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: GoogleFonts.ptMono(
              color: AppColors.quillGray,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
