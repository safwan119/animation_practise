import 'package:flutter/material.dart';

class CustomPaintPractise extends StatefulWidget {
  const CustomPaintPractise({super.key});

  @override
  State<CustomPaintPractise> createState() => _CustomPaintPractiseState();
}

class _CustomPaintPractiseState extends State<CustomPaintPractise>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> slideScale;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    )..repeat(reverse: true);
    slideScale = Tween<double>(begin: 0, end: 100).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    _animationController.forward();




  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom paint"),
        backgroundColor: Colors.orangeAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                height: 300,
                width: 300,
                child: CustomPaint(
                  painter: _DrawCirclePaint(),
                  size: const Size(300, 300),
                ),
              ),
            ),
            Center(
              child: SizedBox(
                height: 200,
                width: 200,
                child: Stack(
                  alignment: .center,
                  children: [
                    CustomPaint(
                      painter: _PaintAnyShape(),
                      size: const Size(200, 200),
                    ),
                    FlutterLogo(size: slideScale.value),
                  ],
                ),
              ),
            ),
            Center(
              child: SizedBox(
                height: 300,
                width: 300,
                child: CustomPaint(
                  painter: _MakePicture(),
                  size: const Size(200, 200),
                ),
              ),
            ),
            Center(
              child: SizedBox(
                height: 300,
                width: 300,
                child: CustomPaint(
                  painter: _DrawRectangle(),
                  size: const Size(200, 200),
                ),
              ),
            ),
            Center(
              child: SizedBox(
                height: 300,
                width: 300,
                child: CustomPaint(
                  painter: MyRoundedRectPainter(),
                  size: const Size(200, 200),
                ),
              ),
            ),

            Center(
              child: SizedBox(
                height: 300,
                width: 300,
                child: CustomPaint(
                  painter: MyDrawingOval(),
                  size: const Size(200, 200),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PaintAnyShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final c = Offset(size.width / 2, size.height / 2);
    final radius = size.shortestSide / 2;
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..color = Colors.orangeAccent.withValues(alpha: .5);
    canvas.drawCircle(c, radius * .74, paint);
    final arcPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round
      ..shader = SweepGradient(
        colors: [
          Colors.orangeAccent,
          Colors.deepOrangeAccent,
          Colors.redAccent,
          Colors.yellowAccent,
        ],
        startAngle: 0.0,
        endAngle: 6.283,
      ).createShader(Rect.fromCircle(center: c, radius: radius * .62));
    canvas.drawArc(
      Rect.fromCircle(center: c, radius: radius * .64),
      -1.3,
      5.5 * 1.0,
      false,
      arcPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _PaintAnyShape oldDelegate) {
    return true;
  }
}

class _DrawCirclePaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final circlePaint = Paint()
      ..color = Colors.orange
      ..strokeWidth = 5;
    canvas.drawLine(Offset(50.0, 100.0), Offset(250.0, 100.0), circlePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class _MakePicture extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    final path = Path();
    path.moveTo(100, 100);
    path.quadraticBezierTo(125, 70, 150, 100);
    path.moveTo(150, 100);
    path.quadraticBezierTo(175, 70, 200, 100);
    path.moveTo(200, 100);
    path.quadraticBezierTo(200, 70, 250, 100);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class _DrawRectangle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTRB(50, 50, 150, 150);
    final rectPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 3;
    canvas.drawRect(rect, rectPaint);
    final borderPaint = Paint()
      ..color = Colors
          .black // Border color
      ..strokeWidth =
          3 // Border thickness
      ..style = PaintingStyle.stroke;

    canvas.drawRect(rect, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class MyRoundedRectPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // 1. Define the Paint properties (e.g., solid blue color)
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    // 2. Define the Rounded Rectangle bounds and corner radius
    final rRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(50, 50, 200, 100), // (left, top, width, height)
      const Radius.circular(20.0), // Corner radius
    );

    // 3. Draw the shape on the canvas
    canvas.drawRRect(rRect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class MyDrawingOval extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Top ko 200 aur Bottom ko 300 kiya (Height = 100)
    // Left ko 50 aur Right ko 250 kiya (Width = 200)
    final rect = Rect.fromLTRB(50, 200, 250, 300);
    final ovalPaint = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.fill;
    canvas.drawOval(rect, ovalPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

