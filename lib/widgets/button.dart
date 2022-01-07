import 'package:flutter/material.dart';
import 'package:oi_app/core/const_data.dart';
import 'package:oi_app/utils/appTheme.dart';


class RaisedButtonCustom extends StatelessWidget {
  final Widget child;
  final String btnText;
  final  Function onPressed;
  final Color btnColor;
  final Color btnTextColor;
  final double width;
  final double height;
  final Color disabledColor;
  final Color disabledTextColor;
   final double borderRadius;
  final Color borderColor;

  const RaisedButtonCustom({
    Key key,
    this.child,
    this.btnText,
    @required this.onPressed,
    this.btnColor,
    this.btnTextColor = Colors.white,
    this.width ,
    this.height = 46,
    this.disabledColor,
    this.borderColor,
    this.disabledTextColor, this.borderRadius = 10.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: RaisedButton(
         disabledColor: disabledColor ?? AppTheme.secondaryColor.withOpacity(0.5),
          disabledTextColor: disabledTextColor,
          onPressed: onPressed,
          elevation: 0,
          textColor: btnTextColor,
          
          shape: RoundedRectangleBorder(side:BorderSide(color: borderColor??lightColor) ,
                borderRadius: BorderRadius.circular(borderRadius),
              ),

          color: btnColor ?? Theme.of(context).accentColor,
          child: child ??
              Text(
                btnText,
                style: Theme.of(context)
                    .textTheme
                    .button
                    .copyWith(color: btnTextColor,fontSize:20),
              )),
    );
  }
}

class FlatButtonCustom extends StatelessWidget {
  final Widget widget;
  final String btnText;
  final Function onPressed;
  final Color btnColor;
  final Color borderColor;
  final double borderRadius;

  const FlatButtonCustom({
    Key key,
    this.widget,
    this.btnText,
    this.onPressed,
    this.btnColor = Colors.white,
    this.borderRadius = 10.0,
    this.borderColor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FlatButton(
        disabledColor: Theme.of(context).buttonColor.withOpacity(0.5),
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          side: BorderSide(
              width: 0.5, color: borderColor ?? Theme.of(context).buttonColor),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        color: btnColor,
        textColor: Theme.of(context).buttonColor,
        child: widget ?? Text(btnText));
  }
}
