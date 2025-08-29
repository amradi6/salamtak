import 'package:flutter/material.dart';

class SmoothExpansionTile extends StatefulWidget {
  final String title;
  final Widget content;
  final bool initiallyExpanded;
  final ValueChanged<bool>? onExpansionChanged;

  const SmoothExpansionTile({
    super.key,
    required this.title,
    required this.content,
    this.initiallyExpanded = false,
    this.onExpansionChanged,
  });

  @override
  State<SmoothExpansionTile> createState() => _SmoothExpansionTileState();
}

class _SmoothExpansionTileState extends State<SmoothExpansionTile>
    with TickerProviderStateMixin {
  bool _expanded = false;

  @override
  void initState() {
    super.initState();
    _expanded = widget.initiallyExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Icon(
              Icons.circle,
              color: _expanded ? Colors.green : Colors.grey,
              size: 14,
            ),
            title: Text(
              widget.title,
              style: const TextStyle(
                fontFamily: "Inter",
                fontSize: 15.3,
                fontWeight: FontWeight.w500,
                color: Color(0XFF111827),
              ),
            ),
            trailing: Icon(
              _expanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              color: Colors.green,
            ),
            onTap: () {
              setState(() {
                _expanded = !_expanded;
              });
              if (widget.onExpansionChanged != null) {
                widget.onExpansionChanged!(_expanded);
              }
            },
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 700),
            curve: Curves.easeInOut,
            child:
                _expanded
                    ? Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: widget.content,
                    )
                    : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
