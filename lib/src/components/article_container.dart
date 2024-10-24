import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:aegistree/src/components/text/karla.dart';
import 'package:aegistree/src/entities/article_entity.dart';

class ArticleContainer extends ConsumerWidget {
  const ArticleContainer(this.article, {super.key});
  final ArticleEntity article;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Image.network(
            article.image,
            height: 50,
            width: 100,
          ),
          Expanded(
            child: Karla(
              article.title,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline,
            ),
          )
        ],
      ),
    );
  }
}
