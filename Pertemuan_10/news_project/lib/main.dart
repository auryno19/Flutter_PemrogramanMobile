import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'MyApp'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: 
          [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const[
                Text(
                    "BERITA TERBARU",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "BERITA HARI INI",
                    style: TextStyle(fontSize: 16),
                  )
               ],
            ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 20),
              decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: Colors.purpleAccent)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>
                [
                  Container(
                    height: 200,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        alignment: Alignment.center,
                        fit: BoxFit.fitWidth,
                        image: AssetImage('assets/images/gambar1.jpg')
                      )
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: const Text(
                      "Tragedi Halloween di Itaewon yang Memakan Banyak Korban Jiwa",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.pink,
                    padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                    child: const Text(
                      "Ittaweon",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Image.asset('assets/images/gambar2.jpeg'),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(15, 0, 0, 15),
                          child: const Text(
                            "Korban isiden tragedi Halloween di Ittaewon"
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(width: 1, color: Colors.grey),
                      ),
                    ),
                    child: const Text("Korea Selatan, 29 Oktober 2022"),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Image.asset('assets/images/gambar2.jpeg'),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(15, 0, 0, 15),
                          child: const Text(
                            "Korban isiden tragedi Halloween di Ittaewon"
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(width: 1, color: Colors.grey),
                      ),
                    ),
                    child: const Text("Korea Selatan, 29 Oktober 2022"),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Image.asset('assets/images/gambar2.jpeg'),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(15, 0, 0, 15),
                          child: const Text(
                            "Korban isiden tragedi Halloween di Ittaewon"
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(width: 1, color: Colors.grey),
                      ),
                    ),
                    child: const Text("Korea Selatan, 29 Oktober 2022"),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 15),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Image.asset('assets/images/gambar2.jpeg'),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(15, 0, 0, 15),
                          child: const Text(
                            "Korban isiden tragedi Halloween di Ittaewon"
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(width: 1, color: Colors.grey),
                      ),
                    ),
                    child: const Text("Korea Selatan, 29 Oktober 2022"),
                  )
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}
