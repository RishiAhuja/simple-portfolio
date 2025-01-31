import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_portfolio/configs/app_colors.dart';
import 'dart:async';

import 'package:simple_portfolio/widgets/visitor_counter.dart';

class CustomFooter extends StatelessWidget {
  const CustomFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
        // height: 150,
        padding: EdgeInsets.fromLTRB(16, 30, 16, 16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.codGray,
          border: Border(
            top: BorderSide(
              color: AppColors.gunSmoke,
              width: 1,
            ),
          ),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const VisitorCounter(),
                      SizedBox(width: 20),
                      const TimeSpentWidget(),
                    ],
                  ),
                  Text(
                    'made with ❤ by Rishi',
                    style: GoogleFonts.ptMono(
                      color: AppColors.quillGray,
                      fontSize: 14,
                    ),
                  ),
                ],
              );
            } else {
              return Column(
                spacing: 20,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const VisitorCounter(),
                      SizedBox(width: 20),
                      const TimeSpentWidget(),
                    ],
                  ),
                  Text(
                    'made with ❤ by Rishi',
                    style: GoogleFonts.ptMono(
                      color: AppColors.quillGray,
                      fontSize: 14,
                    ),
                  ),
                ],
              );
            }
          },
        ));
  }

  launchUrl(String url, BuildContext context) async {
    if (!await launchUrl(Uri.parse(url) as String, context)) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Could not launch $url'),
            duration: const Duration(seconds: 2),
          ),
        );
      }
      throw Exception('Could not launch $url');
    }
  }
}

class TimeSpentWidget extends StatefulWidget {
  const TimeSpentWidget({super.key});

  @override
  State<TimeSpentWidget> createState() => _TimeSpentWidgetState();
}

class _TimeSpentWidgetState extends State<TimeSpentWidget> {
  Duration timeSpent = Duration.zero;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        timeSpent += const Duration(seconds: 1);
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      'Time spent: ${timeSpent.inMinutes}:${(timeSpent.inSeconds % 60).toString().padLeft(2, '0')}',
      style: GoogleFonts.ptMono(
        color: AppColors.gunSmoke,
        fontSize: 14,
      ),
    );
  }
}
