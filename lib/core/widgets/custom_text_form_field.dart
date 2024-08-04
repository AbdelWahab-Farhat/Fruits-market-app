import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fresh_fruits/constants.dart';


class CustomTextFormField extends StatefulWidget {
  final String hint;
  final bool? isPassword;
  final String? svgIconUrl;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;

  const CustomTextFormField({
    super.key,
    required this.hint,
    this.isPassword,
    this.svgIconUrl,
    this.validator,
    this.onSaved,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _isPassword;
  @override
  void initState() {
    super.initState();
    _isPassword = widget.isPassword ?? false;
  }

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder focusedBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(32),
      borderSide: const BorderSide(color: kOrange),
    );
    OutlineInputBorder enabledBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(32),
      borderSide: const BorderSide(color: Color(0xffCACACA)),
    );

    return TextFormField(
      obscureText: _isPassword,
      validator: widget.validator,
      onSaved: widget.onSaved,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        hintText: widget.hint,
        focusedBorder: focusedBorder,
        enabledBorder: enabledBorder,
        suffixIcon: widget.svgIconUrl != null
            ? GestureDetector(
          onTap: () {
            setState(() {
              _isPassword = !_isPassword;
            });
          },
          child: SvgPicture.asset(
            widget.svgIconUrl!,
            colorFilter: ColorFilter.mode(
              _isPassword ? Colors.blue : Colors.black,
              BlendMode.srcIn,
            ),
            width: 24, // Adjusted to 24 for better visibility
            height: 24, // Adjusted to 24 for better visibility
            fit: BoxFit.scaleDown,
          ),
        )
            : null,
      ),
    );
  }
}