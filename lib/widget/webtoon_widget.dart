import 'package:flutter/material.dart';
import 'package:toonflix/screen/detail_screen.dart';

class WebtoonWidget extends StatelessWidget {
  final String title, thumb, id;

  const WebtoonWidget({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) => DetailScreen(
              title: title,
              thumb: thumb,
              id: id,
            ),
          ),
        );
      },
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Hero(
            tag: id,
            child: Container(
              clipBehavior: Clip.hardEdge,
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    offset: const Offset(0, 0),
                    blurRadius: 15,
                  )
                ],
              ),
              child: Image.network(thumb),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(title),
        ],
      ),
    );
  }
}
