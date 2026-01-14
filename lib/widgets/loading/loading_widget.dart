import 'dart:math' as math;
import 'package:flutter/material.dart';

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({
    super.key,
    this.shape = BoxShape.circle,
    this.duration = const Duration(milliseconds: 1000),
    this.size = 8,
    this.color_1,
    this.color_2,
    this.color_3,
    this.padding = const EdgeInsets.all(2),
  });

  final BoxShape shape;
  final Duration duration;
  final double size;
  final Color? color_1;
  final Color? color_2;
  final Color? color_3;
  final EdgeInsetsGeometry padding;

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? animation_1;
  Animation<double>? animation_2;
  Animation<double>? animation_3;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: widget.duration);
    animation_1 = DelayTween(begin: 0.0, end: 1.0, delay: 0.0)
        .animate(animationController!);
    animation_2 = DelayTween(begin: 0.0, end: 1.0, delay: 0.2)
        .animate(animationController!);
    animation_3 = DelayTween(begin: 0.0, end: 1.0, delay: 0.4)
        .animate(animationController!);
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ScaleTransition(
          scale: animation_1!,
          child: Padding(
            padding: widget.padding,
            child: Dot(
              shape: widget.shape,
              size: widget.size,
              color: widget.color_1 ?? Theme.of(context).colorScheme.surface,
            ),
          ),
        ),
        ScaleTransition(
          scale: animation_2!,
          child: Padding(
            padding: widget.padding,
            child: Dot(
              shape: widget.shape,
              size: widget.size,
              color: widget.color_2 ?? Theme.of(context).colorScheme.surface,
            ),
          ),
        ),
        ScaleTransition(
          scale: animation_3!,
          child: Padding(
            padding: widget.padding,
            child: Dot(
              shape: widget.shape,
              size: widget.size,
              color: widget.color_3 ?? Theme.of(context).colorScheme.surface,
            ),
          ),
        ),
      ],
    );
  }
}

class Dot extends StatelessWidget {
  final BoxShape? shape;
  final double? size;
  final Color? color;

  const Dot({
    super.key,
    this.shape,
    this.size,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(color: color, shape: shape!),
      ),
    );
  }
}

class DelayTween extends Tween<double> {
  DelayTween({
    super.begin,
    super.end,
    this.delay,
  });

  final double? delay;

  @override
  double lerp(double t) =>
      super.lerp((math.sin((t - delay!) * 2 * math.pi) + 1) / 2);

  @override
  double evaluate(Animation<double> animation) => lerp(
        animation.value,
      );
}
