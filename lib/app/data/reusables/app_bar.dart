import 'package:flutter/material.dart';
import 'package:perfection/app/data/constants/constants.dart';

class CurvedAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? leading;

  const CurvedAppBar({
    Key? key,
    required this.title,
    this.actions,
    this.leading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: primaryTextStyle(size: 24, color: Colors.white,
          weight: FontWeight.bold,

        ),


      ),
      centerTitle: true,
      backgroundColor: Colors.deepPurple,
      leading: leading,
      actions: actions,
      flexibleSpace: ClipPath(
        clipper: _AppBarClipper(),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.deepPurpleAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      elevation: 10,
      shadowColor: Colors.deepPurpleAccent,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 40);
}

class _AppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 40);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
