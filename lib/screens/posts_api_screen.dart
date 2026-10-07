import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/posts_provider.dart';
import '../widgets/next_previous_bar.dart';
import 'family_screen.dart';

class PostsApiScreen extends ConsumerWidget {
  const PostsApiScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // The UI does not know the URL. It only gets loading / error / data.
    final async = ref.watch(postsProvider);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('GET Posts API'),
      ),
      bottomNavigationBar: const NextPreviousBar(next: FamilyScreen()),
      body: async.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$error'),
              const SizedBox(height: 12),
              FilledButton(
                onPressed: () => ref.invalidate(postsProvider),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
        data: (posts) => RefreshIndicator(
          // Pull to refresh = invalidate = call the API again.
          onRefresh: () async => ref.invalidate(postsProvider),
          child: ListView.separated(
            itemCount: posts.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final post = posts[index];
              return ListTile(
                leading: CircleAvatar(child: Text('${post.id}')),
                title: Text(post.title),
                subtitle: Text(
                  post.body,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
