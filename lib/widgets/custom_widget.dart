// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:authentication_ui/common/common.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class CustomTextFormField extends StatefulWidget {
  final String hinttext;
  final bool obsecuretext;
  final TextEditingController? controller;
  final InputDecoration? decoration;
  final bool addSuffix; // 新增的屬性

  const CustomTextFormField({
    Key? key,
    required this.hinttext,
    required this.obsecuretext,
    this.controller,
    this.decoration,
    this.addSuffix = false, // 預設值為 false
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  void initState() {
    super.initState();
    widget.controller?.addListener(_handleTextChanged);
  }

  @override
  void dispose() {
    widget.controller?.removeListener(_handleTextChanged);
    super.dispose();
  }

   void _handleTextChanged() {
    if (widget.addSuffix && !widget.controller!.text.endsWith('@mail.nknu.edu.tw')) {
      widget.controller!.text = widget.controller!.text + '@mail.nknu.edu.tw';
      widget.controller!.selection = TextSelection.fromPosition(
        TextPosition(
            offset:
                widget.controller!.text.length - '@mail.nknu.edu.tw'.length),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.obsecuretext,
      decoration: widget.decoration?.copyWith(
            contentPadding: EdgeInsets.all(18),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(12),
            ),
            hintText: widget.hinttext,
            hintStyle: Common().hinttext,
          ) ??
          InputDecoration(
            contentPadding: EdgeInsets.all(18),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(12),
            ),
            hintText: widget.hinttext,
            hintStyle: Common().hinttext,
          ),
    );
  }
}

class CustomElevatedButton extends StatefulWidget {
  final String message;
  final FutureOr<void> Function() function;
  final Color? color;
  const CustomElevatedButton({
    Key? key,
    required this.message,
    required this.function,
    this.color,
  }) : super(key: key);

  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        setState(() {
          loading = true;
        });
        await widget.function();
      
        setState(() {
          loading = false;
        });
      },
      style: ButtonStyle(
          side: MaterialStatePropertyAll(BorderSide(color: Colors.black)),
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
          fixedSize: const MaterialStatePropertyAll(Size.fromWidth(370)),
          padding: MaterialStatePropertyAll(
            EdgeInsets.symmetric(vertical: 20),
          ),
          backgroundColor: MaterialStatePropertyAll(widget.color)),
      child: loading
          ? const CupertinoActivityIndicator()
          : FittedBox(
              child: Text(
              widget.message,
              style: Common().semiboldwhite,
            )),
    );
  }
}

class DynamicFilledButton extends StatefulWidget {
  const DynamicFilledButton(
      {super.key, required this.child, required this.onPressed, this.color});

  final Widget child;
  // final VoidCallback onPressed;
  final Color? color;
  final FutureOr<void> Function() onPressed;

  @override
  State<DynamicFilledButton> createState() => _DynamicFilledButtonState();
}

class _DynamicFilledButtonState extends State<DynamicFilledButton> {
  bool isLoading = false;

  func() async {
    FocusManager.instance.primaryFocus?.unfocus();

    setState(() {
      isLoading = true;
    });

    await widget.onPressed();

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return FractionallySizedBox(
        widthFactor: .8,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CupertinoButton(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            color: widget.color ?? Common().black,
            onPressed: isLoading ? null : func,
            child:
                isLoading ? const CupertinoActivityIndicator() : widget.child,
          ),
        ),
      );
    }
    return FractionallySizedBox(
      widthFactor: .8,
      child: SizedBox(
        height: 48,
        child: FilledButton(
          style: FilledButton.styleFrom(
            backgroundColor: widget.color ?? Common().maincolor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),
          onPressed: isLoading ? null : func,
          child: isLoading
              ? const SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(),
                )
              : widget.child,
        ),
      ),
    );
  }
}
