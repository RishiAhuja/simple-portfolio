import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_portfolio/configs/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class BlogPostList extends StatelessWidget {
  final String title;
  final String link;

  const BlogPostList({
    super.key,
    required this.title,
    required this.link,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 10),
        Container(
          width: 6,
          height: 6,
          decoration: BoxDecoration(
            color: AppColors.quillGray,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
            child: GestureDetector(
          onTap: () async {
            if (!await launchUrl(Uri.parse(link))) {
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Could not launch $link'),
                    duration: const Duration(seconds: 2),
                  ),
                );
              }
              throw Exception('Could not launch $link');
            }
          },
          child: Text(
            title,
            style: GoogleFonts.ptMono(
              color: AppColors.quillGray,
              fontSize: 20,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.quillGray,
              decorationThickness: 1,
            ),
          ),
        )),
      ],
    );
  }
}
