import 'package:dostapp/viewSingleTransaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewAllTransactions extends StatefulWidget {
  @override
  _ViewAllTransactionsState createState() => _ViewAllTransactionsState();
}

class _ViewAllTransactionsState extends State<ViewAllTransactions> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  static bool _checkVisible=false;
  static int _checkCount=0;
  static final AppBar _defaultBar = AppBar(
    title: Text("View All Transactions"),
    leading: IconButton(
      icon: Icon(Icons.arrow_back,color: Colors.white,),
      //onPressed: () => ,  // And this!
    ),
    //actions: <Widget>[Icon(Icons.search), Icon(Icons.more_vert)],
    backgroundColor: Colors.pinkAccent,
  );

  static final AppBar _selectBar = AppBar(
    title: Text(_checkCount.toString()),
    leading: Icon(Icons.close),
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.only(right: 15.0),
        child: Icon(Icons.edit),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 15.0),
        child: Icon(Icons.share),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 15.0),
        child: Icon(Icons.delete),
      )
    ],
    backgroundColor: Colors.deepPurple,
  );

  functions(){
    setState(() {
      _checkVisible = !_checkVisible;
      _appBar = _appBar == _defaultBar
          ? _selectBar
          : _defaultBar;
    });
  }
  AppBar _appBar = _defaultBar;
  allTransactionItems(String tDate, String tDesc, String beneficiaryName, String tAmount) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
        child: Container(
            height: 120,
            child: Material(
              color: Colors.white,
              elevation: 14.0,
              shadowColor: Colors.black,
              borderRadius: BorderRadius.circular(12),
              child: InkWell(
                onLongPress: (){
                  setState(() {
                    _checkVisible = !_checkVisible;
                    _appBar = _appBar == _defaultBar
                        ? _selectBar
                        : _defaultBar;
                  });
                },
                child: Container(
                  height: 120,
                    padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Visibility(
                          visible: _checkVisible,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Container(
                              height: 30,
                              width: 30,
                              child: Icon(Icons.check_circle,color: Colors.purple,size: 30),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                tDate,
                                style: TextStyle(color: Colors.grey, fontSize: 12,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 15.0),
                                child: Text(
                                  tDesc,
                                  style: TextStyle(color: Colors.black,fontSize: 16),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Text(
                                  beneficiaryName,
                                  style: TextStyle(color: Colors.grey, fontSize: 16,fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Rs. "+ tAmount,
                              style: TextStyle(color: Colors.purple, fontSize: 14,fontWeight: FontWeight.bold),
                            ),
                            ElevatedButton(
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewSingleTransaction()),);
                              },
                              child: Container(
                                width: 30,
                                child: Center(
                                  child: Text(
                                    "VIEW",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(88,30),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0)
                                ),
                                primary: Colors.purple,
                                onPrimary: Colors.pink,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                ),
              ),
            )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                "CASE ID: 0205-20K",
                style: TextStyle(color: Colors.grey,fontSize: 18,fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
              ),
            ),
            allTransactionItems("10-May-2021", "Money Transfer - Easypaisa", "Muhammad Sameer Amir Khan Chishti ", "6,000.00"),
            allTransactionItems("15-May-2021", "Money Transfer - Bank Account", "Hayder Alam Chand Nawab Shaheed", "7,500.00"),
            allTransactionItems("22-May-2021", "Money Transfer - JazzCash", "Arsalan Fakhar E Alam Ghafoor", "2,000.00"),
            allTransactionItems("10-May-2021", "Money Transfer - Easypaisa", "Muhammad Sameer Amir Khan Chishti ", "6,000.00"),
            allTransactionItems("15-May-2021", "Money Transfer - Bank Account", "Hayder Alam Chand Nawab Shaheed", "7,500.00"),
            allTransactionItems("22-May-2021", "Money Transfer - JazzCash", "Arsalan Fakhar E Alam Ghafoor", "2,000.00"),
            allTransactionItems("10-May-2021", "Money Transfer - Easypaisa", "Muhammad Sameer Amir Khan Chishti ", "6,000.00"),
            allTransactionItems("15-May-2021", "Money Transfer - Bank Account", "Hayder Alam Chand Nawab Shaheed", "7,500.00"),
            allTransactionItems("22-May-2021", "Money Transfer - JazzCash", "Arsalan Fakhar E Alam Ghafoor", "2,000.00"),
          ],
        ),
      ),
    );
  }
}
