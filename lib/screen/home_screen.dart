import 'package:flutter/material.dart';
import 'package:toonflix/model/webtoon_model.dart';
import 'package:toonflix/service/api_service.dart';
import 'package:toonflix/widget/webtoon_widget.dart';

class Homescreen extends StatelessWidget {
  Homescreen({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Text(
          "오늘의 웹툰",
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return makeListView(snapshot);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  ListView makeListView(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 20,
      ),
      itemBuilder: (context, index) {
        var webtoon = snapshot.data![index];
        return WebtoonWidget(
          title: webtoon.title,
          thumb: webtoon.thumb,
          id: webtoon.id,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 30,
      ),
      itemCount: snapshot.data!.length,
    );
  }
}
