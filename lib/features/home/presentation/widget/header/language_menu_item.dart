import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supercycle_site/core/cubits/local_cubit.dart';

class LanguageMenuItem extends StatefulWidget {
  const LanguageMenuItem({
    super.key,
    required this.label,
    required this.code,
  });

  // ✅ اتشال الـ flag parameter
  final String label;
  final String code;

  @override
  State<LanguageMenuItem> createState() => _LanguageMenuItemState();
}

class _LanguageMenuItemState extends State<LanguageMenuItem> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalCubit, LocalState>(
      builder: (context, state) {
        final currentLang =
        state is ChangeLocalState ? state.locale.languageCode : 'en';
        final isSelected = currentLang == widget.code;

        return MouseRegion(
          onEnter: (_) => setState(() => _hovered = true),
          onExit: (_) => setState(() => _hovered = false),
          cursor: SystemMouseCursors.click,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: _hovered
                  ? const Color(0xFFF0F2F8)
                  : isSelected
                  ? const Color(0xFFF8F9FF)
                  : Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                // ✅ Code Badge بدل الـ flag - static تماماً، مفيش تحميل
                Container(
                  width: 32,
                  height: 22,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? const Color(0xFF3D3D8F)
                        : const Color(0xFFE8E8F0),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    widget.code.toUpperCase(), // "EN" أو "AR"
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: isSelected ? Colors.white : const Color(0xFF5A5A6E),
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  widget.label,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight:
                    isSelected ? FontWeight.w600 : FontWeight.w400,
                    color: isSelected
                        ? const Color(0xFF3D3D8F)
                        : const Color(0xFF5A5A6E),
                  ),
                ),
                const Spacer(),
                if (isSelected)
                  const Icon(
                    Icons.check_rounded,
                    size: 18,
                    color: Color(0xFF3D3D8F),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}