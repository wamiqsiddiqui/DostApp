import 'package:dostapp/viewAllTransactions.dart';
import 'package:flutter/material.dart';

class CaseDetails extends StatefulWidget {
  final String title;
  final String nextRouteName;

  CaseDetails({this.title, this.nextRouteName});
  @override
  _CaseDetailsState createState() => _CaseDetailsState();
}

class _CaseDetailsState extends State<CaseDetails> {
  final String title;
  final String nextRouteName;
  _CaseDetailsState({this.title, this.nextRouteName});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cases"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget> [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget> [
                  Text(
                    "CASE ID: 0205-20K",
                    style: TextStyle(color: Colors.grey,fontSize: 15),
                  ),
                  Text(
                    "11 days left",
                    style: TextStyle(color: Colors.grey,fontSize: 15),
                  ),
                ]
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 12.0),
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          child: Image.asset("assets/donate.png"),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Rs. 20,000",
                              style: TextStyle(
                                  color: Colors.purple,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25
                              )
                            ),
                            Column(
                              children: [
                                Text(
                                    "Raised so far",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18
                                    )
                                ),
                                Text(
                                    "Rs. 20,000",
                                    style: TextStyle(
                                        color: Colors.purple,
                                        fontSize: 22
                                    )
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ),
            ),
            Text(
              "Medical Case",
                style: TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                    fontSize: 22
                )
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                  "Sole earner, daughter is sick. In hospital need money to buy medicines and pay hospital debt.",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18
                  ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 1,
                color: Colors.grey,
              ),
            ),
            Text(
                "Event Detail",
                style: TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                    fontSize: 22
                )
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 28.0),
                    child: Text(
                        "Accounts for donations:",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15
                        )
                    ),
                  ),
                  Flexible(
                    child: Text(
                        "- Muhammad Sameer Amir Khan\n- Ayesha Saeed\n- Arsalan Fakhar",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15
                        )
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Text(
                        "Campaign Representative:",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15
                        )
                    ),
                  ),
                  Flexible(
                    child: Text(
                        "- Muhammad Wamiq",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15
                        )
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: ElevatedButton(
                  onPressed: (){

                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "ADD TRANSACTION",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white
                          ),
                        ),
                      ),
                    ),
                  ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  primary: Colors.purple,
                  onPrimary: Colors.pink,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0.0),
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewAllTransactions()),);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "VIEW TRANSACTION",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.purple
                        ),
                      ),
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  side: BorderSide(color: Colors.purple),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                  ),
                  primary: Colors.white,
                  onPrimary: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
