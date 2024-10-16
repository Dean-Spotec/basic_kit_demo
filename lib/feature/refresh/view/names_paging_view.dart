// Author: Dean.Liu
// DateTime: 2024/10/13 23:10

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/model/sample_tile_model.dart';
import '../../../shared/ui/view/scroll/refresher/ba_paging_scroll.dart';
import '../provider/names_notifier_provider.dart';

class NamesPagingView extends ConsumerWidget {
  const NamesPagingView({
    super.key,
    required this.pageType,
    required this.countryId,
    required this.useList,
  });

  final Type pageType;
  final int countryId;
  final bool useList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = namesNotifierProvider(
      pageType: pageType,
      countryId: countryId,
    );
    return BaPagingScroll<SampleTileModel>(
      provider: provider,
      notifier: provider.notifier,
      enableLoadMore: true,
      childBuilder: (context, ref, items) {
        if (useList) {
          return ListView.builder(
            itemBuilder: (context, index) {
              final item = items[index];
              return CupertinoListTile(
                title: Text(item.name),
                subtitle: Text(item.id),
              );
            },
            itemCount: items.length,
          );
        } else {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              final item = items[index];
              return Container(
                decoration: const BoxDecoration(color: Colors.blue),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(item.name),
                    Text(item.id),
                  ],
                ),
              );
            },
            itemCount: items.length,
          );
        }
      },
    );
  }
}
