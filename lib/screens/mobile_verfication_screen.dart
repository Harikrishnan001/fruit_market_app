import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/constants.dart';
import 'widgets/custom_button.dart';
import 'widgets/number_button.dart';

class MobileVerificationScreen extends StatefulWidget {
  const MobileVerificationScreen({Key? key}) : super(key: key);

  @override
  State<MobileVerificationScreen> createState() =>
      _MobileVerificationScreenState();
}

class _MobileVerificationScreenState extends State<MobileVerificationScreen> {
  late TextEditingController _phoneNumberController;
  bool _verifying = false;

  @override
  void initState() {
    super.initState();
    _phoneNumberController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _phoneNumberController.dispose();
  }

  void _updateNumber(int n) {
    if (_phoneNumber.length == 10) return;
    _phoneNumberController.text += n.toString();
    setState(() {});
  }

  String get _phoneNumber {
    return _phoneNumberController.text;
  }

  void _clearPhoneNumber() {
    if (_phoneNumber.isEmpty) return;
    if (_phoneNumber.length == 1) {
      _phoneNumberController.clear();
    } else {
      _phoneNumberController.text =
          _phoneNumber.substring(0, _phoneNumber.length - 1);
    }
    setState(() {});
  }

  Future<void> _verify() async {
    setState(() {
      _verifying = true;
    });
    //TODO:implement the mobile number verification
    await Future.delayed(Duration(seconds: 3));
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
              SafeArea(
                child: MobileNumberInputField(phoneNumber: _phoneNumber),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: CustomButton(
                  text: 'VERIFY',
                  onPressed: _verifying ? null : () => _verify(),
                ),
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

class MobileNumberInputField extends StatelessWidget {
  const MobileNumberInputField({
    Key? key,
    required String phoneNumber,
  })  : _phoneNumber = phoneNumber,
        super(key: key);

  final String _phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
      child: Hero(
        tag: 'input',
        child: InputDecorator(
          child: Text(
            _phoneNumber,
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
