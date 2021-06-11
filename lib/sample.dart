import 'package:dostapp/caseDetails.dart';
import 'package:dostapp/cases.dart';
import 'package:dostapp/selectDonation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:connectivity/connectivity.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dots_indicator/dots_indicator.dart';

import 'main.dart';
//import 'package:aksc/akschome.dart';

class DashboardNavigator extends StatelessWidget {
  final pages = {
    "/": () => MaterialPageRoute(
        builder: (context) => Dashboards(nextRouteName: "CaseDetails",)
    ),
    "CaseDetails": () => MaterialPageRoute(
        builder: (context) => CaseDetails(title: "None",nextRouteName: "PageOne",)
    ),
  };

  @override
  Widget build(BuildContext context) => MaterialApp(
    onGenerateRoute: (route) {
      return pages[route.name]();
    },
  );
}
class Dashboards extends StatefulWidget {
  final String nextRouteName;

  Dashboards({this.nextRouteName});
@override
_DashboardsState createState() => _DashboardsState(nextRouteName: this.nextRouteName);
}

class _DashboardsState extends State<Dashboards> {
  final String nextRouteName;
  _DashboardsState({this.nextRouteName});
double pageIndex = 0;

activeStats(String activeText,String activeFigure){
  return Column(
    children: <Widget> [
      Text(
        activeText.toUpperCase(),
        style: TextStyle(
            color: Colors.purple,
            fontSize: 15,
            fontWeight: FontWeight.bold
        ),
      ),
      Text(
        activeFigure,
        style: TextStyle(
            color: Colors.purple,
            fontSize: 26,
            fontWeight: FontWeight.bold
        ),
      )
    ],
  );
}
eventCard(int eventNumber,int daysLeft,String eventImage,String eventName,List statFigure){
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)
      ),
      child: Column(
        children: <Widget> [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget> [
              Text(
                "EVENT: "+eventNumber.toString(),
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 11,
                    fontWeight: FontWeight.bold
                ),
              ),
              Text(
                daysLeft.toString()+" days left",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 11,
                    fontWeight: FontWeight.bold
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget> [
              Container(
                child: Image.asset("assets/"+eventImage),
                width: 110,
                height: 110,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0,right: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget> [
                    Text(
                      eventName,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Row(
                      children: <Widget> [
                        eventStats(statFigure[0].toString(),"Donors"),
                        eventStats(statFigure[1].toString(),"Raised"),
                        eventStats(statFigure[2].toString(),"Goal"),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    ),
  );
}
eventStats(statFigure,statTitle){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: <Widget> [
        Text(
          statFigure,
          style: TextStyle(
              color: Colors.deepPurpleAccent,
              fontSize: 26,
              fontWeight: FontWeight.bold
          ),
        ),
        Text(
          statTitle.toUpperCase(),
          style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.bold
          ),
        )
      ],
    ),
  );
}
middleRow(icon,iconText,donationType){
  return Column(
    children: <Widget> [
      Container(
        width: 40,
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(
                color: Colors.pink,
            ),
            borderRadius: BorderRadius.circular(10)
          ),
          child: IconButton(
            icon: Icon(icon),
              color: Colors.purple,
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectDonation(donationType:donationType)));
            },
          )
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          iconText,
          style: TextStyle(
              fontSize: 10,
              color: Colors.black
          ),
        ),
      )
    ],
  );
}
myCaseItems(String imageName, String caseId, String caseDesc, int amountRaised, int totalAmount,nextRouteName) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
    child: InkWell(
      onTap:()=> Navigator.of(context).pushNamed(nextRouteName),
      child: Container(
          height: 100,
          child: Material(
            color: Colors.white,
            elevation: 14.0,
            shadowColor: Colors.black,
            borderRadius: BorderRadius.circular(12),
            child: Container(
              height: 100,
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 80,
                      width: 80,
                      child: Image.asset(imageName),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top:12.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 0.0 ,bottom: 6.0),
                                child: Text(
                                  "CASE ID: "+ caseId,
                                  style: TextStyle(color: Colors.purple, fontSize: 15,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 0.0),
                                child: Text(
                                  caseDesc,
                                  style: TextStyle(color: Colors.black,fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              "RS. "+amountRaised.toString(),
                              style: TextStyle(color: Colors.black,fontSize: 11,fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "  donations raised from Rs. "+totalAmount.toString()+".",
                              style: TextStyle(color: Colors.grey,fontSize: 10),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      height: 82,
                      width: 8,
                      child: Icon(Icons.star,color: Colors.yellow),
                    )
                  ],
                ),
              ),
            ),
          )),
    ),
  );
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    // appBar: AppBar(title: Text("Dashboard", style: TextStyle(fontSize: 20))),
    // bottomNavigationBar: BottomNavigationBar(items: [
    //   BottomNavigationBarItem(
    //       icon: Icon(Icons.home),
    //       label: "Home",
    //       backgroundColor: Colors.blue),
    //   BottomNavigationBarItem(
    //       icon: Icon(Icons.perm_contact_calendar),
    //       label: "Contact Us",
    //       backgroundColor: Colors.redAccent),
    //   BottomNavigationBarItem(
    //       icon: Icon(Icons.assignment_returned),
    //       label: "Sign Out",
    //       backgroundColor: Colors.redAccent)
    // ]),
    body: SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.png"),
            fit: BoxFit.fitWidth,
            alignment: AlignmentDirectional.topStart
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20,right: 20, top: 60,bottom: 10),//temporarily top = 60. Original top = 40
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget> [
                  activeStats("Active Donations", "RS. 50,000.00"),
                  Container(
                    height: 60,
                    width: 1,
                    color: Colors.purple,
                  ),
                  activeStats("Active Cases", "07"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, right: 20.0,left: 20.0, bottom: 12.0),
              child: Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.pink
                    ),
                    borderRadius: BorderRadius.circular(15)
                ),
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  controller: PageController(viewportFraction: 1),
                  pageSnapping: true,
                  onPageChanged: (double) {
                    setState(() {
                      pageIndex = double.toDouble();
                    });
                  },
                  children: <Widget>[
                    eventCard(04, 11, "donate.png", "Ramadan Ration", [07,11,100]),
                    eventCard(05, 30, "donate.png", "Iftar Drive", [07,11,100]),
                    eventCard(06, 180, "donate.png", "Winter Drive", [07,11,100])
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: DotsIndicator(
                dotsCount: 3,
                position: pageIndex,
                decorator:
                DotsDecorator(
                    spacing: EdgeInsets.all(2),
                    size: Size(15, 2),
                    activeSize: Size(15,2),
                    color: Colors.pink.shade300,
                    activeColor: Colors.pink.shade600,
                    shape: const Border(),
                    activeShape: const Border()
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget> [
                  middleRow(Icons.event_note,"Add Cases Donation","Cases Donation"),
                  middleRow(Icons.account_circle,"Add Member Donation","Members Donation"),
                  middleRow(Icons.calendar_today_outlined,"Add Events Donation","Events Donation"),
                ]
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Container(
                height: 1,
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Text(
                  "Active Cases",
                style:TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )
              )
            ),
            myCaseItems("assets/dostlogo.png", "0205-20k", "Sole earner, daughter is sick. In hospital, need...", 3000, 60000,nextRouteName),
            myCaseItems("assets/dostlogo.png", "2904-50k", "Lost job due to COVID, need to pay 3 months r...", 24000, 75000,nextRouteName),
            myCaseItems("assets/dostlogo.png", "0105-50k", "Sole earner, daughter is sick. In hospital, need...", 12000, 20000,nextRouteName),
          ],
        ),
      ),
    ),
    /* */
  );
}
}
