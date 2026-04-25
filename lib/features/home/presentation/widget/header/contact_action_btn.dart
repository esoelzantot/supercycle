import 'package:flutter/material.dart';
import 'package:supercycle_site/core/functions/lanuch_whatsApp.dart';
import 'package:supercycle_site/core/functions/launch_email.dart';
import 'package:supercycle_site/core/functions/launch_url.dart';
import 'package:supercycle_site/core/theme/app_assets.dart';
import 'package:supercycle_site/core/theme/app_styles.dart';
import 'package:supercycle_site/features/home/data/content/social_channels_data.dart';

class ContactActionBtn extends StatefulWidget {
  final bool showLabel;
  final double iconSize;
  final Color iconColor;
  const ContactActionBtn({
    super.key,
    this.showLabel = true,
    this.iconSize = 20,
    this.iconColor = const Color(0xFF3D4A5C),
  });

  @override
  State<ContactActionBtn> createState() => _ContactActionBtnState();
}

class _ContactActionBtnState extends State<ContactActionBtn> {
  bool _hovered = false;

  void _showContactMenu(BuildContext context) async {
    final RenderBox button = context.findRenderObject() as RenderBox;
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;

    final Offset buttonBottomLeft = button.localToGlobal(
      button.size.bottomLeft(Offset.zero),
      ancestor: overlay,
    );
    final Offset buttonBottomRight = button.localToGlobal(
      button.size.bottomRight(Offset.zero),
      ancestor: overlay,
    );

    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(buttonBottomLeft, buttonBottomRight),
      Offset.zero & overlay.size,
    );

    await showMenu<String>(
      context: context,
      position: position,
      elevation: 0,
      color: Colors.transparent,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      constraints: const BoxConstraints(minWidth: 0, maxWidth: 320),
      items: [
        PopupMenuItem<String>(
          enabled: false,
          padding: EdgeInsets.zero,
          child: _ContactMenuContent(context: context),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: 'تواصل معنا',
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        child: GestureDetector(
          onTap: () => _showContactMenu(context),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: _hovered ? Colors.grey.shade100 : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.headset_mic_rounded,
                  size: widget.iconSize,
                  color: _hovered
                      ? Color(0xFF3D4A5C).withValues(alpha: 0.7)
                      : widget.iconColor,
                ),
                if (widget.showLabel) const SizedBox(width: 8),
                if (widget.showLabel)
                  Text(
                    'تواصل معنا',
                    style: AppStyles.styleMedium18(context).copyWith(
                      color: _hovered
                          ? const Color(0xFF3D4A5C).withValues(alpha: 0.7)
                          : const Color(0xFF3D4A5C),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ─── Menu Content ─────────────────────────────────────────────────────────────

class _ContactMenuContent extends StatelessWidget {
  final BuildContext context;
  const _ContactMenuContent({required this.context});

  static const _channels = [
    _ContactChannel(
      label: 'Facebook',
      iconColor: Color(0xFF4267B2),
      bgColor: Color(0xFFE8F0FE),
      borderColor: Color(0xFF4267B2),
      iconAsset: AppAssets.facebook,
    ),
    _ContactChannel(
      label: 'WhatsApp',
      iconColor: Color(0xFF25D366),
      bgColor: Color(0xFFE7F8EE),
      borderColor: Color(0xFF25D366),
      iconAsset: AppAssets.whatsapp,
    ),
    _ContactChannel(
      label: 'LinkedIn',
      iconColor: Color(0xFF0A66C2),
      bgColor: Color(0xFFE8F4FC),
      borderColor: Color(0xFF0A66C2),
      iconAsset: AppAssets.linkedin,
    ),
    _ContactChannel(
      label: 'Instagram',
      iconColor: Color(0xFFD6249F),
      bgColor: Color(0xFFFDE8F5),
      borderColor: Color(0xFFC13584),
      iconAsset: AppAssets.instagram,
    ),
    _ContactChannel(
      label: 'Email',
      iconColor: Color(0xFFEA4335),
      bgColor: Color(0xFFFCE8E6),
      borderColor: Color(0xFFEA4335),
      iconAsset: AppAssets.email,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade100, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              'تواصل معنا عبر',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade400,
                fontFamily: 'Cairo',
                letterSpacing: 0.3,
              ),
            ),
          ),
          // Chips
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _channels
                .map((ch) => _ContactChip(channel: ch, parentContext: context))
                .toList(),
          ),
        ],
      ),
    );
  }
}

// ─── Chip ─────────────────────────────────────────────────────────────────────

class _ContactChip extends StatefulWidget {
  final _ContactChannel channel;
  final BuildContext parentContext;
  const _ContactChip({required this.channel, required this.parentContext});

  @override
  State<_ContactChip> createState() => _ContactChipState();
}

class _ContactChipState extends State<_ContactChip> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
          handleOnTap(
            label: widget.channel.label,
            context: widget.parentContext,
          );
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          curve: Curves.easeOut,
          transform: Matrix4.translationValues(0, _hovered ? -2 : 0, 0),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
          decoration: BoxDecoration(
            color: _hovered ? widget.channel.bgColor : Colors.white,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: _hovered
                  ? widget.channel.borderColor
                  : Colors.grey.shade200,
              width: 1,
            ),
            boxShadow: _hovered
                ? [
                    BoxShadow(
                      color: widget.channel.iconColor.withValues(alpha: 0.2),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : [],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 18,
                height: 18,
                child: Image.asset(
                  widget.channel.iconAsset,
                  fit: BoxFit.contain,
                  color: widget.channel.iconColor,
                ),
              ),
              const SizedBox(width: 7),
              Text(
                widget.channel.label,
                style: AppStyles.styleSemiBold16(
                  context,
                ).copyWith(color: widget.channel.iconColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Data Model ───────────────────────────────────────────────────────────────

class _ContactChannel {
  const _ContactChannel({
    required this.label,
    required this.iconColor,
    required this.bgColor,
    required this.borderColor,
    required this.iconAsset,
  });

  final String label;
  final Color iconColor;
  final Color bgColor;
  final Color borderColor;
  final String iconAsset;
}

// ─── LAUNCH LOGIC ──────────────────────────────────────────────────────────────
void handleOnTap({required String label, required BuildContext context}) async {
  switch (label) {
    case 'Facebook':
      launchUrlFunc(Channels.facebook);
      break;
    case 'Instagram':
      launchUrlFunc(Channels.instagram);
      break;
    case 'WhatsApp':
      openWhatsApp(
        context: context,
        phone: Channels.whatsapp,
        content: "اهلا و سهلا",
      );
      break;
    case 'LinkedIn':
      launchUrlFunc(Channels.linkedin);
      break;
    case 'Email':
      await sendMail(
        email: Channels.email,
        subject: "مشاركة تأكيد الحجز",
        body: "Hell0000",
        context: context,
      );
      break;
    default:
  }
}
