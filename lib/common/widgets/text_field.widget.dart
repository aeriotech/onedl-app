import 'package:flutter/material.dart';
import 'package:fundl_app/common/theme.dart';

class FundlTextField = TextField with FundlTextFieldMixin;

mixin FundlTextFieldMixin on TextField {
  @override
  InputDecoration? get decoration => super.decoration?.copyWith(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
            color: AppTheme.grey,
            width: 2.0,
          ),
        ),
      );
}
