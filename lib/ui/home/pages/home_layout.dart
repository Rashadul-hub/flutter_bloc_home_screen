import 'package:bloc_practice/ui/home/widgets/all_games_widget/all_games_widget.dart';
import 'package:bloc_practice/ui/home/widgets/category_widget/categories_widget.dart';
import 'package:bloc_practice/ui/home/widgets/games_by_category_widget/games_by_category_widget.dart';
import 'package:bloc_practice/ui/widget/container_body.dart';
import 'package:flutter/material.dart';

import '../widgets/header_title/header_title.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderTitle(),
          SizedBox(height: 40),
          ContainerBody(children: [

            CategoriesWidget(),
            GamesByCategoryWidget(),
            AllGamesWidget(title: 'All games'),
          ])
        ],

      ),
    );
  }

}

