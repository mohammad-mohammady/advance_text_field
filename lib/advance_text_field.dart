library advance_text_field;

import 'package:flutter/material.dart';

class AdvanceTextField extends StatefulWidget {
  final double width, height;
  final Color backgroundColor, color, textColor, textHintColor;
  final TextStyle textHintStyle, textStyle;
  final AdvanceTextFieldType type;
  final Widget editLabel;
  final Widget saveLabel;
  final Duration animationDuration;
  final TextInputType keyboardType;
  final String textHint, text;
  final TextEditingController controller;
  final Function onEditTap;
  final Function(String text) onSaveTap;

  const AdvanceTextField(
      {Key key,
      this.width,
      this.height = 60.0,
      this.backgroundColor = Colors.blueAccent,
      this.textColor = Colors.black87,
      this.textHintColor = Colors.grey,
      this.color = Colors.white,
      this.type,
      this.animationDuration,
      @required this.editLabel,
      @required this.saveLabel,
      this.keyboardType = TextInputType.text,
      this.textHint,
      this.text,
      this.onEditTap,
      this.onSaveTap,
      this.controller,
      this.textHintStyle,
      this.textStyle})
      : super(key: key);

  @override
  _AdvanceTextFieldState createState() => _AdvanceTextFieldState();
}

class _AdvanceTextFieldState extends State<AdvanceTextField> {
  Widget _leftWidget = Container(), _rightWidget = Container();

  TextEditingController _editingController = TextEditingController();

  AdvanceTextFieldType _type;

  final _roundedCorner = 10000.0;
  double _topRightRadius;
  double _topLeftRadius;
  double _bottomLeftRadius;
  double _bottomRightRadius;

  double _innerContainerWidth;
  double _widgetWidth;

  bool _enable;

  MainAxisAlignment _mainAxisAlignment = MainAxisAlignment.center;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _make(widget.type);
      _editingController.text = widget.text;
    });
    if (widget.controller != null) _editingController = widget.controller;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _widgetWidth = widget.width ?? MediaQuery.of(context).size.width * .8;
    return Container(
      width: _widgetWidth,
      height: widget.height,
      child: Stack(
        children: [
          Positioned.fill(
              child: Container(
            decoration: BoxDecoration(
                color: widget.backgroundColor,
                borderRadius:
                    BorderRadius.all(Radius.circular(_roundedCorner))),
          )),
          Positioned(left: 0.0, top: 0.0, bottom: 0.0, child: _leftWidget),
          Positioned(right: 0.0, top: 0.0, bottom: 0.0, child: _rightWidget),
          Positioned.fill(
              child: Row(
            mainAxisAlignment: _mainAxisAlignment,
            children: [
              AnimatedContainer(
                onEnd: () {
                  _make(_type);
                },
                margin: EdgeInsets.all(2.0),
                width: _innerContainerWidth != null
                    ? _innerContainerWidth
                    : widget.width != null
                        ? widget.width - 4
                        : (MediaQuery.of(context).size.width * .8) - 4,
                height: widget.height,
                duration:
                    widget.animationDuration ?? Duration(milliseconds: 500),
                decoration: BoxDecoration(
                  color: widget.color,
                  borderRadius: BorderRadius.only(
                      bottomLeft:
                          Radius.circular(_bottomLeftRadius ?? _roundedCorner),
                      bottomRight:
                          Radius.circular(_bottomRightRadius ?? _roundedCorner),
                      topLeft:
                          Radius.circular(_topLeftRadius ?? _roundedCorner),
                      topRight:
                          Radius.circular(_topRightRadius ?? _roundedCorner)),
                ),
                child: Center(
                  child: TextField(
                    controller: _editingController,
                    textInputAction: TextInputAction.done,
                    keyboardType: widget.keyboardType,
                    textAlign: TextAlign.center,
                    enabled: _enable,
                    onChanged: (value) {},
                    style:
                        widget.textStyle ?? TextStyle(color: widget.textColor),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: widget.textHint,
                        hintStyle: widget.textHintStyle ??
                            TextStyle(color: widget.textHintColor)),
                  ),
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }

  _make(AdvanceTextFieldType type) {
    _type = type;
    setState(() {
      if (type == AdvanceTextFieldType.EDIT) {
        _leftWidget = _editWidget();
        _mainAxisAlignment = MainAxisAlignment.end;
        _innerContainerWidth = _widgetWidth - 55;
        _topLeftRadius = 0.0;
        _bottomLeftRadius = _roundedCorner;
        _topRightRadius = _roundedCorner;
        _bottomRightRadius = _roundedCorner;
        _enable = false;
      }
      if (type == AdvanceTextFieldType.SAVE) {
        _rightWidget = _saveWidget();
        _mainAxisAlignment = MainAxisAlignment.start;
        _innerContainerWidth = _widgetWidth - 55;
        _topLeftRadius = _roundedCorner;
        _bottomLeftRadius = _roundedCorner;
        _topRightRadius = 0.0;
        _bottomRightRadius = _roundedCorner;
        _enable = true;
      }
    });
  }

  fill() {
    setState(() {
      _innerContainerWidth = _widgetWidth - 4;
      _topLeftRadius = _roundedCorner;
      _bottomLeftRadius = _roundedCorner;
      _topRightRadius = _roundedCorner;
      _bottomRightRadius = _roundedCorner;
    });
  }

  Widget _saveWidget() {
    return InkWell(
      onTap: () {
        _type = AdvanceTextFieldType.EDIT;
        fill();
        if (widget.onSaveTap != null) widget.onSaveTap(_editingController.text);
      },
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 20.0,
        ),
        child: Center(
          child: widget.saveLabel,
        ),
      ),
    );
  }

  Widget _editWidget() {
    return InkWell(
      onTap: () {
        _type = AdvanceTextFieldType.SAVE;
        fill();
        if (widget.onEditTap != null) widget.onEditTap();
      },
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 20.0,
        ),
        child: Center(
          child: widget.editLabel,
        ),
      ),
    );
  }
}

enum AdvanceTextFieldType { EDIT, SAVE, FILL }
