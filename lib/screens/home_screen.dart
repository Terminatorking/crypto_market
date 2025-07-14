import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../crypto_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Crypto> cryptoList = [];
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: () {
            cryptoList.clear();
            getData();
          },
        ),
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
              autofocus: true,
              onChanged: (value) {
                search(searchController.text);
              },
              controller: searchController,
              cursorColor: Colors.white,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(0.7),
              ),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black.withOpacity(0.7),
                ),
                filled: true,
                hintStyle: TextStyle(
                  fontWeight: FontWeight.bold,
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
          cryptoList.isEmpty
              ? Expanded(
                  child: SizedBox(
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                )
              : Expanded(
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: cryptoList.length,
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
                              SizedBox(
                                width: index < 9
                                    ? 30
                                    : index == 99
                                        ? 10
                                        : 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cryptoList[index].name,
                                    style: TextStyle(
                                      color:
                                          Colors.greenAccent.withOpacity(0.7),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    cryptoList[index].symbol,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    cryptoList[index]
                                        .priceUsd
                                        .toStringAsFixed(2),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    cryptoList[index]
                                        .changePercent24Hr
                                        .toStringAsFixed(2),
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: cryptoList[index]
                                                  .changePercent24Hr <
                                              0.0
                                          ? Colors.redAccent.withOpacity(0.7)
                                          : Colors.greenAccent.withOpacity(0.7),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Icon(
                                cryptoList[index].changePercent24Hr < 0.0
                                    ? Icons.trending_down
                                    : Icons.trending_up,
                                color: cryptoList[index].changePercent24Hr < 0.0
                                    ? Colors.redAccent.withOpacity(0.7)
                                    : Colors.greenAccent.withOpacity(0.7),
                              )
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

  Future<void> getData() async {
    Uri uri = Uri.parse("https://rest.coincap.io/v3/assets?apiKey=e5846ddb9381fed5cb28965b4d0b8664ab3b1f8308184634b9f5234e7d077959");
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      if (cryptoList.isEmpty) {
        var json = jsonDecode(response.body);
        List jsonlist = json["data"];
        for (var element in jsonlist) {
          setState(
            () {
              cryptoList.add(Crypto.fromeMapJson(element));
            },
          );
        }
      }
    }
    print(cryptoList);
    print(response.statusCode);
  }

  Future<void> search(String search) async {
    List<Crypto> searchedCryptoList = [];
    searchedCryptoList = cryptoList.where(
      (element) {
        return element.name.toLowerCase().contains(
              search.toLowerCase(),
            );
      },
    ).toList();
    if (search == "") {
      searchedCryptoList.clear();
      cryptoList.clear();
      await getData();
    } else {
      setState(
        () {
          cryptoList = searchedCryptoList;
        },
      );
    }
  }
}
