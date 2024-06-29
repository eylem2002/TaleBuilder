import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tale/core/functions/all_actions.dart';
import 'package:tale/utils/theme/theme_manager.dart';

class VoiceSettingsSlider extends StatelessWidget {
  final RxDouble value;
  const VoiceSettingsSlider({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Slider(
        max: 1,
        divisions: 100,
        label: "Similarity Boost: ${value.toString()}",
        value: value.value,
        onChanged: (newValue) {
          value.value = newValue;
        }));
  }
}

class CircularMic extends StatelessWidget {
  const CircularMic({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
            color: ThemeManager.second,
            shape: BoxShape.circle,
            boxShadow: [shadowGlow]),
        child: Icon(
          Icons.mic,
          color: ThemeManager.dark,
        ),
      ),
    );
  }
}

class ListDropDown extends StatefulWidget {
  final List<String> dropDownList;
  final Function(String) onListSelect;
  final BoxDecoration decoration2;

  const ListDropDown({
    Key? key,
    required this.dropDownList,
    required this.onListSelect,
    required this.decoration2,
  }) : super(key: key);

  @override
  State<ListDropDown> createState() => _ListDropDownState();
}

class _ListDropDownState extends State<ListDropDown> {
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue =
        widget.dropDownList.isNotEmpty ? widget.dropDownList[0] : null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        decoration: widget.decoration2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<String>(
              dropdownColor: ThemeManager.backlist,
              value: selectedValue,
              icon: Icon(
                Icons.arrow_drop_down,
                color: ThemeManager.primary,
              ),
              iconSize: 24,
              elevation: 16,
              alignment: Alignment.center,
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).primaryColorLight,
              ),
              underline: Container(),
              onChanged: (newValue) {
                setState(() {
                  selectedValue = newValue;
                  if (newValue != null) {
                    widget.onListSelect(newValue);
                  }
                });
              },
              items: widget.dropDownList
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Center(
                    child: Text(
                      value,
                      style: TextStyle(
                        color: ThemeManager.second,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class TextFieldX extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPass;
  final int? multiLine;
  const TextFieldX(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.isPass,
      this.multiLine});

  @override
  State<TextFieldX> createState() => _TextFieldXState();
}

class _TextFieldXState extends State<TextFieldX> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Stack(
        children: [
          CupertinoTextField(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            maxLines: widget.multiLine ?? 1,
            maxLength: 2500,
            style: TextStyle(
              fontSize: width / 23,
              color: ThemeManager.white,
              fontWeight: FontWeight.w400,
            ),
            obscureText: widget.isPass ? isObscure : widget.isPass,
            controller: widget.controller,
            prefix: Padding(
              padding: EdgeInsets.only(left: width / 40),
            ),
            textInputAction: TextInputAction.next,
            cursorColor: ThemeManager.white,
            placeholder: widget.hintText,
            keyboardType: TextInputType.text,
            placeholderStyle: TextStyle(
              fontSize: width / 23,
              color: ThemeManager.white,
              fontWeight: FontWeight.w400,
            ),
            decoration: BoxDecoration(
              color: ThemeManager.dark,
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              boxShadow: [shadowGlow],
            ),
            suffixMode: OverlayVisibilityMode.editing,
            suffix: widget.isPass
                ? IconButton(
                    icon: Icon(
                      isObscure
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: ThemeManager.white,
                      size: height / 32,
                    ),
                    onPressed: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                  )
                : null,
            onChanged: (value) {
              if (widget.isPass == true) {
                AllActions().saveSharedPref("API_Key", value);
              }
              setState(() {});
            },
          ),
          Visibility(
            visible: widget.multiLine == 5 ? true : false,
            child: Positioned(
              bottom: 5,
              right: 5,
              child: Text(
                '${widget.controller.text.length}/2500',
                style: TextStyle(
                  color: ThemeManager.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
