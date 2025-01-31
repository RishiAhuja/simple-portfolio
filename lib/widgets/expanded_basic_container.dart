import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_portfolio/configs/app_colors.dart';

class ExpandedBasicContainer extends StatelessWidget {
  final String text;
  const ExpandedBasicContainer({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      margin: const EdgeInsets.symmetric(vertical: 6),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(1),
        border: Border.all(
          color: AppColors.darkGrey,
          width: 1,
        ),
      ),
      child: Text(
        text,
        style: GoogleFonts.ptMono(
          fontWeight: FontWeight.bold,
          color: AppColors.quillGray,
          fontSize: 25,
        ),
      ),
    );
  }
}
