import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';

import '../../../core/constants/app_constant.dart';
import '../../../core/constants/color_constant.dart';
import '../../../product/widgets/custom_appbar.dart';
import '../viewModel/announcements_view_model.dart';

class AnnouncementsView extends ConsumerWidget {
  const AnnouncementsView({super.key});
  static String routeName = 'AnnouncementsScreen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final announcementNotifier = ref.watch(announcementViewModelProvider);
    return Scaffold(
      backgroundColor: myBasicBackground,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(appbarHeight),
        child: customAppBar(context: context, title: "Duyurular"),
      ),
      body: ListView.builder(
        itemCount: announcementNotifier.announcements.length,
        itemBuilder: (context, index) {
          return myCard(
            context,
            announcementNotifier.announcements[index].title,
            announcementNotifier.announcements[index].description,
            announcementNotifier.announcements[index].publisher,
            announcementNotifier.announcements[index].publishDate,
          );
        },
      ),
    );
  }

  Widget myCard(
    BuildContext context,
    String cardTitle,
    String cardDescription,
    String publisher,
    String cardDate,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        decoration: BoxDecoration(
          color: const Color(0XFFF6F6F6),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: SvgPicture.asset(
                        'assets/images/img_trash_primary.svg',
                        semanticsLabel: 'logout',
                        height: context.sized.dynamicHeight(0.03),
                      ),
                    ),
                    Text(
                      cardTitle,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            height: 1.50,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
                Text(
                  cardDate,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  cardDescription,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Text(
                publisher,
                textAlign: TextAlign.end,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
