import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/datas/static.dart';
import 'package:skar_admin/helpers/static_data.dart';
import 'package:skar_admin/models/brend.dart';
import 'package:skar_admin/providers/api/brend.dart';
import 'package:skar_admin/services/api/brend.dart';

class ResultBrends extends ConsumerWidget {
  const ResultBrends({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final page = index ~/ pageSize + 1;
          final indexInPage = index % pageSize;

          BrendParams brendParams = BrendParams(page: page, isDeleted: false);
          final AsyncValue<ResultBrend> brends =
              ref.watch(fetchBrendsProvider(brendParams));

          return brends.when(
            skipLoadingOnRefresh: true,
            skipLoadingOnReload: true,
            skipError: true,
            data: (response) {
              if (response.error != '') {
                return null;
              }
              if (indexInPage >= response.brends!.length) {
                return null;
              }

              Brend brend = response.brends![indexInPage];
              return Card(
                child: ListTile(
                  title: Text(brend.name),
                ),
              );
            },
            error: (error, stackTrace) => errorMethod(error),
            loading: () => null,
          );
        },
      ),
    );
  }
}
