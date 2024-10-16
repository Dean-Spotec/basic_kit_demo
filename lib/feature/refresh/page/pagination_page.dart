// Author: Dean.Liu
// DateTime: 2024/10/07 12:05

import 'package:auto_route/auto_route.dart';
import 'package:basic_kit_demo/feature/refresh/provider/names_notifier_provider.dart';
import 'package:basic_kit_demo/route/app_router.gr.dart';
import 'package:basic_kit_demo/shared/model/sample_tile_model.dart';
import 'package:basic_kit_demo/shared/ui/view/scroll/refresher/ba_paging_scroll.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../basic_kit/views/sp_button.dart';
import '../../../shared/ui/view/other/ba_navigation_bar.dart';

@RoutePage()
class PaginationPage extends ConsumerWidget {
  const PaginationPage({
    super.key,
    @pathParam required this.countryId,
  });

  final int countryId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = namesNotifierProvider(
      pageType: PaginationPage,
      countryId: countryId,
    );
    return CupertinoPageScaffold(
      navigationBar: BaNavigationBar(
        ref: ref,
        middleTitle: '分页加载',
      ),
      child: Column(
        children: [
          _buildActionsView(context, provider, ref),
          Expanded(
            child: BaPagingScroll<SampleTileModel>(
              provider: provider,
              notifier: provider.notifier,
              enableLoadMore: true,
              childBuilder: (context, ref, items) {
                return CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Container(
                        height: 100,
                        color: CupertinoColors.systemOrange,
                        alignment: Alignment.center,
                        child: const Text('Sliver Header'),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final item = items[index];
                          return CupertinoListTile(
                            title: Text(item.name),
                            subtitle: Text(item.id),
                          );
                        },
                        childCount: items.length,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionsView(
    BuildContext context,
    NamesNotifierProvider provider,
    WidgetRef ref,
  ) {
    return Container(
      height: 60,
      color: CupertinoColors.systemGreen,
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SpButton.filled(
            child: const Text('刷新'),
            onPressed: () {
              ref.read(provider.notifier).refresh();
            },
          ),
          SpButton.filled(
            child: const Text('加载'),
            onPressed: () {
              ref.read(provider.notifier).loadMore();
            },
          ),
          SpButton.filled(
            child: const Text('Push'),
            onPressed: () {
              context.pushRoute(PaginationRoute(countryId: countryId));
            },
          ),
        ],
      ),
    );
  }
}
