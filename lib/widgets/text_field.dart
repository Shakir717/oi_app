import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:oi_app/core/const_data.dart';

import 'boolean_values.dart';

class TextFieldCustom extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final String Function(String) validator;
  final Function(String) onFieldSubmit;
  final Function onChanged;
  final Function onTap;
  final String hintText;
  final Function onTapSuffixIcon;
  final Function onTapPrefixIcon;
  final IconData suffixIconData;
  final IconData prefixIconData;
  final FocusNode focusNode;
  final Color backgroundColor;
  final Color hintTextColor;
  final Color cursorColor;
  final Color textColor;
  final Color prefixIconColor;
  final Color sufixIconColor;
  final Widget prefixWidget;
  final TextInputType inputType;
  final bool obscureText;
  final double borderRadius;
  final double borderWidth;
  final Color borderColor;
  final bool borderSide;
  final String errorText;
  final String initialValue;
  final bool readOnly;
  final List<TextInputFormatter> inputFormatters;
  final int maxLines;
  final int maxLength;
  final TextAlign textAlign;

  static const Color _textFieldThemeColor = const Color(0xff3d475a);

  const TextFieldCustom({
    Key key,
    this.readOnly = false,
    this.inputFormatters,
    this.textAlign,
    this.labelText,
    this.controller,
    this.validator,
    this.onFieldSubmit,
    this.hintText,
    this.onTapSuffixIcon,
    this.suffixIconData,
    this.prefixIconData,
    this.onTapPrefixIcon,
    this.focusNode,
    this.backgroundColor = Colors.white,
    this.hintTextColor = _textFieldThemeColor,
    this.cursorColor = _textFieldThemeColor,
    this.textColor = _textFieldThemeColor,
    this.prefixIconColor = const Color(0xff3d475a),
    this.sufixIconColor = const Color(0xff3d475a),
    this.borderColor = const Color(0xff3d475a),
    this.prefixWidget,
    this.inputType = TextInputType.text,
    this.obscureText = false,
    this.borderRadius = 10,
    this.borderSide = false,
    this.onTap,
    this.onChanged,
    this.errorText,
    this.initialValue,
    this.borderWidth = 0.2,
    this.maxLines = 1,
    this.maxLength
  }) : super(key: key);

  Widget build(BuildContext context) {
    return TextFormField(
        textAlign:textAlign??TextAlign.start,
      maxLines: maxLines,
      maxLength: maxLength,
      inputFormatters: inputFormatters,
      readOnly: readOnly,
      initialValue: initialValue,
      onChanged: onChanged,
      onTap: onTap,
      obscureText: obscureText,
      keyboardType: inputType,
      focusNode: focusNode,
      validator: validator,
      cursorWidth: 1,
      cursorColor: cursorColor,
      autofocus: false,
      controller: controller,
      style: Theme.of(context).textTheme.bodyText2.copyWith(
          decoration: TextDecoration.none,
          fontSize: 18,
          color: textColor,
          fontWeight: FontWeight.w600),
      onFieldSubmitted: onFieldSubmit,
      decoration: InputDecoration(
          filled: true,
          fillColor: backgroundColor,
          errorMaxLines: 3,
          hoverColor: Colors.white,
          errorText: errorText,
          labelText: labelText,
          labelStyle: Theme.of(context)
              .textTheme
              .bodyText2
              .copyWith(color:hintTextColor, fontSize: 18, fontWeight: FontWeight.bold),
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.bodyText2.copyWith(
              fontWeight: FontWeight.w500, fontSize: 16, color: hintTextColor),
          contentPadding: EdgeInsets.symmetric(
              horizontal: 20, vertical: maxLines > 1 ? 20 :20),
          suffixIcon: suffixIconData == null
              ? null
              : GestureDetector(
                  onTap: onTapSuffixIcon,
                  child: Icon(
                    suffixIconData,
                    size: 16,
                    color: sufixIconColor,
                  ),
                ),
          prefixIcon: prefixWidget != null
              ? prefixWidget
              : prefixIconData == null
                  ? null
                  : GestureDetector(
                      onTap: onTapPrefixIcon,
                      child: Icon(
                        prefixIconData,
                        size: 16,
                        color: prefixIconColor,
                      ),
                    ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: borderSide == true
                ? BorderSide(
                    color: borderColor,
                  )
                : BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: borderSide == true
                ? BorderSide(color: borderColor, width: borderWidth)
                : BorderSide.none,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: borderSide == true
                ? BorderSide(color: borderColor, width: borderWidth)
                : BorderSide.none,
          )),
      //  ),
    );
  }
}

