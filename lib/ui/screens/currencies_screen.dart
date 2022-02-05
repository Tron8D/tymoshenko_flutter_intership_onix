import 'package:flutter/material.dart';
import 'package:flutter_intership_onix/data/models/currency.dart';
import 'package:flutter_intership_onix/ui/providers/currencies_list_provider.dart';

import 'package:flutter_intership_onix/ui/widgets/buttons/settings_button.dart';
import 'package:flutter_intership_onix/ui/widgets/stream_builders/currencies_list_view.dart';
import 'package:provider/provider.dart';

class CurrenciesScreen extends StatefulWidget {
  const CurrenciesScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CurrenciesScreen> createState() => CurrenciesScreenState();
}

class CurrenciesScreenState extends State<CurrenciesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'Currencies',
          style: TextStyle(color: Theme.of(context).secondaryHeaderColor),
        ),
        centerTitle: true,
        actions: const [SettingsButton()],
      ),
      body: Consumer<CurrenciesListProvider>(
        builder: (context, currenciesListProvider, _) {
          if (currenciesListProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return CurrenciesListView(
              onTap: _onTap,
            );
          }
        },
      ),
    );
  }

  void _onTap(id) {
    Currency currency =
        context.read<CurrenciesListProvider>().getCurrencyFromId(id);
    Navigator.of(context).pushNamed('/info_card_screen', arguments: currency);
  }
}
