import 'package:flutter/material.dart';

// Bottom bar with Previous and Next buttons.
// Previous = go back to the last screen.
// Next = open the next screen (hidden on the last screen).
class NextPreviousBar extends StatelessWidget {
  const NextPreviousBar({super.key, this.next});

  final Widget? next;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            if (Navigator.canPop(context))
              OutlinedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
                label: const Text('Previous'),
              ),
            const Spacer(),
            if (next != null)
              FilledButton.icon(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => next!),
                ),
                icon: const Icon(Icons.arrow_forward),
                label: const Text('Next'),
              ),
          ],
        ),
      ),
    );
  }
}
