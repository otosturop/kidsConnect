import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:kidsconnect/feature/announcements/view/add_announcement_view.dart';
import 'package:kidsconnect/feature/announcements/view/edit_announcement_view.dart';

import '../../../core/constants/app_constant.dart';
import '../../../core/constants/color_constant.dart';
import '../../../core/routes/onGenerateRoute.dart';
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
      floatingActionButton: FloatingActionButton.small(
        heroTag: "btn2",
        onPressed: () {
          Navigator.pushNamed(context, AddAnnouncementView.routeName);
        },
        backgroundColor: myPrimaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 3, color: myPrimaryColor),
          borderRadius: BorderRadius.circular(40),
        ),
        elevation: 2.0,
        child: const FaIcon(FontAwesomeIcons.plus),
      ),
      body: Column(
        children: [
          bannerTitle(),
          announcementNotifier.isLoading
              ? myCircular(context)
              : SizedBox(
                  height: context.sized.dynamicHeight(0.6),
                  child: ListView.builder(
                    itemCount: announcementNotifier.announcements.length,
                    itemBuilder: (context, index) {
                      return Slidable(
                        key: UniqueKey(),
                        startActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          dismissible: DismissiblePane(onDismissed: () async {
                            bool result = await announcementNotifier
                                .removeAnnouncement(announcementNotifier.announcements[index].guid);
                            debugPrint('durumum silin di mi: $result');
                            announcementNotifier.removeAnnouncementFromList(index);
                          }),
                          children: [
                            SlidableAction(
                              icon: Icons.delete,
                              backgroundColor: myError,
                              autoClose: false,
                              onPressed: (context) {
                                final controller = Slidable.of(context)!;
                                showCupertinoDialog<void>(
                                  context: context,
                                  builder: (BuildContext context) => CupertinoAlertDialog(
                                    title: const Text('Emin misiniz? Bu işlem geri alınamaz!'),
                                    actions: [
                                      CupertinoDialogAction(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Hayır'),
                                      ),
                                      CupertinoDialogAction(
                                        isDestructiveAction: true,
                                        onPressed: () async {
                                          bool result = await announcementNotifier
                                              .removeAnnouncement(announcementNotifier.announcements[index].guid);
                                          debugPrint('durumum silin di mi: $result');
                                          controller.close();
                                          controller.dismiss(
                                            ResizeRequest(const Duration(milliseconds: 300), () {
                                              Navigator.pop(context);
                                              announcementNotifier.removeAnnouncementFromList(index);
                                            }),
                                            duration: const Duration(milliseconds: 300),
                                          );
                                        },
                                        child: const Text('Evet Sil'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        endActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          children: [
                            SlidableAction(
                              icon: FontAwesomeIcons.penToSquare,
                              backgroundColor: Colors.green,
                              onPressed: (context) {
                                announcementNotifier.findAnnouncementTypeById(
                                    announcementNotifier.announcements[index].announcementType);
                                Navigator.pushNamed(context, EditAnnouncementView.routeName,
                                    arguments: EditAnnouncementViewArguments(
                                        guid: announcementNotifier.announcements[index].guid,
                                        announcementTypeId:
                                            announcementNotifier.announcements[index].announcementType.toString(),
                                        title: announcementNotifier.announcements[index].title,
                                        description: announcementNotifier.announcements[index].description));
                              },
                            ),
                          ],
                        ),
                        child: myCard(
                          context,
                          announcementNotifier.announcements[index].title,
                          announcementNotifier.announcements[index].description,
                          announcementNotifier.announcements[index].publisher,
                          announcementNotifier.splitDate(announcementNotifier.announcements[index].publishDate),
                        ),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }

  Padding bannerTitle() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: FaIcon(
              FontAwesomeIcons.solidBookmark,
              size: 28,
              color: myOnError,
            ),
          ),
          Text(
            'Duyurular',
            style: GoogleFonts.dmSerifText(
              fontSize: 28,
              color: myOnError,
            ),
          ),
        ],
      ),
    );
  }

  Widget myCard(
    BuildContext context,
    String cardTitle,
    String cardDescription,
    String publisher,
    List<String> cardDate,
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
                Text(
                  cardTitle,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        height: 1.50,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Icons.date_range,
                            size: 16,
                          ),
                        ),
                        Text(
                          cardDate[1],
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                fontSize: 9,
                              ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 4.0),
                          child: Icon(
                            Icons.access_time,
                            size: 16,
                          ),
                        ),
                        Text(
                          cardDate[0],
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                fontSize: 9,
                              ),
                        ),
                      ],
                    ),
                  ],
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

  Center myCircular(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        color: Theme.of(context).colorScheme.primary,
        strokeWidth: 6,
      ),
    );
  }
}
