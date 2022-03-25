import 'package:flutter/material.dart';

// const kPrimaryBlue = Color(0xFF2855AE);
// const kSecondaryBlue = Color(0xFF7292CF);
// const kPrimaryButtonColor = Color(0xFF2351AD);
// const kBackgroundColor = Color(0xffD6ECF2);

const kEmailValidationRegex =
    '^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9]{2,}.[a-zA-Z0-9]{2,}\$';
const kPasswordValidationRegex =
    '^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@\$!%*?&])[A-Za-z\\d@\$!%*?&]{8,}\$';
const kPhoneValidationRegex = '+^[0-9]{10}';
const kOTPValidationRegex = '^[0-9]{6}';
