import 'package:app/sceens/home/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(
          '',
        ),
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () {
            if (scaffoldKey.currentState!.isDrawerOpen) {
              scaffoldKey.currentState!.closeDrawer();
              //close drawer, if drawer is open
            } else {
              scaffoldKey.currentState!.openDrawer();
              //open drawer, if drawer is closed
            }
          },
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      drawer: SafeArea(
        child: Drawer(
            child: Container(
                color: Colors.white,
                width: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Modi',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 40),
                        ),
                        Text('BJP',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 30)),
                      ],
                    ),
                    Container(
                        height: MediaQuery.of(context).size.height * 0.70,
                        child: Image.asset(
                          'assets/images/spash.webp',
                          fit: BoxFit.fitWidth,
                          cacheHeight: 500,
                        )),
                  ],
                ))),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 50),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                  title: Text('Hello Sushant!',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(color: Colors.white)),
                  // subtitle: Text('Good Morning',
                  //     style: Theme.of(context)
                  //         .textTheme
                  //         .titleMedium
                  //         ?.copyWith(color: Colors.white54)),
                  // trailing: GestureDetector(
                  //   onTap: () => {setState(() {
                  //     Scaffold.of(context).openDrawer();
                  //   }) },
                  //   child: const CircleAvatar(
                  //     radius: 30,
                  //     backgroundImage: AssetImage('assets/images/user.JPG'),
                  //   ),
                  // ),
                ),
                const SizedBox(height: 30)
              ],
            ),
          ),
          Container(
            color: Theme.of(context).primaryColor,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(200))),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 40,
                mainAxisSpacing: 30,
                children: [
                  GestureDetector(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(title: 'Voter Search'),)), child:  itemDashboard('Voters list', CupertinoIcons.person_2,
                      Colors.orange, context),),
                  
                  itemDashboard('Search', CupertinoIcons.search,
                      Colors.green, context),
                  itemDashboard('Candidate', CupertinoIcons.person,
                      Colors.deepOrange, context),
                  // itemDashboard('Audience', CupertinoIcons.person_2,
                  //     Colors.purple, context),
                  // itemDashboard('Comments', CupertinoIcons.chat_bubble_2,
                  //     Colors.brown, context),
                  // itemDashboard('Revenue', CupertinoIcons.money_dollar_circle,
                  //     Colors.indigo, context),
                  // itemDashboard('Upload', CupertinoIcons.add_circled,
                  //     Colors.teal, context),
                  itemDashboard('About', CupertinoIcons.question_circle,
                      Colors.blue, context),
                  itemDashboard('Contact', CupertinoIcons.phone,
                      Colors.pinkAccent, context),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }
}

itemDashboard(String title, IconData iconData, Color background,
        BuildContext context) =>
    Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 5),
                color: Theme.of(context).primaryColor.withOpacity(.2),
                spreadRadius: 2,
                blurRadius: 5)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: background,
                shape: BoxShape.circle,
              ),
              child: Icon(iconData, color: Colors.white)),
          const SizedBox(height: 8),
          Text(title.toUpperCase(),
              style: Theme.of(context).textTheme.titleMedium)
        ],
      ),
    );
