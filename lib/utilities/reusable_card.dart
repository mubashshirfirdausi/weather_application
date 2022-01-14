import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Widget cardChild;
  final double cardHeight;

  ReusableCard({
    this.cardChild,
    this.cardHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: cardHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.white.withOpacity(0.40),
      ),
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(10),
      child: cardChild,
    );
  }
}
