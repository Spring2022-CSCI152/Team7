// Sidenote. Using ..setEntry on Matrix4 causes the web version to crash.

import 'dart:math';

import 'package:flutter/material.dart';

class AlbumCard extends StatefulWidget {
  final String imageUrl;
  final String AlbumName;
  final String AlbumDesc;

  const AlbumCard({
    Key? key,
    required this.imageUrl,
    required this.AlbumName,
    required this.AlbumDesc,
  }) : super(key: key);

  @override
  _AlbumCardState createState() => _AlbumCardState();
}

class _AlbumCardState extends State<AlbumCard>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    animation = CurvedAnimation(
      parent: Tween<double>(begin: 0, end: 1).animate(controller),
      curve: Curves.easeInOutQuad,
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {},
      onHover: (e) {
        if (e)
          controller.forward();
        else
          controller.reverse();
      },
      child: AnimatedBuilder(
          animation: animation,
          builder: (context, _) {
            return Transform.scale(
              scale: 1 + (0.2 * animation.value),
              child: Container(
                width: 240,
                height: 350,
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: NetworkImage(widget.imageUrl),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 50 * animation.value,
                        spreadRadius: -10,
                        offset: Offset(0, 10))
                  ],
                ),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black,
                            Colors.black12,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.AlbumName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            widget.AlbumDesc,
                            maxLines: 6,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
