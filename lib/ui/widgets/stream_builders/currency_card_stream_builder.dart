import 'package:flutter/material.dart';
import 'package:flutter_intership_onix/data/models/currency.dart';

import '../currency_card.dart';

class CurrencyCardStreamBuilder extends StatelessWidget {
  final Stream<int> stream;
  final bool readOnly;
  final Currency currency;
  // final void Function() onTap;
  const CurrencyCardStreamBuilder({
    Key? key,
    required this.stream,
    required this.readOnly,
    required this.currency,
    // required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: stream,
        builder: (context, snapshot) {
          return CurrencyCard(
            readOnly: readOnly,
            currency: currency,
            // onTap: onTap,
          );
        });
  }
}
