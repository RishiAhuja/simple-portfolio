import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_portfolio/configs/app_colors.dart';
import 'package:simple_portfolio/extensions/get_mobile.dart';
import 'package:url_launcher/url_launcher.dart';

class SmallBasicContainer extends StatefulWidget {
  final String text;
  final String? clickLink;
  const SmallBasicContainer({super.key, required this.text, this.clickLink});

  @override
  State<SmallBasicContainer> createState() => _SmallBasicContainerState();
}

class _SmallBasicContainerState extends State<SmallBasicContainer> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: () async {
          if (widget.clickLink != null) {
            if (!await launchUrl(Uri.parse(widget.clickLink!))) {
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Could not launch ${widget.clickLink}'),
                    duration: const Duration(seconds: 2),
                  ),
                );
              }
              throw Exception('Could not launch ${widget.clickLink}');
            }
          }
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: isHovered ? AppColors.darkGrey : Colors.transparent,
            borderRadius: BorderRadius.circular(1),
            border: Border.all(
              color: isHovered ? AppColors.quillGray : AppColors.darkGrey,
            ),
          ),
          child: Text(
            widget.text,
            style: GoogleFonts.ptMono(
              color: AppColors.quillGray,
              fontSize: context.isMobile ? 16 : 20,
              decoration: widget.clickLink != null
                  ? TextDecoration.underline
                  : TextDecoration.none,
              decorationColor: AppColors.quillGray,
              decorationThickness: 1,
            ),
          ),
        ),
      ),
    );
  }
}
