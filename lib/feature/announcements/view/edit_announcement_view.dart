import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:kidsconnect/feature/announcements/view/widgets/custom_text_field.dart';

import '../../../core/constants/color_constant.dart';
import '../viewModel/announcements_view_model.dart';

class EditAnnouncementView extends ConsumerStatefulWidget {
  const EditAnnouncementView(
      {required this.guid,
      required this.announcementTypeId,
      required this.title,
      required this.description,
      super.key});
  static String routeName = 'EditAnnouncementScreen';
  final String guid;
  final String announcementTypeId;
  final String title;
  final String description;

  @override
  ConsumerState<EditAnnouncementView> createState() => _EditAnnouncementViewState();
}

class _EditAnnouncementViewState extends ConsumerState<EditAnnouncementView> {
  late final TextEditingController titleInput;

  late final TextEditingController descriptionInput;

  @override
  void initState() {
    titleInput = TextEditingController(text: widget.title);
    descriptionInput = TextEditingController(text: widget.description);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final announcementNotifier = ref.watch(announcementViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: myPrimaryColor, //change your color here
        ),
        title: const Text(
          'Duyuru Düzele',
          style: TextStyle(color: myPrimaryColor),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomTextField(
            controller: titleInput,
            hintText: 'Başlık Giriniz',
            prefixIcon: const FaIcon(
              FontAwesomeIcons.fileLines,
              color: myPrimaryColor,
            ),
            onChanged: (val) {
              announcementNotifier.setTitle = val;
            },
          ),
          SizedBox(
            width: context.sized.dynamicWidth(0.9),
            child: announcementDropdownButton(context, announcementNotifier),
          ),
          const SizedBox(height: 20),
          CustomTextField(
            controller: descriptionInput,
            hintText: 'Açıklama Giriniz',
            keyboardType: TextInputType.multiline,
            fieldMinLines: 4,
            fieldMaxLines: 8,
            prefixIcon: const FaIcon(
              FontAwesomeIcons.message,
              color: myPrimaryColor,
            ),
            onChanged: (val) {
              announcementNotifier.setDescription = val;
            },
          ),
          SizedBox(
            width: context.sized.dynamicWidth(0.8),
            height: context.sized.dynamicHeight(0.06),
            child: ElevatedButton(
              onPressed: () async {
                bool result = await announcementNotifier.updateAnnouncement(widget.guid);
                if (result) {
                  announcementNotifier.fetchAnnouncements();
                  if (!context.mounted) return;
                  Navigator.pop(context);
                  announcementNotifier.fetchAnnouncements();
                }
              },
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(8),
                  elevation: 1,
                  backgroundColor: myTextWhiteColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
              child: Center(
                child: Text(
                  'Güncelle',
                  style: GoogleFonts.urbanist(
                    color: mySecondaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget announcementDropdownButton(BuildContext context, announcementNotifier) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Theme.of(context).colorScheme.primary)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          iconSize: 32,
          iconEnabledColor: Theme.of(context).colorScheme.primary,
          hint: const Text("Duyuru Tipi Seçiniz"),
          value: announcementNotifier.selectedAnnouncementType,
          items: announcementNotifier.announcementType.map<DropdownMenuItem<AnnouncementType>>((AnnouncementType type) {
            return DropdownMenuItem<AnnouncementType>(
              value: type,
              child: Text(
                type.name,
                style: const TextStyle(fontSize: 18),
              ),
            );
          }).toList(),
          onChanged: (type) {
            announcementNotifier.changeAnnouncementType(type!);
          },
        ),
      ),
    );
  }
}
