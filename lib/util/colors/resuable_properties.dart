import 'package:flutter/material.dart';

containerDeoration() {
  return BoxDecoration(
      borderRadius: BorderRadius.circular(6),
      boxShadow: [
        BoxShadow(
          offset: const Offset(0, 6),
          color: Colors.black.withOpacity(0.1),
          blurRadius: 8,
          spreadRadius: 1,
        )
      ],
      gradient: const LinearGradient(
        colors: [
          Color(0xfffeb211),
          Color(0xffffc342),
        ],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ));
}
