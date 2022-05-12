import 'package:flutter/material.dart';

class Coffee extends StatefulWidget {
  const Coffee({Key? key}) : super(key: key);

  @override
  State<Coffee> createState() => _CoffeeState();
}

class _CoffeeState extends State<Coffee> {
  List items = ['Cappuccino', 'Amerciano', 'Espresso'];
  int _currentItem = 0;
  List data = [
    {
      'image':
          'https://th.bing.com/th/id/OIP.fYqo-qbw7F_NRe5pg3y_gQHaE8?pid=ImgDet&rs=1',
      'name': 'Cappuccino',
      'adds': 'With Almond Milk',
      'price': '4.98',
    },
    {
      'image':
          'https://s3-media1.fl.yelpcdn.com/bphoto/hlZv9ItiaMKwSJEgiMa2HQ/348s.jpg',
      'name': 'Cappuccino',
      'adds': 'With Soy Milk',
      'price': '5.14',
    },
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff483f36),
        appBar: AppBar(
          leading: Container(
            margin: const EdgeInsets.only(left: 10, bottom: 10),
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.network(
              'https://images.unsplash.com/photo-1614880353165-e56fac2ea9a8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
              fit: BoxFit.cover,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Stack(
                children: const [
                  Icon(
                    Icons.notifications,
                    size: 34,
                  ),
                  Positioned(
                    top: 4,
                    right: 5,
                    child: CircleAvatar(
                      backgroundColor: Color(0xffd76c14),
                      radius: 5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Search Your \nFavourite Coffee',
                  style: TextStyle(
                      color: Color(0xfff2f1e7),
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: const Color(0xff8f8b80),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.white),
                        cursorColor: const Color(0xffd76c14),
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.search,
                              size: 20,
                              color: Color(0xfff2f1e7),
                            ),
                            hintText: 'Find Your Coffee',
                            hintStyle: TextStyle(
                              color: Color(0xfff2f1e7),
                            )),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: const Color(0xffd76c14),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Icon(
                      Icons.tune_sharp,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10, top: 10, bottom: 15),
                child: Text(
                  'Categories',
                  style: TextStyle(
                      color: Color(0xfff2f1e7),
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    items.length,
                    (index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          _currentItem = index;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: _currentItem == index
                              ? const Color(0xffd76c14)
                              : const Color(0xff8f8b80),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          items[index],
                          style: const TextStyle(
                            color: Color(0xfff2f1e7),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: List.generate(
                      data.length,
                      (index) => Container(
                          width: MediaQuery.of(context).size.width * 0.43,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color(0xff8f8b80),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 230,
                                height: 120,
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Image.network(data[index]['image'],
                                    fit: BoxFit.cover),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                data[index]['name'],
                                style: const TextStyle(
                                  color: Color(0xfff2f1e7),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                data[index]['adds'],
                                style: const TextStyle(
                                  color: Color(0xfff2f1e7),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '\$' + data[index]['price'],
                                    style: const TextStyle(
                                      color: Color(0xfff2f1e7),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                    ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.all(3),
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color(0xffd76c14)),
                                      child: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ))
                                ],
                              )
                            ],
                          ))),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, top: 10, bottom: 15, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Special Offers',
                      style: TextStyle(
                          color: Color(0xfff2f1e7),
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'View All',
                      style: TextStyle(
                        color: Color(0xfff2f1e7),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 15, bottom: 15),
                decoration: BoxDecoration(
                  color: const Color(0xff8f8b80),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 140,
                      height: 100,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.network(
                          'https://th.bing.com/th/id/R.0ed2b899873c0419d8e9ae7b4b1d880f?rik=HLcRxuOtWaZnjQ&riu=http%3a%2f%2fpaintingrachelred.weebly.com%2fuploads%2f2%2f3%2f8%2f6%2f23867843%2f4309545_orig.jpg&ehk=IFkRhQd3lBAjMdohs95GZulZcZRQuaG3pT3ib0r%2bMpM%3d&risl=&pid=ImgRaw&r=0',
                          fit: BoxFit.fill),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color(0xffd76c14),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Text('Discount Sale',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                            'Buy Two Coffee latte Get \nOne Coffee Machito Free ',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          backgroundColor: const Color(0xff8f8b80),
          type: BottomNavigationBarType.fixed,
          iconSize: 27,
          selectedItemColor: const Color(0xffd76c14),
          unselectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                  padding: const EdgeInsets.only(top: 7),
                  child: _currentIndex == 0
                      ? const Icon(Icons.home)
                      : const Icon(
                          Icons.home_outlined,
                        )),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 7),
                child: _currentIndex == 1
                    ? const Icon(
                        Icons.shopping_cart,
                      )
                    : const Icon(
                        Icons.shopping_cart_outlined,
                      ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 7),
                child: _currentIndex == 2
                    ? const Icon(
                        Icons.favorite,
                      )
                    : const Icon(
                        Icons.favorite_border_outlined,
                      ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 7),
                child: _currentIndex == 3
                    ? const Icon(Icons.notifications)
                    : const Icon(
                        Icons.notifications_outlined,
                      ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 7),
                child: _currentIndex == 4
                    ? const Icon(
                        Icons.person,
                      )
                    : const Icon(
                        Icons.person_outlined,
                      ),
              ),
              label: '',
            )
          ],
        ));
  }
}
