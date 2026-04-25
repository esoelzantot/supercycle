import 'package:flutter/material.dart';
import 'package:supercycle_site/core/functions/lanuch_whatsApp.dart';
import 'package:supercycle_site/core/functions/launch_email.dart';
import 'package:supercycle_site/core/functions/launch_url.dart';
import 'package:supercycle_site/core/theme/app_assets.dart';
import 'package:supercycle_site/features/home/data/content/social_channels_data.dart';

enum SocialStyle { chip, iconOnly }

class SocialChannelsRow extends StatelessWidget {
  const SocialChannelsRow({super.key, this.style = SocialStyle.iconOnly});

  final SocialStyle style;

  static const _channels = [
    _SocialChannel(
      label: 'Facebook',
      iconColor: Color(0xFF4267B2),
      bgColor: Color(0xFFE8F0FE),
      borderColor: Color(0xFF4267B2),
      solidBg: Color(0xFF4267B2),
      icon: _FacebookIcon(),
    ),
    _SocialChannel(
      label: 'WhatsApp',
      iconColor: Color(0xFF25D366),
      bgColor: Color(0xFFE7F8EE),
      borderColor: Color(0xFF25D366),
      solidBg: Color(0xFF25D366),
      icon: _WhatsAppIcon(),
    ),
    _SocialChannel(
      label: 'LinkedIn',
      iconColor: Color(0xFF0A66C2),
      bgColor: Color(0xFFE8F4FC),
      borderColor: Color(0xFF0A66C2),
      solidBg: Color(0xFF0A66C2),
      icon: _LinkedInIcon(),
    ),
    _SocialChannel(
      label: 'Instagram',
      iconColor: Color(0xFFD6249F),
      bgColor: Color(0xFFFDE8F5),
      borderColor: Color(0xFFC13584),
      solidBg: null, // gradient
      icon: _InstagramIcon(),
    ),
    _SocialChannel(
      label: 'Email',
      iconColor: Color(0xFF5F5F5F),
      bgColor: Color(0xFFF3F3F3),
      borderColor: Color(0xFF5F5F5F),
      solidBg: Color(0xFFEA4335),
      icon: _EmailIcon(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: List.generate(_channels.length, (i) {
        final ch = _channels[i];

        return Padding(
          padding: EdgeInsets.only(right: 10),
          child: style == SocialStyle.chip
              ? _ChipButton(channel: ch)
              : _DotButton(channel: ch),
        );
      }),
    );
  }
}

// ─── Chip Style ──────────────────────────────────────────────────────────────

class _ChipButton extends StatefulWidget {
  const _ChipButton({required this.channel});
  final _SocialChannel channel;

  @override
  State<_ChipButton> createState() => _ChipButtonState();
}

class _ChipButtonState extends State<_ChipButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () => handleOnTap(context: context, label: widget.channel.label),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,
          transform: Matrix4.translationValues(0, _hovered ? -2 : 0, 0),
          decoration: BoxDecoration(
            color: widget.channel.bgColor,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: widget.channel.borderColor, width: 1),
            boxShadow: _hovered
                ? [
                    BoxShadow(
                      color: widget.channel.iconColor.withOpacity(0.25),
                      blurRadius: 16,
                      offset: const Offset(0, 6),
                    ),
                  ]
                : [],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(width: 18, height: 18, child: widget.channel.icon),
              const SizedBox(width: 7),
              Text(
                widget.channel.label,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: widget.channel.iconColor,
                  fontFamily: 'Cairo',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Icon-Only Dot Style ─────────────────────────────────────────────────────

class _DotButton extends StatefulWidget {
  const _DotButton({required this.channel});
  final _SocialChannel channel;

  @override
  State<_DotButton> createState() => _DotButtonState();
}

class _DotButtonState extends State<_DotButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final isInstagram = widget.channel.label == 'Instagram';

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () => handleOnTap(context: context, label: widget.channel.label),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,
          transform: Matrix4.translationValues(0, _hovered ? -3 : 0, 0),
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: isInstagram
                ? const LinearGradient(
                    colors: [
                      Color(0xFFfdf497),
                      Color(0xFFfd5949),
                      Color(0xFFd6249f),
                      Color(0xFF285AEB),
                    ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  )
                : null,
            color: isInstagram ? null : widget.channel.solidBg,
            boxShadow: _hovered
                ? [
                    BoxShadow(
                      color:
                          (widget.channel.solidBg ?? widget.channel.iconColor)
                              .withOpacity(0.35),
                      blurRadius: 18,
                      offset: const Offset(0, 7),
                    ),
                  ]
                : [],
          ),
          child: Center(
            child: SizedBox(width: 25, height: 25, child: widget.channel.icon),
          ),
        ),
      ),
    );
  }
}

// ─── Data Model ──────────────────────────────────────────────────────────────

class _SocialChannel {
  const _SocialChannel({
    required this.label,
    required this.iconColor,
    required this.bgColor,
    required this.borderColor,
    required this.solidBg,
    required this.icon,
  });

  final String label;
  final Color iconColor;
  final Color bgColor;
  final Color borderColor;
  final Color? solidBg;
  final Widget icon;
}

// ─── SVG Icons ───────────────────────────────────────────────────────────────

class _FacebookIcon extends StatelessWidget {
  const _FacebookIcon();
  @override
  Widget build(BuildContext context) =>
      Image.asset(AppAssets.facebook, fit: BoxFit.fill, color: Colors.white);
}

class _WhatsAppIcon extends StatelessWidget {
  const _WhatsAppIcon();
  @override
  Widget build(BuildContext context) =>
      Image.asset(AppAssets.whatsapp, fit: BoxFit.fill, color: Colors.white);
}

class _LinkedInIcon extends StatelessWidget {
  const _LinkedInIcon();
  @override
  Widget build(BuildContext context) =>
      Image.asset(AppAssets.linkedin, fit: BoxFit.fill, color: Colors.white);
}

class _InstagramIcon extends StatelessWidget {
  const _InstagramIcon();
  @override
  Widget build(BuildContext context) =>
      Image.asset(AppAssets.instagram, fit: BoxFit.fill, color: Colors.white);
}

class _EmailIcon extends StatelessWidget {
  const _EmailIcon();
  @override
  Widget build(BuildContext context) =>
      Image.asset(AppAssets.email, fit: BoxFit.fill, color: Colors.white);
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
      await sendEmail(
        email: Channels.email,
        subject: "مشاركة تأكيد الحجز",
        body: "Hell0000",
      );
      break;
    default:
  }
}
