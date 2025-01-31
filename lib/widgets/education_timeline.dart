// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:simple_portfolio/configs/app_colors.dart';

// class EducationCard extends StatelessWidget {
//   final String institute;
//   final String duration;
//   final String department;
//   final List<String> achievements;

//   const EducationCard({
//     super.key,
//     required this.institute,
//     required this.duration,
//     required this.department,
//     required this.achievements,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           width: double.infinity,
//           padding: EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             color: Colors.transparent,
//             borderRadius: BorderRadius.circular(1),
//             border: Border.all(
//               color: AppColors.darkGrey,
//               width: 1,
//             ),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 institute,
//                 style: GoogleFonts.ptMono(
//                   fontSize: 24.0,
//                   fontWeight: FontWeight.bold,
//                   color: AppColors.quillGray,
//                 ),
//               ),
//               SizedBox(height: 4),
//               Text(
//                 duration,
//                 style: GoogleFonts.ptMono(
//                   fontSize: 16.0,
//                   color: Colors.grey,
//                 ),
//               ),
//               SizedBox(height: 12),
//               Text(
//                 department,
//                 style: GoogleFonts.ptMono(
//                   fontSize: 18.0,
//                   color: AppColors.quillGray,
//                 ),
//               ),
//               SizedBox(height: 12),
//               if (achievements.isNotEmpty) ...[
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: achievements
//                       .map((achievement) => Padding(
//                             padding: const EdgeInsets.only(bottom: 8.0),
//                             child: Text(
//                               '• $achievement',
//                               style: GoogleFonts.ptMono(
//                                 fontSize: 16.0,
//                                 color: Colors.grey,
//                               ),
//                             ),
//                           ))
//                       .toList(),
//                 ),
//               ],
//             ],
//           ),
//         ),
//         const SizedBox(height: 30)
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_portfolio/configs/app_colors.dart';
import 'package:simple_portfolio/widgets/expanded_basic_container.dart';

class EducationTimeline extends StatelessWidget {
  const EducationTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20),
      child: Column(
        children: [
          ExpandedBasicContainer(text: "Experiences & Responsibilities"),
          SizedBox(height: 16),
          _TimelineItem(
            duration: '2024-present',
            institute: 'Dr. B.R. Ambedkar NIT, Jalandhar',
            department: 'Department of Information Technology',
            achievement: 'Currently pursuing B.Tech',
            isFirst: true,
          ),
          _TimelineItem(
            duration: '2024',
            institute: 'Allen Chandigarh',
            department: 'JEE Advanced Preparation',
            achievement: 'AIR 13xxx rank',
          ),
          _TimelineItem(
            duration: '2024',
            institute: 'Manu Vatika School',
            department: 'Class XII',
            achievement: '91.8% in CBSE Boards',
          ),
          _TimelineItem(
            duration: '2022',
            institute: 'Manu Vatika School',
            department: 'Class X',
            achievement: '94.8% in CBSE Boards',
            isLast: true,
          ),
        ],
      ),
    );
  }
}

class _TimelineItem extends StatefulWidget {
  final String duration;
  final String institute;
  final String department;
  final String achievement;
  final bool isFirst;
  final bool isLast;

  const _TimelineItem({
    required this.duration,
    required this.institute,
    required this.department,
    required this.achievement,
    this.isFirst = false,
    this.isLast = false,
  });

  @override
  State<_TimelineItem> createState() => _TimelineItemState();
}

class _TimelineItemState extends State<_TimelineItem> {
  bool isHovered = false;
  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 300), () {
      setState(() => isVisible = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 500),
        opacity: isVisible ? 1.0 : 0.0,
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    width: isHovered ? 25 : 20,
                    height: isHovered ? 25 : 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          isHovered ? AppColors.quillGray : Colors.transparent,
                      border: Border.all(
                        color: AppColors.quillGray,
                        width: 2,
                      ),
                    ),
                    child: Icon(
                      Icons.school,
                      size: isHovered ? 15 : 12,
                      color:
                          isHovered ? AppColors.codGray : AppColors.quillGray,
                    ),
                  ),
                  if (!widget.isLast)
                    Expanded(
                      child: Container(
                        width: 2,
                        color: AppColors.darkGrey,
                      ),
                    ),
                ],
              ),
              SizedBox(width: 20),
              Expanded(
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  margin: EdgeInsets.only(bottom: 30),
                  padding: EdgeInsets.all(isHovered ? 16 : 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: isHovered
                        ? AppColors.darkGrey.withOpacity(0.3)
                        : Colors.transparent,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.duration,
                        style: GoogleFonts.ptMono(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        widget.institute,
                        style: GoogleFonts.ptMono(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.quillGray,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        widget.department,
                        style: GoogleFonts.ptMono(
                          fontSize: 16,
                          color: AppColors.quillGray,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        widget.achievement,
                        style: GoogleFonts.ptMono(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
