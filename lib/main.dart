import 'package:flutter/material.dart';
import 'package:intl/date_time_patterns.dart';
import 'package:intl/intl.dart';
import 'package:my_expence/model/Transaction.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context){
  return MaterialApp(
      home:MyExpenceHomePage(),
      );
  }

}

class MyExpenceHomePage extends StatefulWidget {
  const MyExpenceHomePage({super.key});

  @override
  State<MyExpenceHomePage> createState() => _MyExpenceHomePageState();
}

class _MyExpenceHomePageState extends State<MyExpenceHomePage> {
  List<Transaction> transaction=[
    Transaction(id: 's1',
        title: 'Goa trip',
        amount: 25000,
        dateTime: DateTime.now()
    ),




    Transaction(id: 's2',
        title: 'ladakha trip',
        amount: 50000,
        dateTime: DateTime.now()
    )
  ];
  final titleController=TextEditingController();
  final amountController=TextEditingController();
  final _formkey=GlobalKey<FormState>();

void _appendTransaction(String title,double amount) {
  {var temp_transaction= Transaction(
      id: 's3',
      title: title,
      amount: amount,
      dateTime: DateTime.now());


    setState(() {
      transaction.add(temp_transaction);

    });
    titleController.clear();
    amountController.clear();
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Column(
        children: [
          Card(
            child:Form(
            key: _formkey,
              child:Column(
                children: [
                TextFormField(
                  validator: (value){
                    if(value!.isEmpty){
                      return "value can' be empty";

                    }else{
                      return null;
                    }
                },
                  controller:titleController,
                    decoration:InputDecoration(
                    hintText: 'Title'
                 ),
              ),
                  TextFormField(
                  validator: (value){
                      if(value!.isEmpty){
                          return "value can' be empty";

                }else{
                     return null;
                }
    },


                    controller:amountController,
                    decoration:InputDecoration(
                    hintText: 'AMOUNT'
                ) ,

                    keyboardType: TextInputType.number,
              ),

                 ElevatedButton(
                     onPressed: () {
                       if (_formkey.currentState!.validate()) {
                         _appendTransaction(
                             titleController.text,
                             double.parse(amountController.text)
                         );
                       }

                     },
                    child: Text('submit')
          )
        ],
              ),
    )),

          Expanded(
          child:ListView.builder(
            itemCount: transaction.length,
              itemBuilder: (BuildContext context,int index){
                return ListTile(
                  title: Text('${transaction[index].title}'),
                    leading:Text('${transaction[index].id}'),
                   subtitle:Text(DateFormat.yMMMMd().format(transaction[index].dateTime)),
                    trailing:Text('${transaction[index].amount}'),
                );



              }
          ),

          ),


        ],

          ),
      ),
    );
  }
}


