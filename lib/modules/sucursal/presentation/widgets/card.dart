import 'package:flutter/material.dart';

class PersonalizeCard extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback? onPressedEmploye;
  final VoidCallback? onPressedBranch;

  const PersonalizeCard({
    super.key,
    required this.title,
    required this.color,
    this.onPressedEmploye,
    this.onPressedBranch,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      final height = constraints.maxHeight;

      return Stack(
        children: [
          Align( 
            alignment: Alignment.bottomCenter,
            child: _CardShadow(color: color),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: color
            ),
              padding: EdgeInsets.zero,
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: _CircleDecorator(size: height),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: _SimanDecorator(size: height)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      title,
                      style:TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    
                  ),
                   Align(
                    alignment: Alignment.bottomCenter,
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                       children:[IconButton(onPressed: onPressedEmploye, icon: Icon(Icons.man,color: color,),
                          style:ButtonStyle(
                                                backgroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
                          ),
                       ),  IconButton(onPressed: onPressedBranch, icon: Icon(Icons.settings,color: color),
                       style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
                       ),
                     ),
                                     ]),
                   ),
                  
                ],
              ),
            ),
          
        ],
      );
    });
  }
}

class _CardShadow extends StatelessWidget {
  const _CardShadow({
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      height: 11,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: color,
            offset: const Offset(0, 6),
            blurRadius: 23,
          ),
        ],
      ),
    );
  }
}

class _CircleDecorator extends StatelessWidget {
  final double size;

  const _CircleDecorator({required this.size});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(-size * 0.5, -size * 0.6),
      child: CircleAvatar(
        radius: size / 2,
        backgroundColor: Colors.white.withOpacity(0.14),
      ),
    );
  }
}

class _SimanDecorator extends StatelessWidget {
  final double size;

  const _SimanDecorator({required this.size});

  @override
  Widget build(BuildContext context) {
    return Opacity(
  opacity: 0.25,
  child: Transform.scale(
    scale: 1.4,
    child: Image.asset(
      'assets/siman-logo.png',
      width: size,
      height: size,
      fit: BoxFit.contain,
    ),
  ),
);
  }
}
