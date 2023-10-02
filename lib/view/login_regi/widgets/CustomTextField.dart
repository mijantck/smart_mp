import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../utils/AppColors.dart';
import '../../../utils/AppString.dart';

class CustomTextField extends StatefulWidget {
  final String title;
  final String title_hints;
  final TextEditingController controller;
  final bool isPassword;

  CustomTextField(this.title, this.title_hints, this.controller, {this.isPassword = false});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
   bool isPassword  = false;
   bool isPasswordShow = false;

  @override
  void initState() {
    super.initState();
    isPassword = true;
    isPasswordShow = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(widget.title, style: TextStyle(color: AppColors.text_black, fontSize: 17, fontWeight: FontWeight.w500)),
            ],
          ),
          SizedBox(height: 4),
          Container(
            height: 50,
            child: TextField(
              controller: widget.controller,
              obscureText: widget.isPassword ? isPassword: widget.isPassword,
              keyboardType: widget.isPassword? isPassword ? TextInputType.text : TextInputType.visiblePassword : TextInputType.text,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(
                    color: AppColors.home_bg, // Set the border color
                  ),
                ),
                hintText: widget.title_hints, // Custom hint text
                hintStyle: TextStyle(
                  color: Colors.grey, // Custom hint text color
                ),

                suffixIcon:isPasswordShow? IconButton(
                  icon: Icon(isPassword ? CupertinoIcons.eye : CupertinoIcons.eye_slash,color: CupertinoColors.activeBlue,),
                  onPressed: () {
                    setState(() {
                      isPassword = !isPassword;
                    });
                  },
                ): null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
