import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:aegistree/src/entities/article_entity.dart';
import 'package:aegistree/src/providers/leafs_provider.dart';

part 'article_provider.g.dart';

@riverpod
class Article extends _$Article {
  @override
  List<ArticleEntity> build() {
    return List.generate(
      25,
      (_) {
        final id = uuid.v4();
        return ArticleEntity(
          id: id,
          title: id,
          image: "https://robohash.org/$id?set=set4",
          diseaseId: id,
          author: "Laurence Troy Valdez",
          url: "https://robohash.org/$id?set=set4",
        );
      },
    );
  }
}
