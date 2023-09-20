import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import 'cubit/cubit.dart';

Widget articleItem({
  required BuildContext contextParameter,
  required Map articleParameter,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        Container(
          width: double.infinity,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Image(
            image: NetworkImage(
              (articleParameter['urlToImage']!=null) ? articleParameter['urlToImage'] :
              'https://peoplevine.blob.core.windows.net/media/72/e86f3854-ebcf-4025-ae66-220b51f77ec2/image_not_available.png',
            ),
            height: 200,
            fit: BoxFit.fill,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          articleParameter['title'],
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(contextParameter).textTheme.displayMedium,
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          articleParameter['publishedAt'],
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(contextParameter).textTheme.displaySmall,
        ),
      ],
    ),
  );
}

Widget separate({
  required BuildContext contextParameter,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 15,
    ),
    child: Container(
      height: 1,
      width: double.infinity,
      color: NewsAppCubit.get(contextParameter).isDark ? Colors.white60 : Colors.grey,
    ),
  );
}


Widget articleBuilder({
  required List<dynamic> list,
  bool isSearchScreen = false,
}) {
  return ConditionalBuilder(
    condition: list.isNotEmpty,
    builder: (context){
      return ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder:(context,index){
          return articleItem(
            contextParameter:context,
            articleParameter: list[index],
          );
        },
        separatorBuilder:(context,index){
          return separate(
            contextParameter: context,
          );
        },
        itemCount: list.length,
      );
    },
    fallback: (context) => isSearchScreen ? Container() : const Center(child: CircularProgressIndicator()),
  );
}