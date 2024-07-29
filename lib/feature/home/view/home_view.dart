import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

import '../../../core/constants/app_constant.dart';
import '../../../core/constants/color_constant.dart';
import '../../../product/widgets/custom_appbar.dart';
import '../../bottom_navigation/viewModel/bottom_navigation_view_model.dart';
import '../viewModel/home_view_model.dart';
import 'widgets/bottom_navigation_widget.dart';
import 'widgets/floating_action_button_widget.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});
  static String routeName = 'HomeScreen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeNotifier = ref.watch(homeViewModelProvider);
    final bottomBarNotifier = ref.watch(bottomBarProvider);

    return Scaffold(
      backgroundColor: myBasicBackground,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(appbarHeight),
        child: customAppBar(context: context, title: "Home"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: floatingActionButtonWidget(context),
      bottomNavigationBar: bottomNavigationBarWidget(context, bottomBarNotifier),
      body: ListView(
        children: [
          const Text('Deneme'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
            child: homeNotifier.isLoading
                ? myCircular(context)
                : SizedBox(
                    height: context.sized.dynamicHeight(0.8),
                    child: ListView.builder(
                      itemCount: homeNotifier.schools.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8),
                        child: myCard(
                          context,
                          homeNotifier.schools[index].name,
                          homeNotifier.schools[index].phoneNumber,
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget myCard(BuildContext context, String title, String phone) {
    return Card(
      elevation: 6,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: ListTile(
        leading: ClipOval(
            child: Image.network(
          "https://avatar.iran.liara.run/public/boy",
          fit: BoxFit.cover,
        )),
        title: Text(
          title,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w800,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        subtitle: Text("Tel: $phone",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: Colors.black,
            )),
        trailing: const Icon(
          Icons.chevron_right,
          size: 42,
          color: Colors.black,
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
