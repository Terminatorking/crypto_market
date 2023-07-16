import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextEditingController searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("CryptoMarket"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            width: size.width,
            child: TextField(
              controller: searchController,
              cursorColor: Colors.white,
              style: TextStyle(
                color: Colors.black.withOpacity(0.7),
              ),
              decoration: InputDecoration(
                filled: true,
                hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.7),
                ),
                fillColor: Colors.greenAccent.withOpacity(0.8),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  borderSide: BorderSide(width: 0),
                ),
                errorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  borderSide: BorderSide(width: 0),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  borderSide: BorderSide(width: 0),
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  borderSide: BorderSide(width: 0),
                ),
                hintText: "type your crypto name to search...",
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Row(
                      children: [
                        Text(
                          (index + 1).toString(),
                          style: TextStyle(
                            color: Colors.grey[300],
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Column(
                          children: [
                            Text(
                              "bitcoin",
                              style: TextStyle(
                                color: Colors.greenAccent.withOpacity(0.7),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text("BTC"),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          children: [
                            Text(
                              "bitcoin",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "BTC",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.greenAccent.withOpacity(0.7),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Icon(Icons.trending_up)
                      ],
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
