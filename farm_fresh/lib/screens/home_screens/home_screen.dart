import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //const HomeScreen({super.key});
  String _dropdownValue = '50g';

  var _items = [
    '50g',
    '100g',
    '250g',
    '500g',
  ];

  var num = 1.obs;

  void increment() {
    if (num.value >= 4) {
      Get.snackbar(
        "Order",
        "Cannot be more than 4",
        icon: Icon(Icons.stop_circle_rounded),
        barBlur: 20,
        isDismissible: true,
        duration: Duration(seconds: 3),
      );
    } else
      num.value++;
  }

  void decrement() {
    if (num.value <= 1) {
      Get.snackbar(
        "Order",
        "Cannot be less than 1",
        icon: Icon(Icons.stop_circle_rounded),
        barBlur: 20,
        isDismissible: true,
        duration: Duration(seconds: 3),
      );
    } else
      num.value--;
  }

  Widget singalProducts() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: 230,
      width: 160,
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Image.network(
                'https://5.imimg.com/data5/FA/EF/MY-58843567/organic-basil-500x500.jpg'),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Fresh Basil',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Rs.50/50 Gram',
                    style: TextStyle(
                      color: Colors.blueGrey,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          width: 60,
                          height: 30,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 217, 248, 188),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: DropdownButton(
                              items: _items.map((String item) {
                                return DropdownMenuItem(
                                    value: item, child: Text(item));
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  _dropdownValue = newValue!;
                                });
                              },
                              value: _dropdownValue,
                              underline: Container(),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Container(
                          width: 80,
                          height: 30,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 217, 248, 188),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: IconButton(
                                  icon: Icon(
                                    Icons.remove,
                                    size: 20,
                                  ),
                                  onPressed: () => decrement(),
                                ),
                              ),
                              Obx(
                                () => Text(
                                  "${num.value}",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: IconButton(
                                  icon: Icon(
                                    Icons.add,
                                    size: 20,
                                  ),
                                  onPressed: () => increment(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 217, 248, 188),
      drawer: Drawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Home',
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
          ),
          CircleAvatar(
            radius: 12,
            backgroundColor: Colors.lightGreenAccent,
            child: Icon(
              Icons.search,
              size: 17,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
          ),
          CircleAvatar(
            radius: 12,
            backgroundColor: Colors.lightGreenAccent,
            child: Icon(
              Icons.shop,
              size: 17,
              color: Colors.black,
            ),
          ),
        ],
        backgroundColor: Colors.cyanAccent,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: ListView(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/vegetableshs.png'),
                ),
                color: Colors.cyan,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      //color: Colors.brown,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 135, bottom: 50),
                            child: Container(
                              height: 40,
                              width: 70,
                              decoration: BoxDecoration(
                                color: Colors.cyanAccent,
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(50),
                                  bottomLeft: Radius.circular(50),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'FRESH',
                                  style: TextStyle(
                                    fontSize: 20,
                                    shadows: [
                                      BoxShadow(
                                        color: Colors.white,
                                        blurRadius: 3,
                                        offset: Offset(3, 3),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              '10% OFF',
                              style: TextStyle(
                                fontSize: 40,
                                color: Color.fromARGB(255, 60, 220, 231),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            'On all vegetables products.',
                            style: TextStyle(
                              color: Color.fromARGB(255, 45, 203, 243),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Herbs Seasoning'),
                  Text(
                    'View all',
                    style: TextStyle(color: Colors.cyan),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  singalProducts(),
                  singalProducts(),
                  singalProducts(),
                  singalProducts(),
                  singalProducts(),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Fresh Fruits'),
                  Text(
                    'View all',
                    style: TextStyle(color: Colors.cyan),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  singalProducts(),
                  singalProducts(),
                  singalProducts(),
                  singalProducts(),
                  singalProducts(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
