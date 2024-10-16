// Author: Dean.Liu
// DateTime: 2024/10/07 12:16

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../basic_kit/views/refresher/paging_notifier_mixin.dart';
import '../../../basic_kit/views/refresher/paging_state.dart';
import '../../../shared/model/sample_tile_model.dart';
import '../repository/names_repository.dart';

part 'names_notifier_provider.g.dart';

@riverpod
class NamesNotifier extends _$NamesNotifier
    with PagingNotifierMixin<SampleTileModel> {
  @override
  PagingState<SampleTileModel> build({
    required Type pageType,
    required int countryId,
  }) {
    return PagingState.initial(page: firstPage);
  }

  @override
  Future<PagingResult<SampleTileModel>> fetch({required int page}) async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    final repository = ref.read(namesRepositoryProvider);
    final (items, hasMore) = await repository.getByPage(
      countryId: countryId,
      page: page,
      limit: 20,
    );
    return PagingResult(items: items, hasMore: hasMore);
  }
}
