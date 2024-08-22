import 'package:flutter/material.dart';
import 'package:fresh_fruits/core/utility/app_style.dart';
import '../../../../../constants.dart';

class CommentInputWidget extends StatefulWidget {
  final Function(String) onCommentSubmitted;

  const CommentInputWidget({
    super.key,
    required this.onCommentSubmitted,
  });

  @override
  State<CommentInputWidget> createState() => _CommentInputWidgetState();
}

class _CommentInputWidgetState extends State<CommentInputWidget> {
  final TextEditingController _controller = TextEditingController();

  void _submitComment() {
    if (_controller.text.isNotEmpty) {
      widget.onCommentSubmitted(_controller.text);
      _controller.clear();
    }
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            controller: _controller,
            decoration:  InputDecoration(
              suffixIcon: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                child: GestureDetector(
                    onTap: () =>  _submitComment(),
                    child: Text('Send',style: AppStyle.style16,textAlign: TextAlign.center,)),
              ),
              floatingLabelStyle: AppStyle.style14,
              hintText: 'Add a comment',
              focusedBorder: focusedBorder,
              enabledBorder: enabledBorder
            ),
            minLines: 1,
            maxLines: 3,
            onSubmitted: (value) => _submitComment(),
          ),
        ],
      ),
    );
  }
}
