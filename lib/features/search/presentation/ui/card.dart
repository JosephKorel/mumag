import 'package:flutter/material.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:mumag/common/widgets/background_icon.dart';

class SearchOptionCard extends StatelessWidget {
  const SearchOptionCard({
    required this.onPressed,
    required this.icon,
    required this.buttonLabel,
    super.key,
  });

  final String buttonLabel;
  final IconData icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: context.onSurface.withOpacity(0.2)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: BackgroundIcon(
                icon: icon,
              ),
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: TextButton.icon(
                onPressed: onPressed,
                icon: const Icon(Icons.arrow_back_ios),
                label: Text(buttonLabel),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
