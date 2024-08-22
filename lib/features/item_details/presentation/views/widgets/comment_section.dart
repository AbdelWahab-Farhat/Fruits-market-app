import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_fruits/features/item_details/presentation/manger/item_details_cubit/item_details_cubit.dart';

import 'comment_text_field.dart';
import 'comment_widget.dart';

class CommentSection extends StatelessWidget {
  const CommentSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit  = context.read<ItemDetailsCubit>();
    cubit.item.comments?.map((e) =>   CommentWidget(userName: e.customerID, comment: e.content),).toList();
    return Expanded(
      child: Column(
        children: [
          // The comment list is wrapped inside Expanded to take up available space.
          const Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: []
              ),
            ),
          ),
          CommentInputWidget(
            onCommentSubmitted: (p0) {},
          ),
        ],
      ),
    );
  }
}
