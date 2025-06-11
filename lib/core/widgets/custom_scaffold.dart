import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? bottomNavigationBar;
  final Widget? endDrawer;
  final Widget? bottomSheet;
  final Widget? drawer;
  final bool extendBody;
  final Color? backgroundColor;
  final Widget? floatingActionButton;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final bool? resizeToAvoidBottomInset;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  const CustomScaffold(
      {super.key,
      this.appBar,
      required this.body,
      this.bottomNavigationBar,
      this.bottomSheet,
      this.drawer,
      this.extendBody = false,
      this.floatingActionButton,
      this.floatingActionButtonAnimator,
      this.floatingActionButtonLocation,
      this.resizeToAvoidBottomInset,
      this.scaffoldKey, this.backgroundColor, this.endDrawer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
          appBar: appBar,
          backgroundColor: backgroundColor,
          key: scaffoldKey,
          body: SafeArea(child: body),
          bottomNavigationBar: bottomNavigationBar,
          bottomSheet: bottomSheet,
          endDrawer: endDrawer,
          drawer: drawer,
          extendBody: extendBody,
          floatingActionButton: floatingActionButton,
          floatingActionButtonAnimator: floatingActionButtonAnimator,
          floatingActionButtonLocation: floatingActionButtonLocation,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        );
  }
}
