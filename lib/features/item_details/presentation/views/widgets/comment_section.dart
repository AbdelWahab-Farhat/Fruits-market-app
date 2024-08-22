import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_fruits/core/utility/helper.dart';
import 'package:fresh_fruits/core/widgets/custom_loading_widget.dart';
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
    final itemDetailsCubit = context.read<ItemDetailsCubit>();
    itemDetailsCubit.fetchComments();
  }

  @override
  Widget build(BuildContext context) {
    final itemDetailsCubit = context.read<ItemDetailsCubit>();
    final signInCubit = context.read<SignInCubit>();

    return Column(
      children: [
        Expanded(
          child: _buildCommentList(itemDetailsCubit),
        ),
        _buildCommentInput(itemDetailsCubit, signInCubit),
      ],
    );
  }

  Widget _buildCommentList(ItemDetailsCubit itemDetailsCubit) {
    return BlocBuilder<ItemDetailsCubit, ItemDetailsState>(
      builder: (context, state) {
        if (itemDetailsCubit.itemComments == null || itemDetailsCubit.itemComments!.isEmpty) {
          return const Center(child: Text('No Comments Yet'));
        }
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: itemDetailsCubit.itemComments!.length,
          itemBuilder: (context, index) {
            final comment = itemDetailsCubit.itemComments![index];
            return CommentWidget(
              userName: comment.customerName,
              comment: comment.content,
            );
          },
        );
      },
    );
  }

  Widget _buildCommentInput(ItemDetailsCubit itemDetailsCubit, SignInCubit signInCubit) {
    return BlocConsumer<ItemDetailsCubit, ItemDetailsState>(
      listener: (context, state) {
        if (state is ItemDetailsCommentPosted) {
          if (state.successMessage == '') {
            return;
          }
          showTopSnackBar(context, "Your Review Added Successfully");
        } else if (state is ItemDetailsCommentFailed) {
          showTopSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is ItemDetailsCommentLoading) {
          return const CustomLoadingWidget();
        }
        return CommentInputWidget(
          onCommentSubmitted: (content) {
            itemDetailsCubit.postComment(content, signInCubit.customer!);
          },
        );
      },
    );
  }
}
