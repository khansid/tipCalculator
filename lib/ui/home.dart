import 'package:flutter/material.dart';

class BillSplitter extends StatefulWidget {
  const BillSplitter({Key? key}) : super(key: key);

  @override
  State<BillSplitter> createState() => _BillSplitterState();
}

class _BillSplitterState extends State<BillSplitter> {
  int tipPercentage = 0;
  int personCounter = 1;
  double billAmount = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        alignment: Alignment.center,
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(20.5),
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    Text(
                      'Total Per Person',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 15.0,
                        color: Colors.purple,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        '\$ ${calculateTotalPerPerson(billAmount, personCounter, tipPercentage)}',
                        style: TextStyle(
                          fontSize: 34.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: Colors.blueGrey.shade100,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(12.0)),
              child: Column(
                children: [
                  TextField(
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      style: const TextStyle(color: Colors.grey),
                      decoration: const InputDecoration(
                          prefixText: "Bill Amount",
                          prefixIcon: Icon(Icons.attach_money)),
                      onChanged: (String value) {
                        try {
                          billAmount = double.parse(value);
                        } catch (exception) {
                          billAmount = 0.0;
                        }
                      }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text(
                          'Split',
                          style: TextStyle(
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (personCounter > 1) {
                                  personCounter--;
                                }
                              });
                            },
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              margin: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.0),
                                color: Colors.purpleAccent.withOpacity(0.1),
                              ),
                              child: const Center(
                                child: Text(
                                  '-',
                                  style: TextStyle(
                                    color: Colors.purple,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            '$personCounter',
                            style: const TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                personCounter++;
                              });
                            },
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              margin: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: Colors.purple.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(7.0),
                              ),
                              child: const Center(
                                child: Text(
                                  '+',
                                  style: TextStyle(
                                    color: Colors.purple,
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          //Tip
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text(
                          'Tip',
                          style: TextStyle(
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                       Text(
                        "\$ ${calculateTotalTip(billAmount, personCounter,tipPercentage)}",
                        style: const TextStyle(
                          color: Colors.purple,
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                        ),
                      )
                    ],
                  ),
                  //Slider
                  Column(
                    children: [
                      Text(
                        '$tipPercentage%',
                        style: const TextStyle(
                          color: Colors.purple,
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      //Slider
                      Slider(
                          min: 0,
                          max: 100,
                          activeColor: Colors.purple,
                          inactiveColor: Colors.grey,
                          divisions: 5,
                          value: tipPercentage.toDouble(),
                          onChanged: (double newValue) {
                            setState(() {
                              tipPercentage = newValue.round();
                            });
                          })
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  calculateTotalPerPerson(double billAmount, int splitBy, int tipPercentage){
    var totalPerPerson = (calculateTotalPerPerson(billAmount, splitBy, tipPercentage) + billAmount) / splitBy;
    return totalPerPerson;

  }
  calculateTotalTip(double billAmount, int splitBy, int tipPercentage){
    double totalTip = 0.0;
    if(billAmount <0 || billAmount.toString().isEmpty || billAmount == null){

    }else{
      totalTip = (billAmount * tipPercentage) / 100;
    }
    return totalTip;

  }
}

// class Wisdom extends StatefulWidget {
//   const Wisdom({Key? key}) : super(key: key);
//
//   @override
//   State<Wisdom> createState() => _WisdomState();
// }
//
// class _WisdomState extends State<Wisdom> {
//   var _index = 0;
//   List quotes = [
//   "Mobile is becoming not only the new digital hub but also the bridge to the physical world. That’s why mobile will affect more than just your digital operations — it will transform your entire business", "You should always put your best team and your best app on your mobile app.""The future of mobile is the future of online. It is how people access online content now. — David Murphy, Founder and Editor of Mobile Marketing Daily",
//   "Cloud computing is growing, especially as we are all used to having our mobile devices link us to data wherever we are.",
//   "I think the biggest change, and the one we’re already starting to see take shape, is that globally the majority of internet usage will be done via a mobile device and for most people the mobile web will be their primary – if not their only – way of experiencing the internet."
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children:  [
//             Text(quotes[_index % quotes.length]),
//             FilledButton(onPressed: _showQuote, child: const Text('Inspire me')
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _showQuote() {
//     setState(() {
//       _index +=1;
//
//     });
//   }
// }

// class BizCard extends StatelessWidget {
//   const BizCard({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Center(child: Text('BizCard')),
//       ),
//       body: Container(
//         alignment: Alignment.center,
//         child: Stack(
//           alignment: Alignment.topCenter,
//           children: [
//             Container_getCard(),
//             Container_getAvatar()
//           ],
//         ),
//       ),
//     );
//   }
//
//   Container_getCard() {
//     return Container(
//       width: 350,
//       height: 200,
//       margin: const EdgeInsets.all(50.0),
//       decoration: BoxDecoration(
//         color: Colors.pinkAccent,
//         borderRadius: BorderRadius.circular(14.4),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const Text('Paulo Dichone',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),),
//           const Text('frankdi.com'),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: const [
//               Icon(Icons.person_outline),
//               Text('T: @buildappswithme')
//             ],
//           )
//         ],
//       ),
//     );
//   }
//
//   Container_getAvatar() {
//     return Container(
//       width: 100,
//       height: 100,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: const BorderRadius.all(Radius.circular(50.0)),
//         border: Border.all(color: Colors.redAccent,width: 1.2),
//         image: const DecorationImage(image: NetworkImage('https://picsum.photos/300/300'),
//         fit: BoxFit.cover
//         )
//       ),
//     );
//   }
// }

// class ScaffoldExample extends StatelessWidget {
//   const ScaffoldExample({Key? key}) : super(key: key);
//
//   _tapButton(){
// debugPrint("Tapped");}
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Scaffold"),
//         centerTitle: true,
//         backgroundColor: Colors.amberAccent.shade700,
//         actions:  [
//           IconButton(onPressed:_tapButton, icon: const Icon(Icons.email)),
//           IconButton(onPressed: _tapButton, icon: const Icon(Icons.access_alarm),)
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(onPressed:null,
//       backgroundColor: Colors.lightGreenAccent,
//         child: Icon(Icons.plus_one),
//       ),
//       bottomNavigationBar: BottomNavigationBar(items: const [
//             BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'first'),
//             BottomNavigationBarItem(icon: Icon(Icons.message),label: 'second'),
//             BottomNavigationBarItem(icon: Icon(Icons.notification_add),label: 'third')
//
//       ]),
//       backgroundColor: Colors.redAccent.shade100,
//       body: Container(
//         alignment: Alignment.center,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children:  const [
//             CustomButton()
//             // InkWell(
//             //   child: const Text("Tap Me!",
//             //       style: TextStyle(fontSize: 23.4),
//             //   ),
//             //   onTap: () => debugPrint("Taped.."),
//             //
//             // )
//           ]
//
//         ),
//       ),
//     );
//   }
// }
// class CustomButton extends StatelessWidget {
//   const CustomButton({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: (){
//         const snackBar = SnackBar(content: Text("Hello Again"),
//         backgroundColor: Colors.amberAccent,
//         );
//         ScaffoldMessenger.of(context).showSnackBar(snackBar);
//         },
//       child: Container(
//         padding: const EdgeInsets.all(10.0),
//         decoration: const BoxDecoration(
//           color: Colors.pinkAccent,
//         ),
//         child: const Text("Button"),
//       ),
//     );
//   }
//
// }
//
//
// class Home extends StatelessWidget {
//   const Home({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const Material(
//       color: Colors.deepOrange,
//       textStyle: TextStyle(
//         fontWeight: FontWeight.w500,
//         fontSize: 24.4,
//         fontStyle: FontStyle.italic,
//       ),
//       child: Center(
//           child: Text("Hello flutter!", textDirection: TextDirection.ltr,)),
//     );
//   }
// }
