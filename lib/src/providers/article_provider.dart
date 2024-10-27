import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:aegistree/src/entities/article_entity.dart';

part 'article_provider.g.dart';

@Riverpod(keepAlive: true)
class Article extends _$Article {
  @override
  List<ArticleEntity> build() {
    return [];
  }
}
