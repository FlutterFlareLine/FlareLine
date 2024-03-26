import 'package:flutter/material.dart';

import 'package:free_flutter_admin_dashboard/components/card/white_card.dart';
import 'package:free_flutter_admin_dashboard/components/charts/bar_chart.dart';
import 'package:free_flutter_admin_dashboard/components/chats.dart';
import 'package:free_flutter_admin_dashboard/components/charts/circular_chart.dart';
import 'package:free_flutter_admin_dashboard/components/charts/line_chart.dart';
import 'package:free_flutter_admin_dashboard/components/charts/map_chart.dart';
import 'package:free_flutter_admin_dashboard/components/tables/TopChannel.dart';
import 'package:free_flutter_admin_dashboard/pages/dashboard/grid_card.dart';
import 'package:responsive_builder/responsive_builder.dart';

class EcommercePage extends StatelessWidget {
  const EcommercePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: SingleChildScrollView(
          child: Column(children: [
            GridCard(),
            SizedBox(
              height: 16,
            ),
            _revenueWidget(),
            SizedBox(
              height: 16,
            ),
            _analytics(),
            SizedBox(
              height: 16,
            ),
            _channels()
          ])),
    );
  }

  Widget _revenueWidget() {
    return ScreenTypeLayout.builder(
      desktop: _revenueWidgetDesktop,
      mobile: _revenueWidgetMobile,
      tablet: _revenueWidgetMobile,
    );
  }

  Widget _revenueWidgetDesktop(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Row(
        children: [
          Expanded(
            child: _lineChart(),
            flex: 2,
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: _barChart(),
            flex: 1,
          ),
        ],
      ),
    );
  }

  Widget _revenueWidgetMobile(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 360,
          child: _lineChart(),
        ),
        SizedBox(
          height: 16,
        ),
        SizedBox(
          height: 360,
          child: _barChart(),
        ),
      ],
    );
  }

  _lineChart() {
    return WhiteCard(
      child: LineChartWidget(),
    );
  }

  _barChart() {
    return WhiteCard(child: BarChartWidget());
  }

  _analytics() {
    return ScreenTypeLayout.builder(
      desktop: _analyticsWeb,
      mobile: _analyticsMobile,
      tablet: _analyticsMobile,
    );
  }

  Widget _analyticsWeb(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Row(
        children: [
          Expanded(
            child: WhiteCard(
              child: CircularhartWidget(),
            ),
            flex: 2,
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: WhiteCard(
              child: MapChartWidget(),
            ),
            flex: 1,
          ),
        ],
      ),
    );
  }

  Widget _analyticsMobile(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 350,
          child: WhiteCard(
            child: CircularhartWidget(),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        SizedBox(
          height: 350,
          child: WhiteCard(
            child: MapChartWidget(),
          ),
        ),
      ],
    );
  }

  _channels() {
    return ScreenTypeLayout.builder(
      desktop: _channelsWeb,
      mobile: _channelMobile,
      tablet: _channelMobile,
    );
  }

  Widget _channelsWeb(BuildContext context) {
    return SizedBox(
        height: 380,
        child: Row(
          children: [
            Expanded(
              child: TopChannelWidget(),
              flex: 2,
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(child: ChatsWidget(), flex: 1),
          ],
        ));
  }

  Widget _channelMobile(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 380,
          child: TopChannelWidget(),
        ),
        SizedBox(
          height: 16,
        ),
        SizedBox(
            height: 380,
            child: ChatsWidget()),
      ],
    );
  }
}
