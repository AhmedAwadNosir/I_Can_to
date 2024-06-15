import 'package:flutter/material.dart';
import 'package:ican_to/features/favList/widgets/fav_list_view_body.dart';

class FavListView extends StatelessWidget {
  const FavListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Fav List",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
        ),
      ),
      body: const FavListViewBody(),
    );
  }
}
