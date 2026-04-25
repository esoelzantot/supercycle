import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:supercycle_site/core/functions/lanuch_whatsApp.dart';
import 'package:supercycle_site/core/functions/launch_email.dart';
import 'package:supercycle_site/core/helpers/custom_dropdown.dart';
import 'package:supercycle_site/core/helpers/share_booking_dialog.dart';
import 'package:supercycle_site/core/theme/app_colors.dart';
import 'package:supercycle_site/core/theme/app_styles.dart';
import 'package:supercycle_site/features/home/data/content/social_channels_data.dart';
import 'package:supercycle_site/generated/l10n.dart';

class FormSide extends StatefulWidget {
  const FormSide({super.key});

  @override
  State<FormSide> createState() => _FormSideState();
}

class _FormSideState extends State<FormSide> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  String _selectedSubject = 'استفسار تجاري';
  bool _submitted = false;

  static const _green = Color(0xFF1B6B3A);

  final _subjects = ['استفسار تجاري', 'دعم فني', 'أخرى'];

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void handleSend({required BuildContext context}) async {
    if (_formKey.currentState!.validate()) {
      final ShareMethod? method = await showDialog<ShareMethod>(
        context: context,
        builder: (_) => const ShareBookingDialog(),
      );

      if (method == null || !mounted) return;

      switch (method) {
        case ShareMethod.whatsapp:
          openWhatsApp(
            context: context,
            phone: Channels.whatsapp,
            content: "Hell0000",
          );
          break;
        case ShareMethod.email:
          if (!kIsWeb) {
            await sendEmail(
              email: Channels.email,
              subject: "مشاركة تأكيد الحجز",
              body: "Hell0000",
            );
          } else {
            await launchEmail(
              email: Channels.email,
              subject: "مشاركة تأكيد الحجز",
              body: "Hell0000",
            );
          }
      }
      setState(() => _submitted = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(36),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: _buildField(
                    S.of(context).contact_us_name,
                    _nameController,
                    hint: 'أدخل اسمك هنا',
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildField(
                    S.of(context).contact_us_email,
                    _emailController,
                    hint: 'example@email.com',
                    isLtr: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _buildDropdown(),
            const SizedBox(height: 4),
            _buildField(
              S.of(context).contact_us_message,
              _messageController,
              hint: 'كيف يمكننا مساعدتك؟',
              maxLines: 5,
            ),
            const SizedBox(height: 24),
            _buildSubmitButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildField(
    String label,
    TextEditingController ctrl, {
    String hint = '',
    int maxLines = 1,
    bool isLtr = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppStyles.styleSemiBold20(
            context,
          ).copyWith(color: Color(0xFF666666)),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: ctrl,
          maxLines: maxLines,
          textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
          textAlign: isLtr ? TextAlign.left : TextAlign.right,
          style: AppStyles.styleMedium16(context),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: AppStyles.styleMedium16(
              context,
            ).copyWith(color: Color(0xFFAAAAAA)),
            filled: true,
            fillColor: const Color(0xFFF8F8F6),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 12,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: _green, width: 1.0),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'الموضوع',
          style: AppStyles.styleSemiBold20(
            context,
          ).copyWith(color: Color(0xFF666666)),
        ),
        const SizedBox(height: 6),
        CustomDropdown(
          initialValue: _selectedSubject,
          options: _subjects,
          onChanged: (v) => setState(() => _selectedSubject = v!),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          colors: _submitted
              ? [AppColors.primary, AppColors.primary]
              : [
                  AppColors.primary.withValues(alpha: 0.9),
                  const Color(0xFF2d9e5c),
                ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: _green.withValues(alpha: 0.3),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => handleSend(context: context),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  _submitted ? Icons.check_rounded : Icons.send_rounded,
                  color: Colors.white,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  _submitted ? 'تم الإرسال!' : 'إرسال الرسالة',
                  style: AppStyles.styleBold18(
                    context,
                  ).copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
