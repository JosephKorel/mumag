import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/services/user/domain/database/user_db_events.dart';
import 'package:mumag/common/services/user/providers/user_provider.dart';
import 'package:mumag/features/home/presentation/providers/connect.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<void> connect() async {
      await ref.read(handleConnectionProvider.notifier).connect();
    }

    Future<void> findUser() async {
      final user = await ref
          .read(userApiProvider)
          .getUser(
            getParams: GetParams(email: 'jsoe'),
          )
          .run();
    }

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Text('Home Page'),
          ElevatedButton(
            onPressed: connect,
            child: const Text('CONNECT'),
          ),
          ElevatedButton(
            onPressed: findUser,
            child: const Text('FETCH USER'),
          ),
        ],
      ),
    );
  }
}
