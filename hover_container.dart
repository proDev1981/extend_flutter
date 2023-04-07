import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HoverContainer extends StatefulWidget {
  double? width;
  double? height;
  double? hoverWidth;
  double? hoverHeight;
  double? _initialWidth;
  double? _initilaHeight;
  Duration duration;
  Curve curve;
  Decoration? decoration;
  Decoration? hoverDecoration;
  Decoration? _initialDecoration;
  Widget child;
  Function? onTap;
  TextStyle? textStyle;
  TextStyle? hoverTextStyle;
  TextStyle? _initialTextDecoration;

  HoverContainer(
      {this.width,
      this.hoverWidth,
      this.height,
      this.hoverHeight,
      this.decoration,
      this.hoverDecoration,
      this.textStyle,
      this.hoverTextStyle,
      required this.child,
      this.onTap,
      this.duration = const Duration(milliseconds: 300),
      this.curve = Curves.linear,
      super.key}) {
    textStyle ??= TextStyle(color: Colors.black);
    hoverTextStyle ??= TextStyle(color: Colors.black);
    _initialWidth = width;
    _initilaHeight = height;
    _initialDecoration = decoration;
    _initialTextDecoration = textStyle;
  }

  @override
  State<HoverContainer> createState() => _HoverContainerState();
}

class _HoverContainerState extends State<HoverContainer> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: widget.width,
      height: widget.height,
      decoration: widget.decoration,
      duration: widget.duration,
      curve: widget.curve,
      child: InkWell(
        child: AnimatedDefaultTextStyle(
          duration: widget.duration,
          style: widget.textStyle!,
          child: widget.child,
        ),
        onHover: (values) => setState(() {
          widget.width = (widget.hoverWidth != null && values)
              ? widget.hoverWidth
              : widget._initialWidth;
          widget.height = (widget.hoverHeight != null && values)
              ? widget.hoverHeight
              : widget._initilaHeight;
          widget.decoration = (widget.hoverDecoration != null && values)
              ? widget.hoverDecoration
              : widget._initialDecoration;

          widget.textStyle = (widget.textStyle != null && values)
              ? widget.hoverTextStyle
              : widget._initialTextDecoration;
        }),
        onTap: () {
          setState(() {});
          if (widget.onTap != null) {
            widget.onTap!();
          }
        },
      ),
    );
  }
}
