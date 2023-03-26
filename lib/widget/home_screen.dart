import 'package:flutter/material.dart';
import 'package:weaather_app/utilities/colofull.dart';
import 'package:weaather_app/utilities/getAPI.dart';
import 'package:weaather_app/utilities/textful.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showInputField = true;
  late Future<GetAPI>? pri;

  Future<void>? getData(String name) {
    // String result = name
    //     .replaceAll(" ", "_")
    //     .replaceAll(RegExp(r'[^a-zA-Z0-9_]'), '')
    //     .toLowerCase();
    // print(result);

    setState(() {
      _showInputField = false;
      pri = getDataFromWeatherapi(name);
    });
    return null;
  }

  // @override
  // initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    var pheight = MediaQuery.of(context).size.height;
    var pwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colorfull.greenBlue,
      // appBar: AppBar(),
      body: Center(
        child: AnimatedSwitcher(
          duration: const Duration(seconds: 1),
          child: _showInputField == true
              ? Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: TextFormField(
                    onFieldSubmitted: (value) {
                      getData(value);
                    },
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colorfull.white,
                        prefixIcon: Icon(Icons.search_rounded),
                        hintText: "Crush em T ?",
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colorfull.white, width: 0),
                          borderRadius: BorderRadius.circular(35),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35),
                          borderSide:
                              BorderSide(color: Colorfull.white, width: 0),
                        )),
                  ),
                )
              : FutureBuilder(
                  future: pri,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return SizedBox(
                        height: pheight * 0.7,
                        width: pwidth * 0.9,
                        child: Card(
                          shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                            borderSide: const BorderSide(
                                width: 0, color: Colorfull.lightBlue),
                          ),
                          elevation: 2.31,
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0,
                                    right: 8.0,
                                    bottom: 8.0,
                                    top: 5.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          size: 37,
                                        ),
                                        Textfull.textCountry(
                                            snapshot.data?.location?.country),
                                      ],
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _showInputField = true;
                                        });
                                      },
                                      icon: const Icon(Icons.close_rounded,
                                          size: 37),
                                    ),
                                  ],
                                ),
                              ),
                              // Divider(
                              //   thickness: 1.1,
                              // ),
                              Expanded(
                                  flex: 4,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Image.network(
                                        'https:${snapshot.data?.current?.condition?.icon}',
                                        scale: 0.65,
                                        fit: BoxFit.cover,
                                      ),
                                      Textfull.textDregees(
                                          '${snapshot.data?.current?.tempC}°C'),
                                      Textfull.textStatus(
                                          '${snapshot.data?.current?.condition?.text}'),
                                      Textfull.textCity(
                                          snapshot.data?.location?.name),
                                    ],
                                  )),
                              const Divider(
                                  thickness: 6,
                                  height: 0,
                                  color: Colorfull.greenBlue),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, bottom: 8.0),
                                  child: Row(
                                    children: [
                                      Textfull.textStatus2(
                                          '${snapshot.data?.current?.windKph} km/h',
                                          'Tốc độ gió',
                                          true),
                                      const VerticalDivider(
                                          width: 1.0,
                                          thickness: 1.4,
                                          color: Colors.grey),
                                      Textfull.textStatus2(
                                          '${snapshot.data?.current?.humidity} %',
                                          'Độ ẩm',
                                          false),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
        ),
      ),
    );
  }
}
