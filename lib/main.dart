import 'package:flutter/material.dart';
import 'package:pr2/widgets/ContentCard.dart';
import 'package:pr2/widgets/NavigationButton.dart';
import 'package:pr2/widgets/ProgressIndicator.dart';
import 'package:pr2/widgets/QuickNavigation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Практическая работа 3',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ContentSwitcherScreen(),
    );
  }
}

class ContentSwitcherScreen extends StatefulWidget {
  @override
  _ContentSwitcherScreenState createState() => _ContentSwitcherScreenState();
}

class _ContentSwitcherScreenState extends State<ContentSwitcherScreen> {
  int _currentContentIndex = 0;

  final List<Map<String, dynamic>> _contentList = [
    {
      'title': 'Страница 1',
      'color': Colors.blue[100]!,
    },
    {
      'title': 'Страница 2',
      'color': Colors.green[100]!,
    },
    {
      'title': 'Страница 3',
      'color': Colors.orange[100]!,
    },
    {
      'title': 'Страница 4',
      'color': Colors.purple[100]!,
    },
  ];

  void _nextContent() {
    setState(() {
      _currentContentIndex = (_currentContentIndex + 1) % _contentList.length;
    });
  }

  void _previousContent() {
    setState(() {
      _currentContentIndex = (_currentContentIndex - 1) % _contentList.length;
      if (_currentContentIndex < 0) {
        _currentContentIndex = _contentList.length - 1;
      }
    });
  }

  void _goToPage(int index) {
    setState(() {
      _currentContentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentContent = _contentList[_currentContentIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('ПР3'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ContentCard(
              title: currentContent['title'],
              color: currentContent['color'],
              child: ProgressIndicatorWidget(
                currentIndex: _currentContentIndex,
                totalCount: _contentList.length,
              ),
            ),

            SizedBox(height: 40.0),

            NavigationButtons(
              onPrevious: _previousContent,
              onNext: _nextContent,
            ),

            SizedBox(height: 20.0),

            QuickNavigation(
              currentIndex: _currentContentIndex,
              totalPages: _contentList.length,
              onPageSelected: _goToPage,
            ),
          ],
        ),
      ),
    );
  }
}