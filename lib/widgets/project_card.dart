import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_portfolio/configs/app_colors.dart';
import 'package:simple_portfolio/widgets/basic_list_item.dart';
import 'package:simple_portfolio/widgets/small_basic_container.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final List<String> techStack;
  final List<String> features;
  final String? githubUrl;
  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.techStack,
    required this.features,
    this.githubUrl,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool isHovered = false;
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
                  widget.title,
                  style: GoogleFonts.ptMono(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: AppColors.quillGray,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  widget.description,
                  style: GoogleFonts.ptMono(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Tech Stacks: ',
                  style: GoogleFonts.ptMono(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: AppColors.quillGray,
                  ),
                ),
                SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: widget.techStack
                      .map((tech) => SmallBasicContainer(text: tech))
                      .toList(),
                ),
                SizedBox(height: 20),
                Text(
                  'Features: ',
                  style: GoogleFonts.ptMono(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: AppColors.quillGray,
                  ),
                ),
                SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: widget.features
                      .map((feat) => (BasicListItem(
                            text: feat,
                          )))
                      .toList(),
                ),
                SizedBox(height: 18),
                if (widget.githubUrl != null)
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.darkGrey,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        if (!await launchUrl(Uri.parse(widget.githubUrl!))) {
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    'Could not launch ${widget.githubUrl}'),
                                duration: const Duration(seconds: 2),
                              ),
                            );
                          }
                          throw Exception(
                              'Could not launch ${widget.githubUrl}');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ).copyWith(
                        overlayColor: WidgetStateProperty.all(
                            // ignore: deprecated_member_use
                            AppColors.darkGrey.withOpacity(0.1)),
                        foregroundColor:
                            WidgetStateProperty.all(AppColors.quillGray),
                      ),
                      icon: const FaIcon(
                        FontAwesomeIcons.github,
                        color: AppColors.quillGray,
                        size: 20,
                      ),
                      label: Text(
                        'Explore More',
                        style: GoogleFonts.ptMono(
                          color: AppColors.quillGray,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                const SizedBox(height: 8)
              ],
            ),
          ),
        ),
        const SizedBox(height: 30)
      ],
    );
  }
}
