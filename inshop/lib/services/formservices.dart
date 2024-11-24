import 'package:flutter/material.dart';

FormFieldValidator<String> phoneValidator() {
    return (String? value) {
      if (value == null || value.isEmpty) {
        return 'Phone number is required.';
      }
      String pattern = r'^(08|09)\d{8}$';
      RegExp regExp = RegExp(pattern);
      if (!regExp.hasMatch(value)) {
        return 'Invalid phone number. Must start with 08 or 09 and have 10 digits.';
      }
      return null; // No error
    };
  }

  FormFieldValidator<String> emailValidator() {
  return (String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required.';
    }
    String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return 'Invalid email address.';
    }
    return null; // No error
  };
}

  FormFieldValidator<String> nameValidator() {
    return (String? value) {
      if (value == null || value.trim().isEmpty) {
        return 'Name is required.';
      }
      String pattern = r"^[a-zA-Z\s]{2,50}$";
      RegExp regExp = RegExp(pattern);
      if (!regExp.hasMatch(value)) {
        return 'Invalid name. Use only letters and spaces.';
      }
      return null; // No error
    };
  }

  FormFieldValidator<String> passwordValidator() {
    return (String? value) {
      if (value == null || value.isEmpty) {
        return 'Password is required.';
      }

      List<String> errors = [];

      // Check for minimum length
      if (value.length < 8) {
        errors.add('At least 8 characters.');
      }

      // Check for at least one uppercase letter
      if (!RegExp(r'[A-Z]').hasMatch(value)) {
        errors.add('At least one uppercase letter.');
      }

      // Check for at least one lowercase letter
      if (!RegExp(r'[a-z]').hasMatch(value)) {
        errors.add('At least one lowercase letter.');
      }

      // Check for at least one digit
      if (!RegExp(r'\d').hasMatch(value)) {
        errors.add('At least one number.');
      }

      // Check for at least one special character
      if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
        errors.add('At least one special character.');
      }

      // Combine errors or return null if no errors
      if (errors.isNotEmpty) {
        return 'Invalid password: \n${errors.join('\n')}';
      }
      return null; // No error
    };
  }