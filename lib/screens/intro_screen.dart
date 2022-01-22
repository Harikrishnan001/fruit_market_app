import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_market_app/screens/widgets/custom_button.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen>
    with SingleTickerProviderStateMixin {
  static const _title = <String>[
    'E Shopping',
    'Delivery on the way',
    'Delivery Arrived'
  ];

  static const _content = <String>[
    'Explore top organic fruits & grab them',
    'Get your order by speed delivery',
    'Order is arrived at your place'
  ];

  static const _imageURL = <String>[
    'assets/mobile-girl.svg',
    'assets/scooter-girl.svg',
    'assets/delivery-man.svg'
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  void _incrementTabIndex() {
    if (_tabController.index < _imageURL.length - 1) {
      _tabController.animateTo(_tabController.index + 1);
    }
    setState(() {});
  }

  int get _currentIndex {
    return _tabController.index;
  }

  bool get _isLast {
    return _tabController.index == _imageURL.length - 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SafeArea(
            child: Align(
              alignment: Alignment.centerRight,
              child: Opacity(
                opacity: _isLast ? 0 : 1,
                child: Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: TextButton(
                    onPressed: _isLast ? null : () {},
                    child: Text(
                      'Skip',
                      textAlign: TextAlign.end,
                      style: GoogleFonts.poppins(color: Colors.grey),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          SizedBox(
            height: MediaQuery.of(context).size.height / 2.5,
            width: MediaQuery.of(context).size.width,
            child: TabBarView(
              controller: _tabController,
              children: [
                for (int i = 0; i < _imageURL.length; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: SvgPicture.asset(
                      _imageURL[i],
                    ),
                  ),
              ],
            ),
          ),
          const Spacer(),
          Text(
            _title[_currentIndex],
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: const Color(0xFF2F2E41),
              fontWeight: FontWeight.w600,
              fontSize: 24.0,
            ),
          ),
          const SizedBox(height: 10.0),
          Text(
            _content[_currentIndex],
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: Colors.grey,
              fontSize: 16.0,
            ),
          ),
          const Spacer(),
          Center(
            child: TabPageSelector(
              controller: _tabController,
              selectedColor: Colors.lightGreen,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60.0),
            child: CustomButton(
              text: _tabController.index < _imageURL.length - 1
                  ? 'Next'
                  : 'Get Started',
              onPressed: _incrementTabIndex,
              borderRadius: 6.0,
            ),
          ),
          const Spacer(flex: 3),
        ],
      ),
    );
  }
}
