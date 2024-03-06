import 'package:flutter/material.dart';
import 'package:stepsapp/page_body.dart';
import 'package:stepsapp/page_indicator.dart';

class StepForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StepFormState();
  }
}

class _StepFormState extends State<StepForm> {
  final _stepFormController = PageController();
  int _page = 0;

  List _pagesList = [
    pageBody('https://miro.medium.com/max/1400/1*TFZQzyVAHLVXI_wNreokGA.png',
        'Flutter', 'Texto aqui...'),
    pageBody(
        'https://www.mundopositivo.com.br/wp-content/uploads/2021/05/Image3.png',
        'Multi Plataforma',
        'Texto dois'),
    pageBody(
        'https://e7.pngegg.com/pngimages/649/174/png-clipart-dart-google-developers-flutter-android-darts-text-logo.png',
        'Dart',
        'Texto três')
  ];

  void _changeStep(bool nextPage) {
    if (_page < 2 && nextPage) {
      setState(() {
        _page++;
      });
      _stepFormController.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.easeInExpo);
    } else if (_page > 0 && !nextPage) {
      setState(() {
        _page--;
      });
      _stepFormController.previousPage(
          duration: Duration(milliseconds: 300), curve: Curves.easeInExpo);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Simple Project'),
        foregroundColor: Colors.white,
      ),
      body: PageView.builder(
          physics: NeverScrollableScrollPhysics(),
          controller: _stepFormController,
          itemBuilder: (BuildContext context, int index) {
            return _pagesList[index];
          }),
      bottomNavigationBar:
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        FloatingActionButton(
          onPressed: () => _changeStep(false),
          child: Text('Anterior'),
        ),
        pageIndicator(_page == 0),
        pageIndicator(_page == 1),
        pageIndicator(_page == 2),
        FloatingActionButton(
          onPressed: () => _changeStep(true),
          child: Text('Próximo'),
        ),
      ]),
    );
  }
}
