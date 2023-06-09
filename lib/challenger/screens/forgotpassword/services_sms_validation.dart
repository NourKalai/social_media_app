// // ignore_for_file: avoid_print

// library flutter_otp;

// import 'dart:math';
// import 'package:sms/sms.dart';

// class FlutterOtp {
//   late int _otp, _minOtpValue, _maxOtpValue; //Generated OTP

//   /// This function is used to generate a Random OTP in the range [1000, 9999]
//   /// which can be used to send and verify. The [Random.nexInt] function is been
//   /// used to do the same.
//   ///
//   /// UPDATE: OTP can be generated in the range desired by passing min and max
//   /// params to sendOTP() function. Otherwise the Range [1000, 9999] is taken as
//   /// default.
//   String generateOtp([int min = 1000, int max = 9999]) {
//     print("ADDRESSS"); // +1 for USA. Change it according to use.

//     //Generates four digit OTP by default
//     _minOtpValue = min;
//     _maxOtpValue = max;

//     _otp = _minOtpValue + Random().nextInt(_maxOtpValue - _minOtpValue);
//     return _otp.toString();
//   }

//   /// This function should be called with [phoneNumber] as a Parameter and
//   /// [messageText] as a optional parameter. If [messageText] is not passed it is
//   /// taken as 'You OTP is : <Generated OTP>'.
//   /// You can also pass [countryCode] (optional) as a parameter to sendtOtp function
//   /// Otherwise +91 is taken as default country code (INDIA)
//   sendOtp(String phoneNumber,
//       [String? messageText,
//       int min = 1000,
//       int max = 9999,
//       String countryCode = '+1']) {
//     //function parameter 'message' is optional.
//     generateOtp(min, max);
//     // +1 for USA. Change it according to use.

//     SmsSender sender = SmsSender();
//     String address = '+216$phoneNumber';
//     print("ADDRESSS$address"); // +1 for USA. Change it according to use.

//     /// Use country code as per your requirement.
//     /// +1 : USA / Canada
//     /// +91: India
//     /// +44: UK
//     /// For other countries, please refer https://countrycode.org/
//     sender.sendSms(SmsMessage(
//         address, (messageText ?? 'Your OTP is : ') + _otp.toString()));
//   }

//   /// This function is used to validate the OTP entered by the user, by comparing
//   /// it with the generated value [_otp]. If validates to be true then bool value
//   /// true is returned. Else, false is returned.
//   bool resultChecker(int enteredOtp) {
//     //To validate OTP
//     return enteredOtp == _otp;
//   }
// }
