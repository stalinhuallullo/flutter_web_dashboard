import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/global/helpers/reponsiveness.dart';
import 'package:flutter_web_dashboard/ui/widgets/available_drivers_table.dart';
import 'package:flutter_web_dashboard/ui/widgets/overview_cards_large.dart';
import 'package:flutter_web_dashboard/ui/widgets/overview_cards_medium.dart';
import 'package:flutter_web_dashboard/ui/widgets/overview_cards_small.dart';
import 'package:flutter_web_dashboard/ui/widgets/revenue_section_large.dart';
import 'package:flutter_web_dashboard/ui/widgets/revenue_section_small.dart';

class HomeView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    print("home");
    return Container(
      child: Column(
        children: [
          Expanded(
              child: ListView(
            children: [
              if (ResponsiveWidget.isLargeScreen(context) ||
                  ResponsiveWidget.isMediumScreen(context))
                if (ResponsiveWidget.isCustomSize(context))
                  OverviewCardsMediumScreen()
                else
                  OverviewCardsLargeScreen()
              else
                OverviewCardsSmallScreen(),
              if (!ResponsiveWidget.isSmallScreen(context))
                RevenueSectionLarge()
              else
                RevenueSectionSmall(),

                AvailableDriversTable(),
             
            ],
          ))
        ],
      ),
    );
  }
}