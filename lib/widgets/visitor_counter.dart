import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_portfolio/configs/app_colors.dart';

class VisitorCounter extends StatefulWidget {
  const VisitorCounter({super.key});

  @override
  State<VisitorCounter> createState() => _VisitorCounterState();
}

class _VisitorCounterState extends State<VisitorCounter> {
  int visitorCount = 0;

  @override
  void initState() {
    super.initState();
    _incrementVisitor();
  }

  Future<void> _incrementVisitor() async {
    final counterRef =
        FirebaseFirestore.instance.collection('counters').doc('visitors');

    await FirebaseFirestore.instance.runTransaction((transaction) async {
      final snapshot = await transaction.get(counterRef);
      final newCount = (snapshot.data()?['count'] ?? 0) + 1;
      transaction.set(counterRef, {'count': newCount});
      setState(() => visitorCount = newCount);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      'Visitor #$visitorCount',
      style: GoogleFonts.ptMono(
        color: AppColors.gunSmoke,
        fontSize: 14,
      ),
    );
  }
}
