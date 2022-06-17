import 'package:flutter/material.dart';

import 'child_delegate.dart';
import 'indicator.dart';

class SemicircularIndicator extends StatelessWidget {
  /// set indicator's semicircle radius, default 120
  /// 设置半圆的半径，默认120
  final double radius;

  /// line width, default 16
  /// 线条宽度，默认16
  final double strokeWidth;

  /// indicator's progress, default 0.75
  /// 当前进度，默认 0.75
  final double progress;

  /// indicator's background color, default Colors.black26
  /// 进度条的背景色，默认 Colors.black26
  final Color backgroundColor;

  /// progress's color, default Colors.green
  /// 进度条颜色，默认绿色
  final Color color;

  /// Styles to use for line endings, default StrokeCap.round
  /// 线条头部的形状，默认圆形
  final StrokeCap strokeCap;

  /// child widget used to stacked on indicator's top, such as number,
  /// Positioned widget is enable.
  /// 叠加在进度条上面的组件，例如进度条进度数字，
  /// 可以使用Positioned进行自定义位置。
  final Widget? child;

  /// whether use default position when layout child position
  /// default position is bottom center
  /// 是否对child组件使用默认的位置,
  /// 默认是在底部中间
  final bool userDefaultChildPosition;

  /// child widget's bottom padding,
  /// only be used when userDefaultChildPosition is true, default 0
  /// child 组件的底部间距，默认是0，只有在 userDefaultChildPosition 为 true 时有效
  final double bottomPadding;

  /// whether the indicator should be contained within the box,
  /// default (false) is on border.
  /// 进度条是否完全被完全包裹在容器内部，默认是否（进度条的中线对齐在容器边缘）。
  final bool contain;

  const SemicircularIndicator({
    this.radius = 120,
    this.strokeWidth = 16,
    this.progress = 0.75,
    this.backgroundColor = Colors.black26,
    this.color = Colors.green,
    this.strokeCap = StrokeCap.round,
    this.child,
    this.userDefaultChildPosition = true,
    this.bottomPadding = 0,
    this.contain = false,
    Key? key,
  })  : assert(0 <= progress && progress <= 1),
        assert(0 < strokeWidth),
        assert(strokeWidth < radius),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = Size(radius * 2, radius);
    CustomPainter customPainter = Indicator(
        strokeWidth: strokeWidth,
        progress: progress,
        backgroundColor: backgroundColor,
        color: color,
        strokeCap: strokeCap);
    var stack = Stack(
      children: [
        SizedBox(
          width: size.width,
          height: size.height,
          child: CustomPaint(
            painter: customPainter,
          ),
        ),
        if (userDefaultChildPosition && child != null)
          CustomSingleChildLayout(
              delegate: ChildDelegate(size, bottomPadding), child: child),
        if (!userDefaultChildPosition && child != null) child!,
      ],
    );
    if (contain) {
      return Container(
        padding: EdgeInsets.all(strokeWidth / 2),
        child: stack,
      );
    } else {
      return stack;
    }
  }
}
