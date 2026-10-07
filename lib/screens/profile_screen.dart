import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/profile_provider.dart';
import '../widgets/next_previous_bar.dart';
import 'todo_screen.dart';


//consumer -> which
//select -> when
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('copyWith + select'),
      ),
      bottomNavigationBar: const NextPreviousBar(next: TodoScreen()),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: ListTile(
                // Consumer 1: green dot. Listens ONLY to isOnline.
                leading: Consumer(
                  builder: (context, ref, _) {
                    final isOnline =
                        ref.watch(profileProvider.select((p) => p.isOnline));
                    return CircleAvatar(
                      radius: 10,
                      backgroundColor: isOnline ? Colors.green : Colors.grey,
                    );
                  },
                ),
                // Consumer 2: the name. Listens ONLY to name.
                title: Consumer(
                  builder: (context, ref, _) {
                    final name =
                        ref.watch(profileProvider.select((p) => p.name));
                    return Text(name.isEmpty ? 'Your name' : name);
                  },
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Consumer 3: TextField. Watches nothing, only changes the name.
            Consumer(
              builder: (context, ref, _) {
                return TextField(
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    final notifier = ref.read(profileProvider.notifier);
                    // copyWith: change name, keep isOnline the same.
                    notifier.state = notifier.state.copyWith(name: value);
                  },
                );
              },
            ),
            const SizedBox(height: 16),
            // Consumer 4: Switch. Listens ONLY to isOnline.
            Consumer(
              builder: (context, ref, _) {
                final isOnline =
                    ref.watch(profileProvider.select((p) => p.isOnline));
                return SwitchListTile(
                  title: const Text('Online'),
                  value: isOnline,
                  onChanged: (value) {
                    final notifier = ref.read(profileProvider.notifier);
                    // copyWith: change isOnline, keep name the same.
                    notifier.state = notifier.state.copyWith(isOnline: value);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
