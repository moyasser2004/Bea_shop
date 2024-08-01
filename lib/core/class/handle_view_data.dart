import 'package:bea_shop/core/utrlis/api/request_state.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HandelViewData extends StatelessWidget {
  final RequestState state;
  final Widget widget;
  final double height;

  const HandelViewData(
      {super.key,
      required this.state,
      required this.widget,
      required this.height});

  @override
  Widget build(BuildContext context) {
    if (state == RequestState.loading) {
      return SingleChildScrollView(
          child: SizedBox(
        height: height,
        child: Center(
            child: Lottie.asset("lottie/animation_lmw8kg8z.json",
                height: 200, width: 200, fit: BoxFit.fill)),
      ));
    } else if (state == RequestState.internetFailure) {
      return SingleChildScrollView(
          child: SizedBox(
        height: height,
        child: const Center(child: Text("No Internet connection")),
      ));
    } else if (state == RequestState.serverFailure) {
      return SingleChildScrollView(
          child: SizedBox(
        height: height,
        child: Center(
            child: Lottie.asset("lottie/animation_lmw8m9xr.json",
                height: 250, width: 250, fit: BoxFit.fill)),
      ));
    } else if (state == RequestState.notData) {
      return SingleChildScrollView(
          child: SizedBox(
              height: height,
              child: Center(
                  child: Lottie.asset(
                "lottie/animation_ln7lj0u9.json",
                height: 250,
                width: 250,
                fit: BoxFit.fill,
              ))));
    } else if (state == RequestState.error) {
      return SingleChildScrollView(
          child: SizedBox(
        height: height,
        child: Center(
            child: Lottie.asset("lottie/animation_lmw8m9xr.json",
                height: 250, width: 250, fit: BoxFit.fill)),
      ));
    } else {
      return widget;
    }
  }
}
