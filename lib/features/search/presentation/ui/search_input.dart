import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/theme/utils.dart';

class SearchInput extends ConsumerStatefulWidget {
  const SearchInput({
    required this.onChanged,
    this.provider,
    super.key,
  });

  final void Function(String value) onChanged;
  final ProviderOrFamily? provider;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchInputState();
}

class _SearchInputState extends ConsumerState<SearchInput> {
  final _controller = TextEditingController();

  void _clear() {
    _controller.clear();
    if (widget.provider != null) {
      ref.invalidate(widget.provider!);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final value = _controller.value.text;

    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: TextField(
        controller: _controller,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          hintText: 'Search',
          suffixIcon: IconButton(
            onPressed: value.isEmpty ? null : _clear,
            icon: Icon(
              Icons.clear,
              color: value.isEmpty ? Colors.transparent : null,
            ),
          ),
          filled: true,
          fillColor: context.onSurface.withOpacity(0.1),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
