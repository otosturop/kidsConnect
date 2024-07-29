import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/app_constant.dart';
import '../../../core/constants/color_constant.dart';
import '../../../product/widgets/custom_appbar.dart';

class AnnouncementsView extends StatelessWidget {
  const AnnouncementsView({super.key});
  static String routeName = 'AnnouncementsScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myBasicBackground,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(appbarHeight),
        child: customAppBar(context: context, title: "Duyurular"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          myCard(context, "Deneme duyur Başlık deneme", "01.01.2024"),
        ],
      ),
    );
  }

  Widget myCard(BuildContext context, String cardTitle, String cardDate) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 28),
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    cardTitle,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w800,
                      color: myTextBlackColor,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      cardDate,
                      style: GoogleFonts.poppins(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: myTextBlackColor,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Theme.of(context).colorScheme.primary),
                        foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                      ),
                      child: Text('Sorgula',
                          style: GoogleFonts.poppins(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          )),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
