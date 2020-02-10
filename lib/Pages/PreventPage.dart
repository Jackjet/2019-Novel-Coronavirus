import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_app/Sidebar.dart';

class PreventPage extends StatefulWidget {
  @override
  _PreventPageState createState() => _PreventPageState();
}

class _PreventPageState extends State<PreventPage> {
  InAppWebViewController webView;
  String url = "";
  double progress = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('预防治疗', textAlign: TextAlign.center,),
        centerTitle: true,
        actions: <Widget>[ //导航后面的图标
          IconButton(icon: Icon(Icons.refresh,),
              onPressed: () {
                webView.reload();
              }
          ),
        ],
      ),
      body: Container(
          child: Column(children: <Widget>[
            Container(
                child: progress < 1.0
                    ? LinearProgressIndicator(value: progress)
                    : Container()),
            Expanded(
              child: Container(
                child: InAppWebView(
                  initialUrl: "https://quark.sm.cn/api/rest?q=%E6%96%B0%E5%86%A0%E8%82%BA%E7%82%8E%E9%A2%84%E9%98%B2%E6%8E%AA%E6%96%BD&method=Highquality.quality&format=html&bkt=new_new&from=kkframenew&uc_param_str=dnntnwvepffrgibijbprsvdsdichei&by=submit&snum=5",
                  initialHeaders: {},
                  initialOptions: InAppWebViewWidgetOptions(
                      inAppWebViewOptions: InAppWebViewOptions(
                        debuggingEnabled: true,
                      )),
                  onWebViewCreated: (InAppWebViewController controller) {
                    webView = controller;
                  },
                  onLoadStart: (InAppWebViewController controller,
                      String url) {
                    setState(() {
                      this.url = url;
                    });
                  },
                  onLoadStop:
                      (InAppWebViewController controller, String url) async {
                    setState(() {
                      this.url = url;
                    });
                  },
                  onProgressChanged:
                      (InAppWebViewController controller, int progress) {
                    setState(() {
                      this.progress = progress / 100;
                    });
                  },
                ),
              ),
            ),
          ])),
      drawer: Builder(
        builder: (context) =>
            Drawer(
              child: Sidebar(),
            ),

      ),
    );
  }
}
