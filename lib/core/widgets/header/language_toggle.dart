import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wm_hotel/core/constants/design_constants.dart';
import 'package:wm_hotel/core/cubits/local_cubit/local_cubit.dart';

class LanguageToggle extends StatefulWidget {
  const LanguageToggle({super.key});

  @override
  State<LanguageToggle> createState() => LanguageToggleState();
}

class LanguageToggleState extends State<LanguageToggle> {
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
          child: _LanguageMenuItem(
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
    return GestureDetector(
      onTap: () => _showLanguageMenu(context),
      child: MouseRegion(
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        cursor: SystemMouseCursors.click,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: EdgeInsets.symmetric(
            horizontal: DesignConstants.defaultButton_HP * 0.6,
            vertical: DesignConstants.defaultButton_VP * 0.6,
          ),
          decoration: BoxDecoration(
            color: _hovered ? const Color(0xFFE4E6F0) : const Color(0xFFF0F2F8),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(
            Icons.language_rounded,
            size: 25,
            color: Color(0xFF5A5A6E),
          ),
        ),
      ),
    );
  }
}

class _LanguageMenuItem extends StatefulWidget {
  const _LanguageMenuItem({
    required this.flag,
    required this.label,
    required this.code,
  });

  final String flag;
  final String label;
  final String code;

  @override
  State<_LanguageMenuItem> createState() => _LanguageMenuItemState();
}

class _LanguageMenuItemState extends State<_LanguageMenuItem> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalCubit, LocalState>(
      builder: (context, state) {
        final currentLang = state is ChangeLocalState
            ? state.locale.languageCode
            : 'en';
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
                Text(widget.flag, style: const TextStyle(fontSize: 20)),
                const SizedBox(width: 12),
                Text(
                  widget.label,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
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
