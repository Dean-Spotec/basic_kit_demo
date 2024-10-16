import 'package:random_name_generator/random_name_generator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/model/sample_tile_model.dart';

part 'names_repository.g.dart';

@riverpod
NamesRepository namesRepository(NamesRepositoryRef ref) =>
    NamesRepository();

class NamesRepository {
  Future<(List<SampleTileModel> items, bool hasMore)> getByPage({
    required int countryId,
    required int page,
    required int limit,
  }) async {
    final db = countryId == 0 ? _usDb : _zhDb;
    final items = db.sublist((page - 1) * limit, page * limit).map(
      (e) {
        return SampleTileModel(
          (b) => b
            ..id = e.$1.toString()
            ..name = e.$2,
        );
      },
    ).toList();

    final hasMore = db.length > page * limit;
    await Future<void>.delayed(const Duration(milliseconds: 500));

    // throw Exception('获取名字失败');
    // return (<SampleTileModel>[], false);
    return (items, hasMore);
  }
}

final _randomUsNames = RandomNames(Zone.us);

final _randomZhNames = RandomNames(Zone.china);

final _usDb = List.generate(
  80,
  (index) => (index + 1, _randomUsNames.fullName()),
);

final _zhDb = List.generate(
  100,
      (index) => (index + 1, _randomZhNames.fullName()),
);
