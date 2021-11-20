import 'package:flutter/material.dart';

class Loadingscreen extends StatelessWidget {
  const Loadingscreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: const Color(0xFF383838).withOpacity(0.6),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(80)),
            height: 50,
            width: 50,
            child: Container(
                alignment: Alignment.center,
                child: const CircularProgressIndicator()),
          ),
        ],
      ),
    );
  }
}
