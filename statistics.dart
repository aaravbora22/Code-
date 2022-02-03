import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:study_pomodoro/Pomodoro/timer.dart';

class StatisticsHomePageTasks extends StatefulWidget {
  const StatisticsHomePageTasks({Key key}) : super(key: key);

  @override
  _StatisticsHomePageTasksState createState() =>
      _StatisticsHomePageTasksState();
}

Future<void> _handleRefresh() async {
  return await Future.delayed(Duration(seconds: 2));
}

class _StatisticsHomePageTasksState extends State<StatisticsHomePageTasks> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _items = [
    TaskWidgetView(),

    //Return back to pomodoro
    TimerPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: LiquidPullToRefresh(
        onRefresh: _handleRefresh,
        color: Colors.blue,
        height: 175.0,
        child: _items.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.check_box,
            ),
            label: 'Classes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Pomorodo',
          ),
        ],
      ),
    );
  }
}

class TaskWidgetView extends StatelessWidget {
  Slidable taskWidget(Color color, String title, String time) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.3,
      child: Container(
        height: 80,
        margin: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            offset: Offset(0, 9),
            blurRadius: 20,
            spreadRadius: 1,
          )
        ]),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: color, width: 4),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                Text(time,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ))
              ],
            ),
          ],
        ),
      ),
      secondaryActions: [
        IconSlideAction(
          caption: "Accept",
          color: Colors.blue,
          icon: Icons.arrow_circle_up_outlined,
          onTap: () {
            // Navigator.of(context).push(
            //   MaterialPageRoute(builder: (_) => AppBarLineChart()),
            // );
          },
        ),
        IconSlideAction(
          caption: "Decline",
          color: Colors.green,
          icon: Icons.compare_arrows_outlined,
          onTap: () {
            // Navigator.of(context).push(
            //   MaterialPageRoute(builder: (_) => BuySharesForm()),
            // );
          },
        ),
        IconSlideAction(
          caption: "Tentative",
          color: Colors.red,
          icon: Icons.query_builder,
          onTap: () {},
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ),
                taskWidget(Colors.yellow, "Math Class", "8:55-9:35"),
                taskWidget(Colors.green, "Physics", "9:40-10:20"),
                taskWidget(Colors.red, "Short Break", "10:20-10:30"),
                taskWidget(Colors.blue, "Biology", "10:30-11:10"),
                taskWidget(Colors.black, "German", "11:15-11:55"),
                taskWidget(Colors.purple, "Design", "12:00-1:25"),
                taskWidget(Colors.green, "English", "1:25-2:05"),
                taskWidget(Colors.red, "PHE", "2:10-2:50"),
                taskWidget(Colors.green, "History", "2:50-3:30"),
                taskWidget(Colors.black, "Free!", "ALL DAY"),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
