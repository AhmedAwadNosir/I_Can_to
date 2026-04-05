import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ican_to/features/Authentication/functions/show_snack_bar.dart';
import 'package:ican_to/features/Home/manager/cubit/delet_item_form_fav_list_cubit.dart';
import 'package:ican_to/features/favList/manager/cubit/fetch_favorit_list_cubit.dart';
import 'package:ican_to/features/favList/widgets/fav_list_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class FavListView extends StatefulWidget {
  const FavListView({super.key});

  @override
  State<FavListView> createState() => _FavListViewState();
}

class _FavListViewState extends State<FavListView> {
  void initState() {
    BlocProvider.of<FetchFavoritListCubit>(context).fetchFavoritListData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Fav List",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
        ),
      ),
      body: BlocProvider(
        create: (context) => DeletItemFormFavListCubit(),
        child: BlocConsumer<FetchFavoritListCubit, FetchFavoritListState>(
          listener: (context, state) {
            if (state is FetchFavoritListFailure) {
              showSnackBar(state.errorMessage, context);
            }
            if (state is FetchFavoritListSuccess) {
              showSnackBar("favorit list fetched successfully", context);
            }
          },
          builder: (context, statefetch) {
            return BlocConsumer<DeletItemFormFavListCubit,
                DeletItemFormFavListState>(
              listener: (context, state) {
                if (state is DeletItemFormFavListFailure) {
                  showSnackBar(state.errorMessage, context);
                }
                if (state is DeletItemFormFavListSuccess) {
                  BlocProvider.of<FetchFavoritListCubit>(context)
                      .fetchFavoritListData();
                  showSnackBar(
                      "favorit item has been delleted successfully", context);
                }
              },
              builder: (context, statedelet) {
                return ModalProgressHUD(
                    inAsyncCall: (statefetch is FetchFavoritListLoading? ||
                            statedelet is DeletItemFormFavListLoading)
                        ? true
                        : false,
                    child: FavListViewBody(
                      favList: statefetch is FetchFavoritListSuccess
                          ? statefetch.favoritList
                          : [],
                    ));
              },
            );
          },
        ),
      ),
    );
  }
}
