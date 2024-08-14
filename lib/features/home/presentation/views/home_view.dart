import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_fruits/core/firebase/firestore_service.dart';
import 'package:fresh_fruits/features/home/presentation/manger/items_cubit/items_cubit.dart';
import 'package:fresh_fruits/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ItemsCubit(fireStoreService: FireStoreService()),
      child: const HomeViewBody(),
    );
  }
}
