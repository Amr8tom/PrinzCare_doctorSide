import 'package:flutter/material.dart';

class AnimatedExpansion extends StatefulWidget {
  final Widget child;
  final bool expand;

  const AnimatedExpansion(
      {super.key, this.expand = false, required this.child});

  @override
  State<AnimatedExpansion> createState() => _AnimatedExpansionState();
}

class _AnimatedExpansionState extends State<AnimatedExpansion>
    with SingleTickerProviderStateMixin {
  AnimationController? expandController;
  Animation<double>? animation;

  @override
  void initState() {
    super.initState();
    prepareAnimations();
    _runExpandCheck();
  }

  ///Setting up the animation
  void prepareAnimations() {
    expandController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    animation = CurvedAnimation(
      parent: expandController!,
      curve: Curves.linearToEaseOut,
    );
  }

  void _runExpandCheck() {
    if (widget.expand) {
      expandController?.forward();
    } else {
      expandController?.reverse();
    }
  }

  @override
  void didUpdateWidget(AnimatedExpansion oldWidget) {
    super.didUpdateWidget(oldWidget);
    _runExpandCheck();
  }

  @override
  void dispose() {
    expandController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
        axisAlignment: 1.0, sizeFactor: animation!, child: widget.child);
  }
}
