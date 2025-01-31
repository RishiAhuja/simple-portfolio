import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_portfolio/configs/app_colors.dart';
import 'package:timeago/timeago.dart' as timeago;

class ExperienceCard extends StatefulWidget {
  final String role;
  final String company;
  final String type;
  final DateTime startDate;
  final DateTime? endDate;
  final String location;
  final List<String>? responsibilities;

  const ExperienceCard({
    super.key,
    required this.role,
    required this.company,
    required this.type,
    required this.startDate,
    this.endDate,
    required this.location,
    this.responsibilities,
  });

  @override
  State<ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<ExperienceCard> {
  bool isHovered = false;

  String get duration {
    final now = DateTime.now();
    final end = widget.endDate ?? now;
    final difference = end.difference(widget.startDate);
    return timeago.format(now.subtract(difference));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MouseRegion(
          onEnter: (_) => setState(() => isHovered = true),
          onExit: (_) => setState(() => isHovered = false),
          child: AnimatedContainer(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            duration: Duration(milliseconds: 200),
            transform: isHovered
                ? Matrix4.translationValues(0, -5, 0)
                : Matrix4.translationValues(0, 0, 0),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(1),
              border: Border.all(
                color: isHovered ? AppColors.quillGray : AppColors.darkGrey,
                width: isHovered ? 2 : 1,
              ),
              boxShadow: isHovered
                  ? [
                      BoxShadow(
                        color: AppColors.darkGrey.withOpacity(0.2),
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      )
                    ]
                  : [],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.role,
                  style: GoogleFonts.ptMono(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: AppColors.quillGray,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  widget.company,
                  style: GoogleFonts.ptMono(
                    fontSize: 18.0,
                    color: AppColors.quillGray,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '${widget.type} · $duration',
                  style: GoogleFonts.ptMono(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  widget.location,
                  style: GoogleFonts.ptMono(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
                // if (responsibilities != null && responsibilities!.isNotEmpty) ...[
                // SizedBox(height: 20),
                // Text(
                //   'Responsibilities: ',
                //   style: GoogleFonts.ptMono(
                //     fontSize: 18.0,
                //     fontWeight: FontWeight.bold,
                //     color: AppColors.quillGray,
                //   ),
                // ),
                // SizedBox(height: 12),
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: responsibilities!
                //       .map((item) => Padding(
                //             padding: const EdgeInsets.only(bottom: 8.0),
                //             child: Text(
                //               '• $item',
                //               style: GoogleFonts.ptMono(
                //                 fontSize: 16.0,
                //                 color: Colors.grey,
                //               ),
                //             ),
                //           ))
                //       .toList(),
                // ),
                // ],
              ],
            ),
          ),
        ),
        const SizedBox(height: 30)
      ],
    );
  }
}
