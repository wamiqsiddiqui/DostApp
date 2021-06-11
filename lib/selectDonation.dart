import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SelectDonation extends StatefulWidget {
  String donationType;
  SelectDonation({@required this.donationType});
  @override
  _SelectDonationState createState() => _SelectDonationState(donationType);
}

class _SelectDonationState extends State<SelectDonation> {
  bool isMember,isCase,valueSelected=false;
  double listBoxWidth;
  List<String> list;
  String donationType;
  _SelectDonationState(this.donationType);
  String dropdownValue;
  setSelectedValue(){
    //String selectedValue;
    if(donationType=="Events Donation"){
      // selectedValue="Select Event";
      // isMember=false;
      // isCase=false;
      return ["Select Event",false,false];
    }else if(donationType=="Members Donation"){
      // selectedValue="Select Member";
      // isMember=true;
      // isCase=false;
      return ["Select Member",true,false];
    }else if(donationType=="Cases Donation"){
      // selectedValue="Select Case";
      // isMember=false;
      // isCase=true;
      return ["Select Case",false,true];
    }
    //return [selectedValue,isMember,isCase];
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("donationType="+donationType);
    String selectedValue=setSelectedValue()[0];
    isMember=setSelectedValue()[1];
    isCase=setSelectedValue()[2];
    // if(donationType=="Events Donation"){
    //   selectedValue="Select Event";
    //   isMember=false;
    //   isCase=false;
    // }else if(donationType=="Members Donation"){
    //   selectedValue="Select Member";
    //   isMember=true;
    //   isCase=false;
    // }else if(donationType=="Cases Donation"){
    //   selectedValue="Select Case";
    //   isMember=false;
    //   isCase=true;
    // }
    list = <String> [selectedValue, "Sameer","Mudabbir","Arsalan Fakhar", "Hayder", "Eshaa","Ayesha Saeed", "Wamiq","Mehrosh"];
    dropdownValue=list[0];
    print("dropdownValue="+dropdownValue);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add "+donationType
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: Container(
          height: MediaQuery.of(context).size.height-170,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      //margin: EdgeInsets.only(top: 0.0, right: 10.0, left: 10.0),
                      width: !isMember?MediaQuery.of(context).size.width*0.88: MediaQuery.of(context).size.width*0.72,//double.infinity,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1.0, style: BorderStyle.solid,color: Colors.purple),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: Container(
                          margin: EdgeInsets.only(
                              left: 10.0, right: 10.0),
                          child: DropdownButton<String>(
                            value: dropdownValue,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            iconSize: 24,
                            elevation: 16,
                            style: const TextStyle(color: Colors.deepPurple),
                            onChanged: (newValue) {
                              setState(() {
                                dropdownValue = newValue;//">=2.7.0 <3.0.0"
                                if(!newValue.contains("Select")){
                                  valueSelected=true;
                                }else{
                                  valueSelected=false;
                                }
                              });
                            },
                              items: list.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: isMember,
                      child: Padding(
                        padding: const EdgeInsets.only(left:5.0),
                        child: FloatingActionButton(
                          mini: true,
                            backgroundColor: Colors.purple,
                            child: Icon(Icons.add,color: Colors.white,),
                            tooltip: "Add new Member",
                            onPressed: (){
                            setState(() {
                              valueSelected=true;
                              dropdownValue= setSelectedValue()[0];
                            });
                              print("Icon Button="+isMember.toString());
                        }),
                      ),
                    )
                  ],
                ),
              ),
              Visibility(
                  visible: valueSelected && !isMember?true:false,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height/50,
                    child: FittedBox(
                      child: Text(
                          isCase?"CASE ID: 0205-20K":"Event: 05",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                          ),
                      ),
                    ),
                  ),
                )
              ),
              Visibility(
                  visible: valueSelected,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      // validator: (input) {
                      //   // if (input.contains("@")) {
                      //   //   return null;
                      //   // } else {
                      //   //   return "Invalid Email format";
                      //   // }
                      // },
                      //onSaved: (input) => _email = input,
                      //onChanged: (input) => _email = input.trim(),
                      decoration: InputDecoration(
                        //isDense: true,
                        // contentPadding: EdgeInsets.all(8),
                        labelText: isMember?"Member name":"Account holder name",
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                        hintText: "",
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
                  )
              ),
              Visibility(
                  visible: valueSelected,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      // validator: (input) {
                      //   // if (input.contains("@")) {
                      //   //   return null;
                      //   // } else {
                      //   //   return "Invalid Email format";
                      //   // }
                      // },
                      //onSaved: (input) => _email = input,
                      //onChanged: (input) => _email = input.trim(),
                      decoration: InputDecoration(
                        //isDense: true,
                        // contentPadding: EdgeInsets.all(8),
                        labelText: "Amount",
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                        hintText: "",
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
                  )
              ),
              Visibility(
                  visible: valueSelected && !isMember?true:false,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      // validator: (input) {
                      //   // if (input.contains("@")) {
                      //   //   return null;
                      //   // } else {
                      //   //   return "Invalid Email format";
                      //   // }
                      // },
                      //onSaved: (input) => _email = input,
                      //onChanged: (input) => _email = input.trim(),
                      decoration: InputDecoration(
                        //isDense: true,
                        // contentPadding: EdgeInsets.all(8),
                        labelText: "Receiver Name",
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                        hintText: "",
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
                  )
              ),
              Visibility(
                  visible: valueSelected,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      // validator: (input) {
                      //   // if (input.contains("@")) {
                      //   //   return null;
                      //   // } else {
                      //   //   return "Invalid Email format";
                      //   // }
                      // },
                      //onSaved: (input) => _email = input,
                      //onChanged: (input) => _email = input.trim(),
                      decoration: InputDecoration(
                        //isDense: true,
                        // contentPadding: EdgeInsets.all(8),
                        labelText: isMember?"Mobile Number":"Receiver Mobile Number",
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                        hintText: "",
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
                  )
              ),
              Visibility(
                  visible: valueSelected,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      // validator: (input) {
                      //   // if (input.contains("@")) {
                      //   //   return null;
                      //   // } else {
                      //   //   return "Invalid Email format";
                      //   // }
                      // },
                      //onSaved: (input) => _email = input,
                      //onChanged: (input) => _email = input.trim(),
                      decoration: InputDecoration(
                        //isDense: true,
                        // contentPadding: EdgeInsets.all(8),
                        labelText: "Transaction Date",
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                        hintText: "",
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
                  )
              ),
              Visibility(
                visible: valueSelected,
                child: ElevatedButton(
                  child: Container(
                      width: MediaQuery.of(context).size.width/1.25,
                      child: Stack(
                        children: <Widget>[
                          Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                          Center(
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height/40,
                              child: FittedBox(
                                child: Text(
                                  "CONFIRM DONATION",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    //fontSize: 20,
                                      color: Colors.white
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                      primary: Colors.purple,
                      onPrimary: Colors.pink,
                      minimumSize: Size(MediaQuery.of(context).size.width,50)
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectDonation(donationType: donationType)),);
                  },
                ),
              ),
              //Icon(Icons.keyboard_arrow_down)
            ],
          ),
        ),
      ),
    );
  }
}
