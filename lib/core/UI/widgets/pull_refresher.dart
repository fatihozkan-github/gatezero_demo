import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter/material.dart';

import '../shared/colors.dart';
import 'widget_loading.dart';

/// • Refreshes the page when pulled down.
///
/// • Loads more content when pulled up.
class PullRefresher extends StatefulWidget {
  final Widget child;
  final Function refreshFunction;
  final Function loadingFunction;
  final bool enableFooter;

  PullRefresher({this.child, this.refreshFunction, this.loadingFunction, this.enableFooter = false});

  @override
  State<PullRefresher> createState() => _PullRefresherState();
}

class _PullRefresherState extends State<PullRefresher> {
  RefreshController _refreshController = RefreshController();

  void _onRefresh() async {
    await widget.refreshFunction();
    if (mounted) setState(() {});
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await widget.loadingFunction();
    if (mounted) setState(() {});
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return _refreshController.isRefresh
        ? LoadingWidget()
        : SmartRefresher(
            enablePullUp: true,
            child: widget.child,
            enablePullDown: true,
            header: _getHeader(),
            footer: _getFooter(),
            onRefresh: _onRefresh,
            onLoading: _onLoading,
            controller: _refreshController,
          );
  }

  _getHeader() => WaterDropHeader(
        waterDropColor: Colors.transparent,
        refresh: LoadingWidget(size: 20),
        idleIcon: Icon(Icons.autorenew, size: 20, color: UIColors.primaryColor),
        complete: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check, color: Colors.green, size: 30),
            SizedBox(width: 5),
            Text('Yenilendi!', style: TextStyle(color: Colors.green, fontSize: 16)),
          ],
        ),
      );

  _getFooter() => CustomFooter(
        builder: (BuildContext context, LoadStatus mode) {
          Widget body;
          if (widget.enableFooter) {
            if (mode == LoadStatus.idle) {
              body = Text("");
            } else if (mode == LoadStatus.loading) {
              body = LoadingWidget();
            } else if (mode == LoadStatus.failed) {
              body = Text("Bir hata oluştu, tekrar dene!");
            } else if (mode == LoadStatus.canLoading) {
              body = Text("Daha çok görmek için yukarı çek!");
            } else {
              body = Text("Yeni bir haber yok!");
            }
            return Container(height: 55.0, child: Center(child: body));
          } else {
            return SizedBox();
          }
        },
      );
}
