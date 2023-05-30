import 'package:flutter/cupertino.dart';

import '../../components/home_card.dart';

class CardScrollView extends StatelessWidget {
  const CardScrollView({
    Key? key,
    required this.cardItems,
  }) : super(key: key);

  final List<Map<String, dynamic>> cardItems;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          cardItems.length,
              (index) => HomeCard(
            accountType: cardItems[index]["accountType"],
            accountNumber: cardItems[index]["accountNumber"],
            scanneedNumber: cardItems[index]["scanneedNumber"],
            TotalscanneedAmount: cardItems[index]["TotalscanneedAmount"],
          ),
        ),
      ),
    );
  }
}

