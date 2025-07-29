import 'package:flutter/material.dart';
import 'dart:math' as math;

class TasbehTab extends StatefulWidget {
  const TasbehTab({super.key});

  @override
  State<TasbehTab> createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;
  int _count = 0;
  final double _beadSize = 32;
  final double _beadSpacing = 12;
  final double _circleRadius = 140;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    
    // Create scale animation with bounce effect
    _scaleAnimation = TweenSequence([
      TweenSequenceItem<double>(
        tween: Tween(begin: 1.0, end: 1.1),
        weight: 50,
      ),
      TweenSequenceItem<double>(
        tween: Tween(begin: 1.1, end: 0.95),
        weight: 25,
      ),
      TweenSequenceItem<double>(
        tween: Tween(begin: 0.95, end: 1.0),
        weight: 25,
      ),
    ]).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    // Create rotation animation
    _rotationAnimation = Tween<double>(begin: 0, end: 0.2)
        .animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _incrementCount() {
    setState(() {
      _count++;
      _animationController.forward(from: 0);
    });
  }

  void _resetCount() {
    setState(() {
      _count = 0;
      _animationController.forward(from: 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFECE0C9), // Warm latte color
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              // Counter display
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFD6B28D).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Text(
                  '$_count',
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF6D4C41),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Tasbih circle
              Container(
                width: _circleRadius * 2,
                height: _circleRadius * 2,
                child: Stack(
                  children: [
                    // Background circle
                    Positioned.fill(
                      child: CustomPaint(
                        painter: TasbihPainter(
                          beadSize: _beadSize,
                          beadSpacing: _beadSpacing,
                          count: 33, // Traditional 33 beads
                        ),
                      ),
                    ),
                    // Animated beads
                    AnimatedBuilder(
                      animation: _animationController,
                      builder: (context, child) {
                        return Transform.rotate(
                          angle: _rotationAnimation.value * math.pi,
                          child: Stack(
                            children: List.generate(33, (index) {
                              final angle = (index * 2 * math.pi) / 33;
                              final x = _circleRadius * math.cos(angle);
                              final y = _circleRadius * math.sin(angle);
                              
                              return Positioned(
                                left: _circleRadius + x - _beadSize / 2,
                                top: _circleRadius + y - _beadSize / 2,
                                child: Transform.scale(
                                  scale: 1 + (_scaleAnimation.value * 0.1),
                                  child: _buildBead(),
                                ),
                              );
                            }),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              // Button Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Reset Button
                  GestureDetector(
                    onTap: _resetCount,
                    child: AnimatedBuilder(
                      animation: _animationController,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: 1 + (_scaleAnimation.value * 0.05),
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(0xFF6D4C41),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 15,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.refresh,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 20),
                  // Increment Button
                  GestureDetector(
                    onTap: _incrementCount,
                    child: AnimatedBuilder(
                      animation: _animationController,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: 1 + (_scaleAnimation.value * 0.05),
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(0xFF6D4C41),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 15,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    )
    );
  }

  Widget _buildBead() {
    return Container(
      width: _beadSize,
      height: _beadSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFF6D4C41),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
    );
  }
}

class TasbihPainter extends CustomPainter {
  final double beadSize;
  final double beadSpacing;
  final int count;

  TasbihPainter({
    required this.beadSize,
    required this.beadSpacing,
    required this.count,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFD6B28D).withOpacity(0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - beadSize / 2 - beadSpacing;

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
