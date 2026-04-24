import 'package:flutter/material.dart';

class NavItem {
  final String label;
  final VoidCallback? onTap;

  const NavItem({required this.label, this.onTap});
}
