import 'package:flutter/material.dart';

class FancyFABItem {
  Widget child;
  Color backgroundColor;
  String tooltip;
  Function onPressed;

  FancyFABItem({
    this.child,
    this.backgroundColor,
    this.tooltip,
    this.onPressed,
  });
}

class FancyFAB extends StatefulWidget {
  final List<FancyFABItem> children;
  final String toolTipExpanded;
  final String toolTipCollapsed;
  final AnimatedIcon icon;
  final int duration;
  final bool isExpanded;
  final Function expandFAB;

  FancyFAB({
    this.children,
    this.toolTipExpanded,
    this.toolTipCollapsed,
    this.icon,
    this.duration,
    this.isExpanded,
    this.expandFAB,
  });

  @override
  _FancyFABState createState() => _FancyFABState();
}

class _FancyFABState extends State<FancyFAB>
    with SingleTickerProviderStateMixin {
  bool isOpened = false;

  AnimationController _animationController;
  Animation<Color> _buttonColor;
  Animation<double> _animateIcon;
  Animation<double> _translateButton;

  Curve _curve = Curves.easeOut;
  double _fabHeight = 56.0;

  int itemCount;

  @override
  initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.duration ?? 300),
    )..addListener(() {
        setState(() {});
      });

    _animateIcon = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_animationController);

    _buttonColor = ColorTween(
      begin: Colors.blue,
      end: Colors.red,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.00,
        1.00,
        curve: Curves.linear,
      ),
    ));

    _translateButton = Tween<double>(
      begin: _fabHeight,
      end: -14.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        0.75,
        curve: _curve,
      ),
    ));

    try {
      itemCount = widget.children.length;
    } catch (_) {
      itemCount = 0;
    }

    if (widget.isExpanded) {
      isOpened = true;
      _animationController.forward();
    }
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Widget toggleButton() {
    return FloatingActionButton(
      backgroundColor: _buttonColor.value,
      onPressed: () {
        if (!isOpened) {
          _animationController.forward();
        } else {
          _animationController.reverse();
        }
        isOpened = !isOpened;
        widget.expandFAB(isOpened);
      },
      tooltip: isOpened
          ? widget.toolTipExpanded ?? 'Close Menu'
          : widget.toolTipCollapsed ?? 'Menu',
      child: AnimatedIcon(
        icon: widget.icon ?? AnimatedIcons.menu_close,
        progress: _animateIcon,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[]
        ..addAll(
          (widget.children ?? []).asMap().entries.map((entry) {
            return Transform(
              transform: Matrix4.translationValues(
                0.0,
                _translateButton.value * (itemCount - entry.key),
                0.0,
              ),
              child: FloatingActionButton(
                child: entry.value.child,
                backgroundColor: entry.value.backgroundColor,
                elevation: _animationController.value,
                tooltip: entry.value.tooltip,
                onPressed: entry.value.onPressed,
              ),
            );
          }),
        )
        ..add(
          toggleButton(),
        ),
    );
  }
}

class FancyFABFixed extends StatelessWidget {
  const FancyFABFixed({
    Key key,
    @required this.children,
  }) : super(key: key);

  final List<FancyFABItem> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: children.asMap().entries.map((entry) {
        return Transform(
          transform: Matrix4.translationValues(
            0.0,
            -14.0 * (children.length - entry.key),
            0.0,
          ),
          child: FloatingActionButton(
            child: entry.value.child,
            backgroundColor: entry.value.backgroundColor,
            elevation: 6.0,
            highlightElevation: 10.0,
            tooltip: entry.value.tooltip,
            onPressed: entry.value.onPressed,
          ),
        );
      }).toList(),
    );
  }
}
