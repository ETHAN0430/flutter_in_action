import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);
  static const double textScaleFactor = 1.5;

  @override
  Widget build(BuildContext context) {
    // 添加 + 按钮不会触发整个 ValueListenableRoute 组件的 build
    print('build');
    return Scaffold(
      appBar: AppBar(title: Text('ValueListenableBuilder 测试')),
      body: Center(
        child: ValueListenableBuilder<int>(
          builder: (BuildContext context, int value, Widget? child) {
            // builder 方法只会在 _counter 变化时被调用
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                child!,
                Text('$value 次', textScaleFactor: textScaleFactor),
              ],
            );
          },
          valueListenable: _counter,
          // 当子组件不依赖变化的数据，且子组件收件开销比较大时，指定 child 属性来缓存子组件非常有用
          child: const Text('点击了 ', textScaleFactor: textScaleFactor),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        // 点击后值 +1，触发 ValueListenableBuilder 重新构建
        onPressed: () => _counter.value += 1,
      ),
    );
  }
}
  // var _themeColor = Colors.yellow; //当前路由主题色
  //
  // @override
  // Widget build(BuildContext context) {
  //   ThemeData themeData = Theme.of(context);
  //   return Theme(
  //     data: ThemeData(
  //         primarySwatch: _themeColor, //用于导航栏、FloatingActionButton的背景色等
  //         iconTheme: IconThemeData(color: _themeColor) //用于Icon颜色
  //     ),
  //     child: Scaffold(
  //       appBar: AppBar(title: Text("主题测试")),
  //       body: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: <Widget>[
  //           //第一行Icon使用主题中的iconTheme
  //           Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: <Widget>[
  //                 Icon(Icons.favorite),
  //                 Icon(Icons.airport_shuttle),
  //                 Icon(Icons.call_missed_rounded),
  //                 Text("  颜色跟随主题")
  //               ]
  //           ),
  //           //为第二行Icon自定义颜色（固定为黑色)
  //           Theme(
  //             data: themeData.copyWith(
  //               iconTheme: themeData.iconTheme.copyWith(
  //                   color: Colors.red
  //               ),
  //             ),
  //             child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: <Widget>[
  //                   Icon(Icons.favorite),
  //                   Icon(Icons.airport_shuttle),
  //                   Text("  颜色固定红色")
  //                 ]
  //             ),
  //           ),
  //         ],
  //       ),
  //       floatingActionButton: FloatingActionButton(
  //           onPressed: () => //切换主题
  //           setState(() =>
  //           _themeColor =
  //           _themeColor == Colors.teal ? Colors.blue : Colors.teal
  //           ),
  //           child: Icon(Icons.palette)
  //       ),
  //     ),
  //   );
//   }
// }
