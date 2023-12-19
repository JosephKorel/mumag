import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mumag/common/theme/utils.dart';

class AnimatedFAB extends StatefulWidget {
  const AnimatedFAB({
    required this.child,
    required this.show,
    required this.onPressed,
    this.shape,
    this.backgroundColor,
    super.key,
  });

  final Widget child;
  final bool show;
  final VoidCallback onPressed;
  final ShapeBorder? shape;
  final Color? backgroundColor;

  @override
  State<AnimatedFAB> createState() => _AnimatedFABState();
}

class _AnimatedFABState extends State<AnimatedFAB>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void didUpdateWidget(covariant AnimatedFAB oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!widget.show) {
      _controller.reverse();
    } else {
      if (_controller.status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Animate(
      controller: _controller,
      effects: [
        SlideEffect(
          begin: const Offset(0, 8),
          duration: .2.seconds,
          curve: Curves.easeOutCirc,
        ),
      ],
      child: FloatingActionButton(
        onPressed: widget.onPressed,
        shape: widget.shape ??
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
        backgroundColor: widget.backgroundColor ?? context.primary,
        child: widget.child,
      ),
    );
  }
}
