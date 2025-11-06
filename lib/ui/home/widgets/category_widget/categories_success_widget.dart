import 'package:bloc_practice/repository/models/genre.dart';
import 'package:bloc_practice/ui/home/widgets/category_widget/bloc/category_bloc.dart';
import 'package:bloc_practice/ui/home/widgets/category_widget/category_barrel.dart';
import 'package:bloc_practice/ui/home/widgets/games_by_category_widget/bloc/games_by_category_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesSuccessWidget extends StatelessWidget {
  const CategoriesSuccessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state){
          return SizedBox(
            height: MediaQuery.of(context).size.height * .15,
            child: ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                itemBuilder: (context, index){
                  return CategoryItem(
                      key: ValueKey('${state.categories[index].name}$index'),
                      category: state.categories[index],
                      callback: (Genre categorySelected){
                        context.read<GamesByCategoryBloc>().add(
                          GetGamesByCategory(
                              idSelected: categorySelected.id,
                              categoryName: categorySelected.name ?? '',
                          ),
                        );
                        context.read<CategoryBloc>().add(
                          SelectCategory(idSelected: categorySelected.id)
                        );
                      }
                  );
                },
                scrollDirection: Axis.horizontal,
                separatorBuilder: (_, __) => SizedBox(
                  width: 16.0,
                ),
                itemCount: state.categories.length

            ),
          );
    });
  }
}
