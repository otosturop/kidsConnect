import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/constants/app_constant.dart';
import '../../../core/constants/color_constant.dart';
import '../../../product/widgets/custom_appbar.dart';

class MediaView extends StatelessWidget {
  const MediaView({super.key});
  static String routeName = 'MediaScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myBasicBackground,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(appbarHeight),
        child: customAppBar(context: context, title: "Medya"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
        child: Container(
          width: double.infinity,
          height: context.sized.dynamicHeight(0.6),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Column(
            children: [
              imageTitleBar(),
              touchImageDecoration(context),
              actionBar(context),
            ],
          ),
        ),
      ),
    );
  }

  ListTile imageTitleBar() {
    return ListTile(
      leading: Container(
        width: 50.0,
        height: 50.0,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: CircleAvatar(
          child: ClipOval(
              child: Image.network(
            "https://avatar.iran.liara.run/public/boy",
            fit: BoxFit.cover,
          )),
        ),
      ),
      title: const Text(
        "fullname",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: const Text("deneme yazı"),
      trailing: const Text("1.2.1.2024"),
    );
  }

  InkWell touchImageDecoration(BuildContext context) {
    return InkWell(
      onDoubleTap: () {},
      onTap: () {},
      child: Container(
          margin: const EdgeInsets.all(10.0),
          width: double.infinity,
          height: context.sized.dynamicHeight(0.4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black45,
                offset: Offset(0, 5),
                blurRadius: 8.0,
              ),
            ],
            image: const DecorationImage(
              image: NetworkImage('https://picsum.photos/300/400'),
              fit: BoxFit.cover,
            ),
          )),
    );
  }

  Padding actionBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Row(
                children: <Widget>[
                  myIconButton(
                    () {},
                    const Icon(Icons.favorite_border),
                  ),
                  const Text(
                    "15",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 20.0),
              Row(
                children: <Widget>[
                  myIconButton(
                    () {},
                    const Icon(Icons.chat),
                  ),
                  const Text(
                    "12",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          myIconButton(
            () {},
            const Icon(Icons.library_books_outlined),
          ),
        ],
      ),
    );
  }

  IconButton myIconButton(VoidCallback onPressed, Icon myIcon) {
    return IconButton(
      onPressed: onPressed,
      icon: myIcon,
      iconSize: 30,
    );
  }
}
