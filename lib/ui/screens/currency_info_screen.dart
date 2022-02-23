import 'package:flutter/material.dart';

import 'package:flutter_intership_onix/data/models/local/currency.dart';

class CurrencyInfoScreen extends StatelessWidget {
  const CurrencyInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Currency currency =
        ModalRoute.of(context)!.settings.arguments as Currency;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'Currency info',
          style: TextStyle(color: Theme.of(context).secondaryHeaderColor),
        ),
        centerTitle: true,
      ),
      body: Align(
        alignment: Alignment.center,
        child: SizedBox(
          height: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    offset: Offset(0, 7),
                    blurRadius: 7,
                  )
                ], borderRadius: BorderRadius.all(Radius.circular(15))),
                child: _getImage(currency.countryCode),
              ),
              Text(currency.name),
              Text(currency.fullName),
              Text(currency.symbol),
              Text('Rate : ${currency.rateToUah.toString()} UAH'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getImage(String countryCode) {
    if (countryCode == 'btc') {
      return Image.network(
        'https://mundotokens.com/wp-content/uploads/2018/01/bitcoin_.jpg',
        width: 200,
        errorBuilder:
            (BuildContext context, Object exception, StackTrace? stackTrace) {
          return Icon(
            Icons.image,
            size: 35,
            color: Theme.of(context).secondaryHeaderColor,
          );
        },
      );
    } else {
      return Image.network(
        'https://flagcdn.com/w80/' + countryCode + '.png',
        scale: 0.5,
        errorBuilder:
            (BuildContext context, Object exception, StackTrace? stackTrace) {
          return Icon(
            Icons.image,
            size: 35,
            color: Theme.of(context).secondaryHeaderColor,
          );
        },
      );
    }
  }
}
