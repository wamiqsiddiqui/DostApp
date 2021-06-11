import 'dart:math';

import 'package:dostapp/caseDetails.dart';
import 'package:flutter/material.dart';

class CasesNavigator extends StatelessWidget {
  final pages = {
    "/": () => MaterialPageRoute(
        builder: (context) => Cases(nextRouteName: "CaseDetails",)
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


class Cases extends StatefulWidget {
  final String nextRouteName;

  Cases({this.nextRouteName});
  @override
  _CasesState createState() => _CasesState(nextRouteName: this.nextRouteName);
}

class _CasesState extends State<Cases> {
  final String nextRouteName;
  _CasesState({this.nextRouteName});
  myCaseItems(String imageName, String caseId, String caseDesc, int amountRaised, int totalAmount) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
      child: InkWell(
        onTap: /*onCaseClick*/(){
          Navigator.of(context).pushNamed(nextRouteName);
          //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => CaseDetails()));
        },
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
      appBar: AppBar(
        title: Text(
          "Case"
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget> [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              child: Row(
                children: <Widget> [
                  Container(
                    width: MediaQuery.of(context).size.width/1.5,
                    child: TextField(
                      decoration: InputDecoration(
                        isDense: true,
                        suffixIcon: Icon(Icons.search),
                        labelText: "Search",
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                        hintText: "Search",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width/5,
                    child: Image.asset("assets/dostlogo.png"),
                  )
                ],
              ),
            ),
            myCaseItems("assets/dostlogo.png", "0205-20k", "Sole earner, daughter is sick. In hospital, need...", 3000, 60000),
            myCaseItems("assets/dostlogo.png", "2904-50k", "Lost job due to COVID, need to pay 3 months r...", 24000, 75000),
            myCaseItems("assets/dostlogo.png", "0105-50k", "Sole earner, daughter is sick. In hospital, need...", 12000, 20000),
            myCaseItems("assets/dostlogo.png", "0205-20k", "Sole earner, daughter is sick. In hospital, need...", 3000, 60000),
            myCaseItems("assets/dostlogo.png", "2904-50k", "Lost job due to COVID, need to pay 3 months r...", 24000, 75000),
            myCaseItems("assets/dostlogo.png", "0105-50k", "Sole earner, daughter is sick. In hospital, need...", 12000, 20000),
            myCaseItems("assets/dostlogo.png", "0205-20k", "Sole earner, daughter is sick. In hospital, need...", 3000, 60000),
            myCaseItems("assets/dostlogo.png", "2904-50k", "Lost job due to COVID, need to pay 3 months r...", 24000, 75000),
            myCaseItems("assets/dostlogo.png", "0105-50k", "Sole earner, daughter is sick. In hospital, need...", 12000, 20000),
            myCaseItems("assets/dostlogo.png", "0205-20k", "Sole earner, daughter is sick. In hospital, need...", 3000, 60000),
            myCaseItems("assets/dostlogo.png", "2904-50k", "Lost job due to COVID, need to pay 3 months r...", 24000, 75000),
            myCaseItems("assets/dostlogo.png", "0105-50k", "Sole earner, daughter is sick. In hospital, need...", 12000, 20000),
          ],
        ),
      ),
    );
  }
}
