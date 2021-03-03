
import 'package:flutter/material.dart';

class AdvanceEditText extends StatefulWidget {
  String hint = '';
  String text;
  AdvanceEditTextType type;
  TextInputType keyboardType;

  Function(AdvanceEditText widget) onSaveClick;
  Function(AdvanceEditText widget) onAddClick;
  Function(AdvanceEditText widget) onEditClick;
  bool enable = true;

  AdvanceEditText(
      {this.hint = '',
      this.type,
      this.onSaveClick,
      this.onAddClick,
      this.onEditClick,
      this.enable,
      this.keyboardType = TextInputType.text});

  _AdvanceEditTextState _state = _AdvanceEditTextState();

  make(AdvanceEditTextType type) {
    _state.make(type);
  }

  @override
  _AdvanceEditTextState createState() => _state;
}

class _AdvanceEditTextState extends State<AdvanceEditText> {
  double internalWidthContainer = 50;

  double topRightRadius = 50.0;

  double topLeftRadius = 50.0;

  double bottomLeftRadius = 50.0;

  double bottomRightRadius = 50.0;

  Widget rightSideWidget = Container();
  Widget leftSideWidget = Container();

  MainAxisAlignment _mainAxisAlignment = MainAxisAlignment.center;

  @override
  void didUpdateWidget(AdvanceEditText oldWidget) {
    super.didUpdateWidget(oldWidget);

  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if(currentState == AdvanceEditTextType.SAVE)
    {
      setState(() {
        widget.enable = true;
      });
    }
  }

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      make(widget.type);
    });
  }

  var currentState = AdvanceEditTextType.NONE;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10.0),
        height: 50.0,
        width: SizeConfig.screenWidth * 0.80,
        constraints: BoxConstraints(
          maxWidth: 280.0,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
            color: Statics.BrandColor),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                SizedBox(
                  width: 13,
                ),
                Container(
                  child: Center(
                    child: leftSideWidget,
                  ),
                ),
                Spacer(),
                Container(
                  child: Center(
                    child: rightSideWidget,
                  ),
                ),
                SizedBox(
                  width: 13,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: _mainAxisAlignment,
              children: <Widget>[
                SizedBox(
                  width: 1.5,
                ),
                AnimatedContainer(
                  onEnd: () {
                    nextState();
                  },
                  height: 47.0,
                  constraints: BoxConstraints(maxWidth: 380),
                  duration: Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(topLeftRadius),
                          topRight: Radius.circular(topRightRadius),
                          bottomRight: Radius.circular(bottomRightRadius),
                          bottomLeft: Radius.circular(bottomLeftRadius)),
                      color: Colors.white),
                  width: internalWidthContainer,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          enabled: widget.enable,
                          textInputAction: TextInputAction.done,
                          keyboardType: widget.keyboardType,
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            widget.text = value;
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: widget.hint),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 1.5,
                ),
              ],
            ),
          ],
        ));
  }

  nextState() {
    if (currentState == AdvanceEditTextType.SAVE) {
      Future.delayed(Duration(milliseconds: 140)).then((_) {
        setState(() {
          currentState = AdvanceEditTextType.NONE;
          _mainAxisAlignment = MainAxisAlignment.start;
          topRightRadius = 0.0;
          bottomRightRadius = 50.0;
          internalWidthContainer = 226;
          rightSide(InkWell(
            onTap: () {setState(() {
              widget.enable = true;
            });
              widget.onSaveClick(widget);

            },
            child: Container(
                child: Padding(
              padding: EdgeInsets.only(
                  top: 12.0, bottom: 12.0, left: 5.0, right: 5.0),
              child: Text(
                'Save',
                style: TextStyle(color: Colors.white),
              ),
            )),
          ));
        });
      });
    } else if (currentState == AdvanceEditTextType.EDIT_ADD) {
      Future.delayed(Duration(milliseconds: 140)).then((_) {
        setState(() {
          currentState = AdvanceEditTextType.NONE;
          _mainAxisAlignment = MainAxisAlignment.center;
          bottomRightRadius = 0.0;
          topRightRadius = 25.0;
          internalWidthContainer = 174;
          topLeftRadius = 0.0;
          bottomLeftRadius = 25.0;
          rightSide(InkWell(
            onTap: () {
              widget.onAddClick(widget);
            },
            child: Container(
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ));
          leftSide(InkWell(
            onTap: () {
              widget.onEditClick(widget);
              setState(() {
                widget.enable = true;
              });
            },
            child: Container(
              child: Padding(
                padding: EdgeInsets.only(
                    top: 12.0, bottom: 12.0, left: 5.0, right: 5.0),
                child: Text(
                'Edit',
                style: TextStyle(color: Colors.white),
              )),
            ),
          ));
        });
      });
    } else if (currentState == AdvanceEditTextType.EDIT) {
      Future.delayed(Duration(milliseconds: 140)).then((_) {
        setState(() {
          currentState = AdvanceEditTextType.NONE;
          _mainAxisAlignment = MainAxisAlignment.end;
          internalWidthContainer = 226;
          bottomLeftRadius = 50.0;
          topLeftRadius = 0.0;
          rightSide(InkWell(
            onTap: () {
              widget.onAddClick(widget);
            },
            child: Container(
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ));
          leftSide(InkWell(
            onTap: () {
              widget.onEditClick(widget);
              setState(() {
                widget.enable = true;
              });
            },
            child: Container(
              child:  Padding(
                padding: EdgeInsets.only(
                    top: 12.0, bottom: 12.0, left: 5.0, right: 5.0),
                child:Text(
                'Edit',
                style: TextStyle(color: Colors.white),
              )),
            ),
          ));
        });
      });
    } else if (currentState == AdvanceEditTextType.ADD) {
      Future.delayed(Duration(milliseconds: 140)).then((_) {
        setState(() {
          currentState = AdvanceEditTextType.NONE;
          _mainAxisAlignment = MainAxisAlignment.start;
          internalWidthContainer = 226;
          bottomRightRadius = 0.0;
          rightSide(InkWell(
            onTap: () {
              widget.onAddClick(widget);
            },
            child: Container(
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ));
          leftSide(InkWell(
            onTap: () {
              widget.onEditClick(widget);
              setState(() {
                widget.enable = true;
              });
            },
            child: Container(
              child: Padding(
                padding: EdgeInsets.only(
                    top: 12.0, bottom: 12.0, left: 5.0, right: 5.0),
                child: Text(
                'Edit',
                style: TextStyle(color: Colors.white),
              )),
            ),
          ));
        });
      });
    } else if (currentState == AdvanceEditTextType.FILL) {
      Future.delayed(Duration(milliseconds: 140)).then((_) {
        setState(() {
          currentState = AdvanceEditTextType.NONE;
          _mainAxisAlignment = MainAxisAlignment.center;
          internalWidthContainer = 276;
          rightSide(InkWell(
            onTap: () {},
            child: Container(),
          ));
          leftSide(InkWell(
            onTap: () {},
            child: Container(),
          ));
        });
      });
    } else if (currentState == AdvanceEditTextType.NONE) {}
  }

  Widget rightSide(Widget widget) {
    rightSideWidget = widget;
  }

  Widget leftSide(Widget widget) {
    leftSideWidget = widget;
  }

  make(AdvanceEditTextType type) {
    //internalWidthContainer = 276.0;
    currentState = type;

    setState(() {
      internalWidthContainer = 276.0;
      topRightRadius = 50.0;

      topLeftRadius = 50.0;

      bottomLeftRadius = 50.0;

      bottomRightRadius = 50.0;
    });
  }
}

enum AdvanceEditTextType { EDIT, ADD, SAVE, EDIT_ADD, NONE, FILL }
