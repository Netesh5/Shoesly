import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Widget widget;
  final void Function()? onPressed;
  final Color? iconColor;
  final Color backgroundColor;
  final double borderRadius;
  final double padding;
  final double? height;
  final double? width;
  final String? text;
  final TextStyle? style;
  const CustomIconButton({
    super.key,
    required this.widget,
    this.onPressed,
    this.backgroundColor = Colors.white,
    this.iconColor,
    this.borderRadius = 100,
    this.padding = 9,
    this.height,
    this.width,
    this.text,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(100),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        padding: EdgeInsets.all(padding),
        child: text == null
            ? widget
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widget,
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    text ?? "",
                    style: style,
                  )
                ],
              ),
      ),
    );
  }
}
