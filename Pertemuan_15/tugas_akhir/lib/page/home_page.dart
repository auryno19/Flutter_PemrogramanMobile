import 'package:flutter/material.dart';
import 'package:tugas_akhir/db/database_instance.dart';
import 'package:tugas_akhir/page/create_page.dart';
import 'package:tugas_akhir/page/detail_page.dart';
import 'package:tugas_akhir/page/setting_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DatabaseInstance? databaseInstance;

  Future _refresh() async {
    setState(() {});
  }

  @override
  void initState() {
    databaseInstance = DatabaseInstance();
    initDatabase();
    super.initState();
  }

  Future initDatabase() async {
    await databaseInstance!.database();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: SizedBox.fromSize(
            size: MediaQuery.of(context).size,
            child: SafeArea(
                child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  FutureBuilder(
                    future: databaseInstance!.saldo(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Text("-");
                      } else {
                        if (snapshot.hasData) {
                          return Text(
                              "Saldo Saat ini : Rp. ${snapshot.data.toString()}");
                        } else {
                          // return Text("Saldo Saat ini: Rp. 0");
                          var masuk = FutureBuilder(
                            future: databaseInstance!.totalPemasukan(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return Text("-");
                              } else {
                                if (snapshot.hasData) {
                                  return Text(
                                      "Total pemasukan : Rp. ${snapshot.data.toString()}");
                                } else {
                                  return Text("Total pemasukan: Rp. 0");
                                }
                              }
                            },
                          );
                          return masuk;
                        }
                      }
                    },
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GridView.count(
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        primary: false,
                        crossAxisCount: 2,
                        children: <Widget>[
                          Card(
                            child: MaterialButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CreatePage()));
                              },
                              child: Column(
                                children: <Widget>[
                                  Image.asset(
                                    'assets/icons/cash-in.jpg',
                                    height: 110,
                                  ),
                                  Text(
                                    'Tambah Pemasukan',
                                    style: TextStyle(
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            child: MaterialButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CreatePage()));
                              },
                              child: Column(
                                children: <Widget>[
                                  Image.asset(
                                    'assets/icons/cash-out.jpg',
                                    height: 110,
                                  ),
                                  Text(
                                    'Tambah Pengeluaran',
                                    style: TextStyle(
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            child: MaterialButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailPage()));
                              },
                              child: Column(
                                children: <Widget>[
                                  Image.asset(
                                    'assets/icons/cash-detail.jpg',
                                    height: 120,
                                  ),
                                  Text(
                                    'Riwayat Uang',
                                    style: TextStyle(
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            child: MaterialButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SettingPage()));
                              },
                              child: Column(
                                children: <Widget>[
                                  Image.asset(
                                    'assets/icons/setting.jpg',
                                    height: 120,
                                  ),
                                  Text(
                                    'Pengaturan',
                                    style: TextStyle(
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )),
          ),
        ),
      ),
    );
  }
}
