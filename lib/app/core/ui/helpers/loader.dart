import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

//will run only in State objects
//the class that must be passed to Loader mixin, must be a Statefull Widget, that's the reason why this mixin has the context variable

//on keyword describes which inheritance structure the mixin can be used on. In this case, the Loader can only be used on State classes
mixin Loader<T extends StatefulWidget> on State<T> {
  var isOpen = false;

  void showLoader() {
    if (!isOpen) {
      isOpen = true;
      showDialog(
          context: context,
          builder: ((context) {
            return LoadingAnimationWidget.threeArchedCircle(
              color: Colors.white,
              size: 60.0,
            );
          }));
    }
  }

  void hideLoader() {
    if (isOpen) {
      isOpen = false;
      Navigator.pop(context);
    }
  }
}
