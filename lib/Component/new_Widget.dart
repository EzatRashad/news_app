import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:news/Cubit/cubit.dart';
import 'package:news/Modules/WebView/web_view.dart';

Widget buildArticleItem(Article, context) => InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WebViewScreen(
                url: Article['url'],
              ),
            ));
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                //width: 150,

                height: 150,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: NetworkImage(
                      '${Article['urlToImage']}',
                    ),
                    fit: BoxFit.cover,
                    
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 7,
              child: SizedBox(
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${Article['title']}",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Expanded(
                      child: Text(
                        "${Article['publishedAt']}",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
PageController con = PageController();
Widget ABuilder(List list, context, {isSearch = false}) => ConditionalBuilder(
      condition: list.isNotEmpty,
      builder: (context) => LiquidPullToRefresh(
        color: Colors.deepPurple,
        height: 300,
        backgroundColor: Colors.deepPurple[200],
        animSpeedFactor: 2,
        showChildOpacityTransition: true,
        onRefresh: NewsCubit.get(context).Ref,
        child: ListView.separated(
          controller: con,
          cacheExtent: 200,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return buildArticleItem(list[index], context);
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
          itemCount: list.length,
        ),
      ),
      fallback: (context) => isSearch
          ? Container()
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
