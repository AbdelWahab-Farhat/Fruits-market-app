import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_fruits/core/utility/helper.dart';
import 'package:fresh_fruits/core/widgets/custom_loading_widget.dart';
import 'package:fresh_fruits/features/item_details/presentation/manger/comment_cubit/comment_cubit.dart';
import 'package:fresh_fruits/features/item_details/presentation/manger/item_details_cubit/item_details_cubit.dart';
import '../../../../auth/presentation/manger/sign_in_cubit/sign_in_cubit.dart';
import 'comment_text_field.dart';
import 'comment_widget.dart';

class CommentSection extends StatefulWidget {
  const CommentSection({super.key});

  @override
  State<CommentSection> createState() => _CommentSectionState();
}

class _CommentSectionState extends State<CommentSection> {
  @override
  void initState() {
    super.initState();
    _fetchComments();
  }

  void _fetchComments() {
    final item = context.read<ItemDetailsCubit>().item;
    final commentCubit = context.read<CommentCubit>();
    commentCubit.fetchComments(item);
  }

  @override
  Widget build(BuildContext context) {
    final commentCubit = context.read<CommentCubit>();
    final signInCubit = context.read<SignInCubit>();

    return Column(
      children: [
        Expanded(
          child: _buildCommentList(commentCubit),
        ),
        _buildCommentInput(commentCubit, signInCubit),
      ],
    );
  }

  Widget _buildCommentList(CommentCubit commentCubit) {
    return BlocBuilder<CommentCubit, CommentState>(
      builder: (context, state) {
        if (commentCubit.itemComments == null || commentCubit.itemComments!.isEmpty) {
          return const Center(child: Text('No Comments Yet'));
        }
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: commentCubit.itemComments!.length,
          itemBuilder: (context, index) {
            final comment = commentCubit.itemComments![index];
            return CommentWidget(
              userName: comment.customerName,
              comment: comment.content,
            );
          },
        );
      },
    );
  }

  Widget _buildCommentInput(CommentCubit commentCubit, SignInCubit signInCubit) {
    return BlocConsumer<CommentCubit, CommentState>(
      listener: (context, state) {
        if (state is CommentPosted) {
          if (state.successMessage == '') {
            return;
          }
          showTopSnackBar(context, "Your Review Added Successfully");
        } else if (state is CommentFailed) {
          showTopSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is CommentLoading) {
          return const CustomLoadingWidget();
        }
        return CommentInputWidget(
          onCommentSubmitted: (content) {
            commentCubit.postComment(content, signInCubit.customer!, context.read<ItemDetailsCubit>().item);
          },
        );
      },
    );
  }
}
