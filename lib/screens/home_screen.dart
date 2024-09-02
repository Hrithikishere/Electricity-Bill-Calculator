import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _unitsController = TextEditingController();

  final TextEditingController _rangeOneController = TextEditingController();
  final TextEditingController _rangeTwoController = TextEditingController();
  final TextEditingController _rangeThreeController = TextEditingController();
  final TextEditingController _rangeFourController = TextEditingController();
  final TextEditingController _rangeFiveController = TextEditingController();
  final TextEditingController _rangeSixController = TextEditingController();

  final TextEditingController _rateOneController = TextEditingController();
  final TextEditingController _rateTwoController = TextEditingController();
  final TextEditingController _rateThreeController = TextEditingController();
  final TextEditingController _rateFourController = TextEditingController();
  final TextEditingController _rateFiveController = TextEditingController();
  final TextEditingController _rateSixController = TextEditingController();

  final TextEditingController _costOneController = TextEditingController();
  final TextEditingController _costTwoController = TextEditingController();
  final TextEditingController _costThreeController = TextEditingController();
  final TextEditingController _costFourController = TextEditingController();
  final TextEditingController _costFiveController = TextEditingController();
  final TextEditingController _costSixController = TextEditingController();

  final TextEditingController _totalController = TextEditingController();
  final TextEditingController _taxController = TextEditingController();
  final TextEditingController _demandCountController = TextEditingController();
  final TextEditingController _demandAmountController = TextEditingController();

  FocusNode unitFocusNode = FocusNode();

  FocusNode rateOneFocusNode = FocusNode();
  FocusNode rateTwoFocusNode = FocusNode();
  FocusNode rateThreeFocusNode = FocusNode();
  FocusNode rateFourFocusNode = FocusNode();
  FocusNode rateFiveFocusNode = FocusNode();
  FocusNode rateSixFocusNode = FocusNode();

  FocusNode taxFocusNode = FocusNode();
  FocusNode demandCountFocusNode = FocusNode();
  FocusNode demandAmountFocusNode = FocusNode();

  @override
  void dispose() {
    unitFocusNode.dispose();
    rateOneFocusNode.dispose();
    rateTwoFocusNode.dispose();
    rateThreeFocusNode.dispose();
    rateFourFocusNode.dispose();
    rateFiveFocusNode.dispose();
    rateSixFocusNode.dispose();
    taxFocusNode.dispose();
    demandCountFocusNode.dispose();
    demandAmountFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //heading
              const Heading(),
              //form
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    //total units consumed
                    const Text(
                      'Total Units Consumed',
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      focusNode: unitFocusNode,
                      autofocus: true,
                      controller: _unitsController,
                      keyboardType: TextInputType.number,
                      decoration:
                          const InputDecoration(hintText: 'Total Units'),
                      onSubmitted: (main) => setState(() {
                        // 0 - 75
                        // 75 - 200
                        // 200 - 300
                        // 300 - 400
                        // 400 - 600
                        int value = int.parse(main.isEmpty ? '0' : main);
                        if (value <= 75) {
                          _rangeOneController.text = '$value';
                          _rangeTwoController.text = '00';
                          _rangeThreeController.text = '00';
                          _rangeFourController.text = '00';
                          _rangeFiveController.text = '00';
                        } else if (value > 75 && value <= 200) {
                          _rangeOneController.text = '75';
                          _rangeTwoController.text = '${value - 75}';
                          _rangeThreeController.text = '00';
                          _rangeFourController.text = '00';
                          _rangeFiveController.text = '00';
                        } else if (value > 200 && value <= 300) {
                          _rangeOneController.text = '75';
                          _rangeTwoController.text = '125';
                          _rangeThreeController.text = '${value - 200}';
                          _rangeFourController.text = '00';
                          _rangeFiveController.text = '00';
                        } else if (value > 300 && value <= 400) {
                          _rangeOneController.text = '75';
                          _rangeTwoController.text = '125';
                          _rangeThreeController.text = '100';
                          _rangeFourController.text = '${value - 300}';
                          _rangeFiveController.text = '00';
                        } else if (value > 400 && value <= 600) {
                          _rangeOneController.text = '75';
                          _rangeTwoController.text = '125';
                          _rangeThreeController.text = '100';
                          _rangeFourController.text = '100';
                          _rangeFiveController.text = '${value - 400}';
                        } else {
                          _rangeOneController.text = '75';
                          _rangeTwoController.text = '125';
                          _rangeThreeController.text = '100';
                          _rangeFourController.text = '100';
                          _rangeFiveController.text = '200';
                          _rangeSixController.text = '${value - 600}';
                        }
                        rateOneFocusNode.requestFocus();
                      }),
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Range per Rate',
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 10),
                    // per unit cost
                    // for 0 - 75
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //range
                        SizedBox(
                          width: 60,
                          child: TextField(
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 14),
                            decoration: const InputDecoration(hintText: '00'),
                            controller: _rangeOneController,
                            keyboardType: TextInputType.number,
                            readOnly: true,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text('X'),
                        const SizedBox(height: 20),
                        // rate
                        SizedBox(
                          width: 80,
                          child: TextField(
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 14),
                            decoration: const InputDecoration(hintText: 'Rate'),
                            controller: _rateOneController,
                            keyboardType: TextInputType.number,
                            onSubmitted: (value) {
                              double cost =
                                  double.parse(value.isEmpty ? '0' : value) *
                                      double.parse(
                                          _rangeOneController.text.isEmpty
                                              ? '0'
                                              : _rangeOneController.text);
                              setState(() {
                                _costOneController.text = cost.toString();
                                // print(_costOneController.text);
                              });
                              rateTwoFocusNode.requestFocus();
                            },
                            focusNode: rateOneFocusNode,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text('='),
                        const SizedBox(height: 20),
                        // cost
                        SizedBox(
                          width: 150,
                          child: TextField(
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 14),
                            decoration: const InputDecoration(hintText: 'Cost'),
                            controller: _costOneController,
                            keyboardType: TextInputType.number,
                            readOnly: true,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // for 75 - 200 -> 125
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //range
                        SizedBox(
                          width: 60,
                          child: TextField(
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 14),
                            decoration: const InputDecoration(hintText: '00'),
                            controller: _rangeTwoController,
                            keyboardType: TextInputType.number,
                            readOnly: true,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text('X'),
                        const SizedBox(height: 20),
                        // rate
                        SizedBox(
                          width: 80,
                          child: TextField(
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 14),
                            focusNode: rateTwoFocusNode,
                            decoration: const InputDecoration(hintText: 'Rate'),
                            controller: _rateTwoController,
                            keyboardType: TextInputType.number,
                            onSubmitted: (value) {
                              double cost =
                                  double.parse(value.isEmpty ? '0' : value) *
                                      double.parse(
                                          _rangeTwoController.text.isEmpty
                                              ? '0'
                                              : _rangeTwoController.text);
                              setState(() {
                                _costTwoController.text = cost.toString();
                              });
                              rateThreeFocusNode.requestFocus();
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text('='),
                        const SizedBox(height: 20),
                        // cost
                        SizedBox(
                          width: 150,
                          child: TextField(
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 14),
                            decoration: const InputDecoration(hintText: 'Cost'),
                            controller: _costTwoController,
                            keyboardType: TextInputType.number,
                            readOnly: true,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // for 200 - 300 -> 100
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //range
                        SizedBox(
                          width: 60,
                          child: TextField(
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 14),
                            decoration: const InputDecoration(hintText: '00'),
                            controller: _rangeThreeController,
                            keyboardType: TextInputType.number,
                            readOnly: true,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text('X'),
                        const SizedBox(height: 20),
                        // rate
                        SizedBox(
                          width: 80,
                          child: TextField(
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 14),
                            focusNode: rateThreeFocusNode,
                            decoration: const InputDecoration(hintText: 'Rate'),
                            controller: _rateThreeController,
                            keyboardType: TextInputType.number,
                            onSubmitted: (value) {
                              double cost =
                                  double.parse(value.isEmpty ? '0' : value) *
                                      double.parse(
                                          _rangeThreeController.text.isEmpty
                                              ? '0'
                                              : _rangeThreeController.text);
                              setState(() {
                                _costThreeController.text = cost.toString();
                              });
                              rateFourFocusNode.requestFocus();
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text('='),
                        const SizedBox(height: 20),
                        // cost
                        SizedBox(
                          width: 150,
                          child: TextField(
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 14),
                            decoration: const InputDecoration(hintText: 'Cost'),
                            controller: _costThreeController,
                            keyboardType: TextInputType.number,
                            readOnly: true,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // for 300 - 400 -> 100
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //range
                        SizedBox(
                          width: 60,
                          child: TextField(
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 14),
                            decoration: const InputDecoration(hintText: '00'),
                            controller: _rangeFourController,
                            keyboardType: TextInputType.number,
                            readOnly: true,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text('X'),
                        const SizedBox(height: 20),
                        // rate
                        SizedBox(
                          width: 80,
                          child: TextField(
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 14),
                            focusNode: rateFourFocusNode,
                            decoration: const InputDecoration(hintText: 'Rate'),
                            controller: _rateFourController,
                            keyboardType: TextInputType.number,
                            onSubmitted: (value) {
                              double cost =
                                  double.parse(value.isEmpty ? '0' : value) *
                                      double.parse(
                                          _rangeFourController.text.isEmpty
                                              ? '0'
                                              : _rangeFourController.text);
                              setState(() {
                                _costFourController.text = cost.toString();
                              });
                              rateFiveFocusNode.requestFocus();
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text('='),
                        const SizedBox(height: 20),
                        // cost
                        SizedBox(
                          width: 150,
                          child: TextField(
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 14),
                            decoration: const InputDecoration(hintText: 'Cost'),
                            controller: _costFourController,
                            keyboardType: TextInputType.number,
                            readOnly: true,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // for 400 - 600 -> 200
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //range
                        SizedBox(
                          width: 60,
                          child: TextField(
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 14),
                            decoration: const InputDecoration(hintText: '00'),
                            controller: _rangeFiveController,
                            keyboardType: TextInputType.number,
                            readOnly: true,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text('X'),
                        const SizedBox(height: 20),
                        // rate
                        SizedBox(
                          width: 80,
                          child: TextField(
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 14),
                            focusNode: rateFiveFocusNode,
                            decoration: const InputDecoration(hintText: 'Rate'),
                            controller: _rateFiveController,
                            keyboardType: TextInputType.number,
                            onSubmitted: (value) {
                              double cost =
                                  double.parse(value.isEmpty ? '0' : value) *
                                      double.parse(
                                          _rangeFiveController.text.isEmpty
                                              ? '0'
                                              : _rangeFiveController.text);
                              setState(() {
                                _costFiveController.text = cost.toString();
                              });
                              rateSixFocusNode.requestFocus();
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text('='),
                        const SizedBox(height: 20),
                        // cost
                        SizedBox(
                          width: 150,
                          child: TextField(
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 14),
                            decoration: const InputDecoration(hintText: 'Cost'),
                            controller: _costFiveController,
                            keyboardType: TextInputType.number,
                            readOnly: true,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // for 600++
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //range
                        SizedBox(
                          width: 60,
                          child: TextField(
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 14),
                            decoration: const InputDecoration(hintText: '00'),
                            controller: _rangeSixController,
                            keyboardType: TextInputType.number,
                            readOnly: true,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text('X'),
                        const SizedBox(height: 20),
                        // rate
                        SizedBox(
                          width: 80,
                          child: TextField(
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 14),
                            focusNode: rateSixFocusNode,
                            decoration: const InputDecoration(hintText: 'Rate'),
                            controller: _rateSixController,
                            keyboardType: TextInputType.number,
                            onSubmitted: (value) {
                              double cost =
                                  double.parse(value.isEmpty ? '0' : value) *
                                      double.parse(
                                          _rangeSixController.text.isEmpty
                                              ? '0'
                                              : _rangeSixController.text);
                              setState(() {
                                _costSixController.text = cost.toString();
                              });
                              demandCountFocusNode.requestFocus();
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text('='),
                        const SizedBox(height: 20),
                        // cost
                        SizedBox(
                          width: 150,
                          child: TextField(
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 14),
                            decoration: const InputDecoration(hintText: 'Cost'),
                            controller: _costSixController,
                            keyboardType: TextInputType.number,
                            readOnly: true,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    //demand charge
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Demand Charge',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //deman quantity
                            SizedBox(
                              width: size * 0.30,
                              child: TextField(
                                focusNode: demandCountFocusNode,
                                style: const TextStyle(fontSize: 14),
                                decoration:
                                    const InputDecoration(hintText: 'Quantity'),
                                controller: _demandCountController,
                                keyboardType: TextInputType.number,
                                onSubmitted: (value) =>
                                    {demandAmountFocusNode.requestFocus()},
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text('X'),
                            const SizedBox(height: 20),
                            //deman amount
                            SizedBox(
                              width: size * 0.55,
                              child: TextField(
                                focusNode: demandAmountFocusNode,
                                style: const TextStyle(fontSize: 14),
                                decoration:
                                    const InputDecoration(hintText: 'Amount'),
                                controller: _demandAmountController,
                                keyboardType: TextInputType.number,
                                onSubmitted: (value) =>
                                    {taxFocusNode.requestFocus()},
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    //tax rate
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Tax Rate',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: size * 0.85,
                          child: TextField(
                            focusNode: taxFocusNode,
                            style: const TextStyle(fontSize: 14),
                            decoration:
                                const InputDecoration(hintText: 'Percentage'),
                            controller: _taxController,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),
                    //buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        //calculate button
                        Container(
                          constraints: BoxConstraints(
                              minHeight: 54,
                              maxHeight: 54,
                              maxWidth: size * 0.8),
                          height: 54,
                          width: size * 0.8,
                          child: ElevatedButton(
                            onPressed: () {
                              try {
                                // Parsing the values safely

                                //costs
                                double costOne = double.parse(
                                    _costOneController.text.isEmpty
                                        ? '0'
                                        : _costOneController.text);

                                double costTwo = double.parse(
                                    _costTwoController.text.isEmpty
                                        ? '0'
                                        : _costTwoController.text);

                                double costThree = double.parse(
                                    _costThreeController.text.isEmpty
                                        ? '0'
                                        : _costThreeController.text);

                                double costFour = double.parse(
                                    _costFourController.text.isEmpty
                                        ? '0'
                                        : _costFourController.text);

                                double costFive = double.parse(
                                    _costFiveController.text.isEmpty
                                        ? '0'
                                        : _costFiveController.text);

                                double costSix = double.parse(
                                    _costSixController.text.isEmpty
                                        ? '0'
                                        : _costSixController.text);

                                double total = (costOne +
                                    costTwo +
                                    costThree +
                                    costFour +
                                    costFive +
                                    costSix);

                                //demand count
                                double demandQuantity = double.parse(
                                    _demandCountController.text.isEmpty
                                        ? '0'
                                        : _demandCountController.text);

                                double demandAmount = double.parse(
                                    _demandAmountController.text.isEmpty
                                        ? '0'
                                        : _demandAmountController.text);

                                double totalDemandCharges =
                                    demandQuantity * demandAmount;

                                total = total + totalDemandCharges;

                                // Add VAT and demandAmount Charges
                                double tax = double.parse(
                                    _taxController.text.isEmpty
                                        ? '0'
                                        : _taxController.text);

                                total = total + (total * tax / 100);

                                _totalController.text = total.toString();
                              } catch (e) {
                                print("Error parsing costs: $e");
                              }

                              setState(() {});
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black87,
                              shape: const StadiumBorder(),
                              // maximumSize: Size(150.0, 25.0),
                            ),
                            child: const Text(
                              'Calculate',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        //clear button
                        IconButton.outlined(
                            onPressed: () {
                              _unitsController.clear();

                              _rangeOneController.clear();
                              _rangeTwoController.clear();
                              _rangeThreeController.clear();
                              _rangeFourController.clear();
                              _rangeFiveController.clear();
                              _rangeSixController.clear();

                              _rateOneController.clear();
                              _rateTwoController.clear();
                              _rateThreeController.clear();
                              _rateFourController.clear();
                              _rateFiveController.clear();
                              _rateSixController.clear();

                              _costOneController.clear();
                              _costTwoController.clear();
                              _costThreeController.clear();
                              _costFourController.clear();
                              _costFiveController.clear();
                              _costSixController.clear();

                              _taxController.clear();
                              _demandAmountController.clear();
                              _demandCountController.clear();
                              _totalController.clear();

                              setState(() {});
                            },
                            icon: const Icon(Icons.delete_forever_outlined))
                      ],
                    ),
                    const SizedBox(height: 30),

                    // total amount
                    const Text(
                      'Total Charge',
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      decoration: const InputDecoration(hintText: 'Total'),
                      controller: _totalController,
                      readOnly: true,
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Heading extends StatelessWidget {
  const Heading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Electricity Bill\nCalculator.',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Align(
              alignment: Alignment.topRight,
              child: SvgPicture.asset('lib/assets/svg/bulb.svg',
                  height: 70, width: 70)),
        ],
      ),
    );
  }
}
