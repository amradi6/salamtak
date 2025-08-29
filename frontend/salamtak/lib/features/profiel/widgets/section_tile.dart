import 'package:flutter/material.dart';
import 'smooth_expansion_tile.dart';

class SectionTile extends StatelessWidget {
  final int index;
  final String title;
  final Widget content;
  final bool isExpanded;
  final ValueChanged<bool> onExpansionChanged;

  const SectionTile({
    super.key,
    required this.index,
    required this.title,
    required this.content,
    required this.isExpanded,
    required this.onExpansionChanged,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.all(size.height * 0.02624),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: SmoothExpansionTile(
          content: content,
          title: title,
          initiallyExpanded: isExpanded,
          onExpansionChanged: onExpansionChanged,
        ),
      ),
    );
  }
}
