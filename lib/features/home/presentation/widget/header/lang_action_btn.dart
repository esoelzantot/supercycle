import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supercycle_site/core/cubits/local_cubit.dart';
import 'package:supercycle_site/features/home/presentation/widget/header/language_menu_item.dart';
import 'package:supercycle_site/generated/l10n.dart';

class LangActionBtn extends StatefulWidget {
  const LangActionBtn({super.key});

  @override
  State<LangActionBtn> createState() => _LangActionBtnState();
}

class _LangActionBtnState extends State<LangActionBtn> {
  bool _hovered = false;

  static const _languages = [
    {'code': 'en', 'label': 'English', 'flag': '🇺🇸'},
    {'code': 'ar', 'label': 'العربية', 'flag': '🇸🇦'},
  ];

  void _showLanguageMenu(BuildContext context) async {
    final RenderBox button = context.findRenderObject() as RenderBox;
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;

    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        button.localToGlobal(
          button.size.bottomLeft(Offset.zero),
          ancestor: overlay,
        ),
        button.localToGlobal(
          button.size.bottomRight(Offset.zero),
          ancestor: overlay,
        ),
      ),
      Offset.zero & overlay.size,
    );

    final String? selectedCode = await showMenu<String>(
      context: context,
      position: position,
      elevation: 8,
      shadowColor: Colors.black26,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white,
      items: _languages.map((lang) {
        return PopupMenuItem<String>(
          value: lang['code'],
          padding: EdgeInsets.zero,
          child: LanguageMenuItem(
            flag: lang['flag']!,
            label: lang['label']!,
            code: lang['code']!,
          ),
        );
      }).toList(),
    );

    if (selectedCode != null && context.mounted) {
      context.read<LocalCubit>().changeLang(selectedCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: S.of(context).lang_btn,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        child: GestureDetector(
          onTap: () => _showLanguageMenu(context),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: _hovered ? Colors.grey.shade100 : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.language_rounded,
              size: 20,
              color: _hovered
                  ? Color(0xFF3D4A5C).withValues(alpha: 0.7)
                  : Color(0xFF3D4A5C),
            ),
          ),
        ),
      ),
    );
  }
}
