import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';

class TextFieldComponent extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText;
  final String? hintLabelText;
  final String? labelText;
  final bool isPassword;
  final bool isRequired;
  final String? Function(String?)? validator;
  final Function(String _)? onChanged;

  final Function()? onEditingCompleted;
  final TextInputType keyboardType;
  final int maxLength;
  final dynamic suffixIcon;
  final Function()? onSuffixPressed;
  final Widget? prefixWidget;
  final Color? fillColor;
  final bool enlargePrfixWidget;
  final Color labelColor;
  final bool readOnly;
  final bool enabled;
  final int? maxLines;
  final VoidCallback? onTap;
  final FocusNode currentFocus;
  final FocusNode? nextFocus;
  final EdgeInsetsGeometry? padding;
  final bool isSmall;
  final TextStyle? hintTextStyle;
  final TextStyle? textStyle;
  final List<TextInputFormatter>? formatter;
  final TextAlign textAlign;
  final Color borderColor;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusErrorBorder;
  final double? borderRadius;
  final TextCapitalization? textCapitalization;
  final bool enableSuggestions;
  final bool autocorrect;
  final FontWeight? labelFontWeight;

  const TextFieldComponent(
    this.controller, {
    super.key,
    this.hintText,
    this.labelText,
    this.isPassword = false,
    this.isRequired = false,
    this.validator,
    this.onChanged(String _)?,
    this.onEditingCompleted,
    this.keyboardType = TextInputType.text,
    this.maxLength = 45,
    this.suffixIcon,
    this.onSuffixPressed,
    this.labelFontWeight,
    this.prefixWidget,
    this.onTap,
    this.fillColor,
    this.enlargePrfixWidget = true,
    this.labelColor = AppColors.labelColor,
    this.readOnly = false,
    this.enabled = true,
    this.maxLines,
    required this.currentFocus,
    this.nextFocus,
    this.padding,
    this.isSmall = false,
    this.hintTextStyle,
    this.textStyle,
    this.formatter,
    this.textAlign = TextAlign.start,
    this.borderColor = Colors.transparent,
    this.enabledBorder,
    this.focusedBorder,
    this.errorBorder,
    this.borderRadius,
    this.textCapitalization,
    this.autocorrect = false,
    this.enableSuggestions = false,
    this.focusErrorBorder,
    this.hintLabelText = '',
  });

  @override
  State<TextFieldComponent> createState() => _TextFieldComponentState();
}

class _TextFieldComponentState extends State<TextFieldComponent> {
  bool _hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return widget.isSmall == false
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _showLabelText(),
              SizedBox(height: 5.0),
              Center(child: _textField()),
            ],
          )
        : _textField();
  }

  Widget _textField() {
    return TextFormField(
      maxLines: widget.maxLines ?? 1,
      controller: widget.controller,
      readOnly: widget.readOnly,
      focusNode: widget.currentFocus,
      enableSuggestions: widget.enableSuggestions,
      autocorrect: widget.autocorrect,
      
      autovalidateMode: AutovalidateMode.onUserInteraction,
      enabled: widget.enabled,
      obscureText: widget.isPassword ? _hidePassword : !_hidePassword,
      maxLength: widget.maxLength,
      textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
      textInputAction: widget.nextFocus != null
          ? TextInputAction.next
          : TextInputAction.done,
      onTap: widget.onTap,
      onChanged: (_) => widget.onChanged == null ? () {} : widget.onChanged!(_),
      onEditingComplete: () => widget.onEditingCompleted == null
          ? () {
              widget.currentFocus.unfocus();
              if (widget.nextFocus != null) {
                widget.nextFocus?.requestFocus();
              }
            }
          : widget.onEditingCompleted!(),
      style: widget.textStyle ??
          TextStyle(
              fontFamily: 'poppin',
              fontSize: 14,
              color: Theme.of(context).secondaryHeaderColor),
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.formatter,
      textAlign: widget.textAlign,
      decoration: InputDecoration(
        counterText: '',
        filled: true,
        errorMaxLines: 2,
        fillColor: widget.fillColor ?? Theme.of(context).highlightColor,
        labelText: "${widget.hintLabelText}",
        floatingLabelBehavior: FloatingLabelBehavior.never,
        errorStyle: TextStyle(color: Theme.of(context).indicatorColor),
        labelStyle: widget.hintTextStyle ??
            TextStyle(
                fontSize: 12,
                color: Theme.of(context).secondaryHeaderColor,
                fontWeight: widget.labelFontWeight ?? FontWeight.w600),
        enabledBorder: widget.enabledBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(color: widget.borderColor),
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
            ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor),
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
        ),
        focusedBorder: widget.focusedBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(color: widget.borderColor),
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
            ),
        errorBorder: widget.errorBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                  color: Theme.of(context).indicatorColor.withOpacity(0.8)),
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
            ),
        focusedErrorBorder: widget.focusErrorBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                  color: Theme.of(context).indicatorColor.withOpacity(0.8)),
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
            ),
        contentPadding: widget.padding ??
            EdgeInsetsDirectional.only(
                start: 16,
                top: 16,
                bottom: 15,
                end: widget.suffixIcon != null ? 0 : 16),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor),
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
        ),
        hintText: widget.hintText ?? '',
        hintStyle: widget.hintTextStyle ??
            TextStyle(
                fontFamily: 'poppin',
                color: Theme.of(context).secondaryHeaderColor),
        prefixIcon: widget.prefixWidget != null
            ? SizedBox(
                width: widget.enlargePrfixWidget ? 102 : null,
                child: widget.prefixWidget,
              )
            : null,
        suffixIcon: widget.isPassword
            ? GestureDetector(
                child: _hidePassword
                    ? Icon(
                        Icons.visibility_off_outlined,
                        color: Theme.of(context).secondaryHeaderColor,
                      )
                    : Icon(
                        Icons.visibility_outlined,
                        color: Theme.of(context).secondaryHeaderColor,
                      ),
                onTap: () {
                  setState(() {
                    _hidePassword = !_hidePassword;
                  });
                },
              )
            : widget.suffixIcon != null && widget.onSuffixPressed != null
                ? GestureDetector(
                    onTap: widget.onSuffixPressed,
                    child: widget.suffixIcon.runtimeType == IconData
                        ? Icon(
                            widget.suffixIcon,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          )
                        : widget.suffixIcon,
                  )
                : null,
      ),
    );
  }

  Widget _showLabelText() {
    if (widget.labelText != null) {
      return Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Row(
          children: [
            Text(
              widget.labelText!,
              style: TextStyle(
                  fontFamily: 'poppin',
                  fontSize: 14,
                  color: widget.labelColor),
            ),
            Text(
              widget.isRequired ? '' : '',
              style: TextStyle(
                  fontFamily: 'poppin',
                  fontSize: 14,
                  color: widget.labelColor),
            ),
          ],
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
