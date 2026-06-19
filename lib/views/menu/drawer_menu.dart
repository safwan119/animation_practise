import 'package:flutter/material.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({super.key});

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> with TickerProviderStateMixin {
  static const _subjectTitles = [
    'Physics',
    'Mathematics',
    'English',
    'Urdu',
    'Biology',
    'Islamiat',
  ];
  static const _initialDelayTime = Duration(milliseconds: 50);
  static const _itemSlideTime = Duration(milliseconds: 250);
  static const _staggerTime = Duration(milliseconds: 50);
  static const _buttonDelayTime = Duration(milliseconds: 150);
  static const _buttonTime = Duration(milliseconds: 500);
  final Duration _animationDuration =
      _initialDelayTime +
      (_staggerTime * _subjectTitles.length) +
      _buttonDelayTime +
      _buttonTime;

  late AnimationController _staggeredController;
  final List<Interval> _itemSlideIntervals = [];
  late Interval _buttonInterval;

  @override
  void initState() {
    super.initState();
    _createAnimationIntervals();
    _staggeredController = AnimationController(
      vsync: this,
      duration: _animationDuration,
    )..forward();
  }

  void _createAnimationIntervals() {
    for (int i = 0; i < _subjectTitles.length; ++i) {
      final startTime = _initialDelayTime + (_staggerTime * i);
      final endTime = startTime + _itemSlideTime;
      _itemSlideIntervals.add(
        Interval(
          startTime.inMilliseconds / _animationDuration.inMilliseconds,
          endTime.inMilliseconds / _animationDuration.inMilliseconds,
        ),
      );
    }
    final buttonStartTime =
        Duration(milliseconds: _subjectTitles.length * 50) + _buttonDelayTime;
    final buttonEndTime = buttonStartTime + _buttonTime;
    _buttonInterval = Interval(
      buttonStartTime.inMilliseconds / _animationDuration.inMilliseconds,
      buttonEndTime.inMilliseconds / _animationDuration.inMilliseconds,
    );
  }

  @override
  void dispose() {
    _staggeredController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        fit: StackFit.expand,
        children: [_buildFlutterLogo(), _buildContent()],
      ),
    );
  }

  Widget _buildFlutterLogo() {
    return Positioned(
      right: -70,
      bottom: 60,
      child: Opacity(opacity: .2, child: FlutterLogo(size: 400)),
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        ..._buildSubjectList(),
        const Spacer(),
        _buildGetStartedButton(),
      ],
    );
  }

  List<Widget> _buildSubjectList() {
    List<Widget> subjectList = <Widget>[];
    for (int i = 0; i < _subjectTitles.length; ++i) {
      subjectList.add(
        AnimatedBuilder(
          animation: _staggeredController,
          builder: (context, child) {
            final animationPercentage = Curves.easeOut.transform(
              _itemSlideIntervals[i].transform(_staggeredController.value),
            );
            final opacity = animationPercentage;
            final slideDistance = (1.0 - animationPercentage) * 150;

            return Opacity(
              opacity: opacity,
              child: Transform.translate(
                offset: Offset(slideDistance, 0),
                child: child,
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
            child: Text(
              _subjectTitles[i],
              textAlign: TextAlign.left,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      );
    }
    return subjectList;
  }

  Widget _buildGetStartedButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: AnimatedBuilder(
            animation: _staggeredController,
            builder: (context, child) {
              final animationPercentage = Curves.elasticOut.transform(
                _buttonInterval.transform(_staggeredController.value),
              );
              final opacity = animationPercentage.clamp(0.0, 1.0);
              final scale = (animationPercentage * 0.5) + 0.4;

              return Opacity(
                opacity: opacity,
                child: Transform.scale(scale: scale, child: child),
              );
            },
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                // shape:const StadiumBorder(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 14,
                ),
              ),
              onPressed: () {},
              child: const Text(
                'Get started',
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
