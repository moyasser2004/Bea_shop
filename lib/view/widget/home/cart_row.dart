
import 'package:flutter/cupertino.dart';


class CartRow extends StatelessWidget {

  final String text1;
  final String text2;
  final Color color;

  const CartRow({Key? key, required this.text1, required this.text2, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Text(text1,style: TextStyle(color: color,fontSize: 14),),
          const Spacer(),
          Text("\$ $text2"),
        ],
      ),
    );
  }
}
