import 'package:flutter/material.dart';
import 'package:tale/utils/theme/theme_manager.dart';

class TextFormFieldWidgetSign extends StatefulWidget {
  final bool passToggle;
  final String labelText;
  final TextEditingController passController;
  final String? Function(String?)? validator;
  final String str;
  final double width;
  final double height;
  final Color color;
  final int maxlin, maxlog;
  final IconData iconSufData;

  const TextFormFieldWidgetSign({
    Key? key,
    required this.passToggle,
    required this.passController,
    required this.labelText,
    required this.validator,
    required this.str,
    this.width = 0,
    this.height = 0,
    this.maxlin = 1,
    this.maxlog = 30,
    this.color =const Color(0xffB9CAFD),
    this.iconSufData = Icons.add,
  }) : super(key: key);

  @override
  _TextFormFieldWidgetSignState createState() =>
      _TextFormFieldWidgetSignState();
}

class _TextFormFieldWidgetSignState extends State<TextFormFieldWidgetSign> {
  bool isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 18),
      child: SizedBox(
        width: (widget.width == 0) ? null : widget.width,
        height: (widget.height == 0) ? null : widget.height,
        child: TextFormField(
          maxLines: widget.maxlin,
          maxLength: widget.maxlog,
          textAlign: TextAlign.left,
          keyboardType: TextInputType.emailAddress,
          obscureText: widget.passToggle,
          controller: widget.passController,
          style: TextStyle(
            color: isFocused ? ThemeManager.second : widget.color,
          ),
          decoration: InputDecoration(
            counterText: "",
            prefixIcon: Icon(
              (widget.iconSufData == Icons.add) ? null : widget.iconSufData,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: isFocused ? ThemeManager.second : widget.color,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(5)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: isFocused ? ThemeManager.second : widget.color,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red.withOpacity(0.8),
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red.withOpacity(0.8),
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red.withOpacity(0.8),
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            labelText: widget.labelText,
            isDense: true,
            hintStyle: TextStyle(color: ThemeManager.second),
            hintText: widget.str,
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
          validator: widget.validator,
          onChanged: (value) {
            setState(() {
              isFocused = value.isNotEmpty;
            });
          },
          onTap: () {
            setState(() {
              isFocused = true;
            });
          },
          onEditingComplete: () {
            setState(() {
              isFocused = false;
            });
          },
          onFieldSubmitted: (_) {
            setState(() {
              isFocused = false;
            });
          },
        ),
      ),
    );
  }
}