class TextFieldPassword extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final String Function(String) validator;
  final Function(String) onFieldSubmit;
  final Function onChanged;
  final Function onTap;
  final String hintText;
  final Function onTapSuffixIcon;
  final Function onTapPrefixIcon;
  final IconData suffixIconData;
  final IconData prefixIconData;
  final FocusNode focusNode;
  final Color backgroundColor;
  final Color hintTextColor;
  final Color cursorColor;
  final Color textColor;
  final Color prefixIconColor;
  final Color sufixIconColor;
  final Widget prefixWidget;
  final TextInputType inputType;
  final bool obscureText;
  final double borderRadius;
  final double borderWidth;
  final Color borderColor;
  final bool borderSide;
  final String errorText;
  final String initialValue;
  final bool readOnly;
  final List<TextInputFormatter> inputFormatters;
  final int maxLines;

  static const Color _textFieldThemeColor = const Color(0xff3d475a);

  const TextFieldPassword({
    Key key,
    this.readOnly = false,
    this.inputFormatters,
    this.labelText,
    this.controller,
    this.validator,
    this.onFieldSubmit,
    this.hintText,
    this.onTapSuffixIcon,
    this.suffixIconData,
    this.prefixIconData,
    this.onTapPrefixIcon,
    this.focusNode,
    this.backgroundColor = Colors.white,
    this.hintTextColor = _textFieldThemeColor,
    this.cursorColor = _textFieldThemeColor,
    this.textColor = _textFieldThemeColor,
    this.prefixIconColor = const Color(0xff3d475a),
    this.sufixIconColor = const Color(0xff3d475a),
    this.borderColor = const Color(0xff3d475a),
    this.prefixWidget,
    this.inputType = TextInputType.text,
    this.obscureText = false,
    this.borderRadius = 10,
    this.borderSide = false,
    this.onTap,
    this.onChanged,
    this.errorText,
    this.initialValue,
    this.borderWidth = 0.2,
    this.maxLines = 1,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return GetBuilder<BooleanValues>(
      init: BooleanValues(),
      builder: (data) {
        return TextFormField(
          maxLines: maxLines,
          inputFormatters: inputFormatters,
          readOnly: readOnly,
          initialValue: initialValue,
          onChanged: onChanged,
          onTap: onTap,
          obscureText: data.obscureText,
          keyboardType: inputType,
          focusNode: focusNode,
          validator: validator,
          cursorWidth: 1,
          cursorColor: cursorColor,
          autofocus: false,
          controller: controller,
          style: Theme.of(context).textTheme.bodyText2.copyWith(
              decoration: TextDecoration.none,
              fontSize: 18,
              color: textColor,
              fontWeight: FontWeight.w600),
          onFieldSubmitted: onFieldSubmit,
          decoration: InputDecoration(
              filled: true,
              fillColor: backgroundColor,
              errorMaxLines: 3,
              hoverColor: Colors.white,
              errorText: errorText,
              labelText: labelText,
              labelStyle: Theme.of(context).textTheme.bodyText2.copyWith(
                  color:hintTextColor, fontSize: 18, fontWeight: FontWeight.bold),
              hintText: hintText,
              hintStyle: Theme.of(context).textTheme.bodyText2.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: hintTextColor),
              contentPadding: EdgeInsets.symmetric(
                  horizontal: 20,  vertical: maxLines > 1 ? 40 :20),
              suffixIcon: suffixIconData == null
                  ? null
                  : GestureDetector(
                      onTap: () {
                        data.updateObscureText();
                      },
                      child: !data.obscureText
                          ? Icon(
                              Icons.visibility,
                              size: 16,
                              color: lightColor,
                            )
                          : Icon(
                              Icons.visibility_off,
                              size: 16,
                              color: lightColor,
                            ),
                    ),
              prefixIcon: prefixWidget ?? prefixIconData == null
                      ? null
                      : GestureDetector(
                          onTap: onTapPrefixIcon,
                          child: Icon(
                            prefixIconData,
                            size: 16,
                            color: lightColor,
                          ),
                        ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: borderSide == true
                    ? BorderSide(
                        color: borderColor,
                      )
                    : BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: borderSide == true
                    ? BorderSide(color: borderColor, width: borderWidth)
                    : BorderSide.none,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: borderSide == true
                    ? BorderSide(color: borderColor, width: borderWidth)
                    : BorderSide.none,
              )),
          //  ),
        );
      },
    );
  }
}
