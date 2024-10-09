import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_demo/widgets/custom_search_delegate.dart';

class AppBarScreen extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  AppBarScreen({Key? key})
      : preferredSize = const Size.fromHeight(56.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppBar(
        title: Text(
          'UniShop.',
          style: GoogleFonts.ubuntu(
            textStyle: Theme.of(context).textTheme.displayLarge,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
            icon: const Icon(
              Icons.search,
              size: 36,
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.add_shopping_cart_sharp,
              size: 36,
            ),
            onPressed: () {},
          ),
          Padding(
            padding: const EdgeInsets.only(
                right: 20.0), // Adjust the padding to move it left
            child: IconButton(
              icon: const Icon(
                Icons.manage_accounts_rounded,
                size: 38,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
