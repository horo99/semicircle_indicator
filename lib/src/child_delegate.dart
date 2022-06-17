import 'package:flutter/material.dart';

class ChildDelegate extends SingleChildLayoutDelegate {
  final Size parentSize;
  final double bottomPadding;

  ChildDelegate(this.parentSize, this.bottomPadding);

  @override
  Size getSize(BoxConstraints constraints) {
    return parentSize;
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    double dx = 0, dy = 0;
    if (childSize.width < size.width) {
      dx = (size.width - childSize.width) / 2;
    }
    if (childSize.height < size.height) {
      dy = size.height - childSize.height;
      if (dy > bottomPadding) {
        dy -= bottomPadding;
      } else {
        dy /= 2;
      }
    }
    return Offset(dx, dy);
  }

  @override
  bool shouldRelayout(covariant SingleChildLayoutDelegate oldDelegate) {
    return true;
  }
}
