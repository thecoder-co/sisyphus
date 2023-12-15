import 'package:flutter/material.dart';

class TimeBox extends StatelessWidget {
  final bool selected;
  final String title;
  final void Function() onTap;
  const TimeBox({
    super.key,
    required this.selected,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: ShapeDecoration(
          color: selected ? const Color(0xFF555C63) : Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: selected ? Colors.white : const Color(0xFFA7B1BC),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
