import 'package:flutter/material.dart';
import 'package:travel_expenses/base/styles/text_styles.dart';
import 'package:travel_expenses/domain/account/account_repo.dart';
import 'package:travel_expenses/widgets/account_card.dart';
import '../../domain/account/account_model.dart';

class SummaryAccounts extends StatefulWidget {
  const SummaryAccounts({super.key});

  @override
  State<SummaryAccounts> createState() => _SummaryAccountsState();
}

class _SummaryAccountsState extends State<SummaryAccounts> {
  List<AccountModel> accounts = [];

  @override
  void initState() {
    loadData();
  }

  Future loadData() async {
    final res = await AccountRepo().loadMyAccounts();
    setState(() {
      accounts = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      margin: EdgeInsets.only(bottom: 16, top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Current balances',
              style: TypoStyles().kSectionHeader,
            ),
          ),
          Container(
            height: 150,
            margin: EdgeInsets.only(bottom: 8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: accounts
                    .map(
                      (val) => AccountCard(val),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
