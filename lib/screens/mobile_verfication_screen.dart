import 'package:flutter/material.dart';
import 'package:fruit_market_app/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets/custom_button.dart';
import 'widgets/number_button.dart';

class MobileVerificationScreen extends StatefulWidget {
  const MobileVerificationScreen({Key? key}) : super(key: key);
  static const String routeName = "MobileVerification";
  @override
  State<MobileVerificationScreen> createState() =>
      _MobileVerificationScreenState();
}

class _MobileVerificationScreenState extends State<MobileVerificationScreen> {
  late TextEditingController _textController;
  bool _verifying = false;
  bool _verificationCodeSent = false;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _textController.dispose();
  }

  void _updateNumber(int n) {
    if (_verificationCodeSent && _textController.text.length == 4) return;
    if (!_verificationCodeSent && _textValue.length == 10) return;
    _textController.text += n.toString();
    setState(() {});
  }

  String get _textValue {
    return _textController.text;
  }

  void _clearPhoneNumber() {
    if (_textValue.isEmpty) return;
    if (_textValue.length == 1) {
      _textController.clear();
    } else {
      _textController.text = _textValue.substring(0, _textValue.length - 1);
    }
    setState(() {});
  }

  Future<void> _verify() async {
    if (_verificationCodeSent && _textValue.length != 4) return;
    if (!_verificationCodeSent && _textValue.length != 10) return;
    setState(() {
      _verifying = true;
    });
    if (!_verificationCodeSent) {
      //TODO:implement the mobile number verification code sending operation
      await Future.delayed(Duration(seconds: 3));
      //TODO:clear only if successful
      _textController.clear();
      //TODO:set true only if verification code sent
      _verificationCodeSent = true;
    } else {
      //TODO:mobile number code verification
      await Future.delayed(Duration(seconds: 3));
    }
    setState(() {
      _verifying = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              if (!_verificationCodeSent)
                SafeArea(
                  child: MobileNumberInputField(phoneNumber: _textValue),
                ),
              if (_verificationCodeSent)
                SafeArea(
                  child: Text(
                    'Enter the 4 digit code that was\nsent to your mobile number',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(),
                  ),
                ),
              if (_verificationCodeSent)
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    VerificationCodeInputField(
                        num: _textValue.isNotEmpty ? _textValue[0] : ' '),
                    VerificationCodeInputField(
                        num: _textValue.length >= 2 ? _textValue[1] : ' '),
                    VerificationCodeInputField(
                        num: _textValue.length >= 3 ? _textValue[2] : ' '),
                    VerificationCodeInputField(
                        num: _textValue.length >= 4 ? _textValue[3] : ' '),
                  ],
                ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: CustomButton(
                      text: 'VERIFY',
                      onPressed: _verifying ? null : () => _verify(),
                    ),
                  ),
                  if (_verificationCodeSent)
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: TextButton(
                          onPressed: () {
                            //TODO:implement resend verification code
                          },
                          style: ButtonStyle(
                            overlayColor: MaterialStateProperty.all(
                                primaryColor.withAlpha(50)),
                          ),
                          child: Text(
                            'Resend Again?',
                            style: GoogleFonts.poppins(fontSize: 12.0),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NumberButton(
                    number: 1,
                    alpha: '',
                    onPressed: _verifying ? null : () => _updateNumber(1),
                  ),
                  NumberButton(
                    number: 2,
                    alpha: 'ABC',
                    onPressed: _verifying ? null : () => _updateNumber(2),
                  ),
                  NumberButton(
                    number: 3,
                    alpha: 'DEF',
                    onPressed: _verifying ? null : () => _updateNumber(3),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NumberButton(
                    number: 4,
                    alpha: 'GHI',
                    onPressed: _verifying ? null : () => _updateNumber(4),
                  ),
                  NumberButton(
                    number: 5,
                    alpha: 'JKL',
                    onPressed: _verifying ? null : () => _updateNumber(5),
                  ),
                  NumberButton(
                    number: 6,
                    alpha: 'MNO',
                    onPressed: _verifying ? null : () => _updateNumber(6),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NumberButton(
                    number: 7,
                    alpha: 'PQRS',
                    onPressed: _verifying ? null : () => _updateNumber(7),
                  ),
                  NumberButton(
                    number: 8,
                    alpha: 'TUV',
                    onPressed: _verifying ? null : () => _updateNumber(8),
                  ),
                  NumberButton(
                    number: 9,
                    alpha: 'WXYZ',
                    onPressed: _verifying ? null : () => _updateNumber(9),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 70,
                    width: 70,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.backspace,
                        color: Colors.black,
                      ),
                      onPressed: _verifying ? null : _clearPhoneNumber,
                    ),
                  ),
                  NumberButton(
                    number: 0,
                    alpha: '',
                    onPressed: _verifying ? null : () => _updateNumber(0),
                  ),
                  InkWell(
                    splashColor: const Color(0x0FEFEFEF),
                    customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0)),
                    onTap: _verifying ? null : () => _verify(),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40.0),
                      child: Container(
                        alignment: Alignment.center,
                        height: 70,
                        width: 70,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          'OK',
                          style: GoogleFonts.poppins(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VerificationCodeInputField extends StatelessWidget {
  final String num;
  const VerificationCodeInputField({
    Key? key,
    required this.num,
  })  : assert(num.length == 1),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40.0),
      child: Container(
        alignment: Alignment.center,
        height: 60,
        width: 60,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xF0EFEFEF),
        ),
        child: SizedBox(
          width: 40.0,
          child: InputDecorator(
            textAlign: TextAlign.center,
            child: Text(
              num,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 30.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              counterText: "",
            ),
          ),
        ),
      ),
    );
  }
}

class MobileNumberInputField extends StatelessWidget {
  const MobileNumberInputField({
    Key? key,
    required String phoneNumber,
  })  : _textValue = phoneNumber,
        super(key: key);

  final String _textValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
      child: Hero(
        tag: 'input',
        child: InputDecorator(
          child: Text(
            _textValue,
            style: GoogleFonts.poppins(fontSize: 18.0),
          ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(0),
            prefixIcon: Container(
              margin: const EdgeInsets.only(right: 10.0),
              alignment: Alignment.center,
              height: 60.0,
              width: 60.0,
              child: Text(
                '+91',
                style: GoogleFonts.poppins(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(color: Colors.black, width: 1.0),
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Colors.black,
                width: 1.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
