import 'package:flutter/material.dart';
import 'package:tugas_akhir/db/database_instance.dart';
import 'package:tugas_akhir/models/transaksi.dart';
import 'package:tugas_akhir/page/create_page.dart';
import 'package:tugas_akhir/page/update_page.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
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

  showAlertDialog(BuildContext contex, int idTransaksi) {
    Widget okButton = TextButton(
      child: Text("Yakin"),
      onPressed: () {
        //delete disini
        databaseInstance!.hapus(idTransaksi);
        Navigator.of(contex, rootNavigator: true).pop();
        setState(() {});
      },
    );

    AlertDialog alertDialog = AlertDialog(
      title: Text("Peringatan !"),
      content: Text("Anda yakin akan menghapus ?"),
      actions: [okButton],
    );

    showDialog(
        context: contex,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Riwayat Uang"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreatePage()));
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: SafeArea(
            child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            FutureBuilder(
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
            ),
            SizedBox(
              height: 20,
            ),
            FutureBuilder(
              future: databaseInstance!.totalPengeluaran(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("-");
                } else {
                  if (snapshot.hasData) {
                    return Text(
                        "Total pengeluaran : Rp. ${snapshot.data.toString()}");
                  } else {
                    return Text("Total pengeluaran: Rp. 0");
                  }
                }
              },
            ),
            SizedBox(
              height: 20,
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
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
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
            FutureBuilder<List<Transaksi>>(
                future: databaseInstance!.getAll(),
                builder: (context, snapshot) {
                  print('HASIL : ' + snapshot.data.toString());
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("Loading");
                  } else {
                    if (snapshot.hasData) {
                      return Expanded(
                        child: ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(snapshot.data![index].name!),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Rp. ' +
                                          snapshot.data![index].total!
                                              .toString(),
                                      style: TextStyle(
                                        color: Color(0xFF0084FF),
                                      ),
                                    ),
                                    Text(snapshot.data![index].updatedAt!
                                        .toString()),
                                  ],
                                ),
                                leading: snapshot.data![index].type == 1
                                    ? Icon(
                                        Icons.download,
                                        color: Colors.green,
                                      )
                                    : Icon(
                                        Icons.upload,
                                        color: Colors.red,
                                      ),
                                trailing: Wrap(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                                  builder: (context) =>
                                                      UpdatePage(
                                                        transaksi: snapshot
                                                            .data![index],
                                                      )))
                                              .then((value) {
                                            setState(() {});
                                          });
                                        },
                                        icon: Icon(
                                          Icons.edit,
                                          color: Colors.grey,
                                        )),
                                    IconButton(
                                        onPressed: () {
                                          showAlertDialog(context,
                                              snapshot.data![index].id!);
                                        },
                                        icon: Icon(Icons.delete,
                                            color: Colors.red))
                                  ],
                                ),
                              );
                            }),
                      );
                    } else {
                      return Text("Tidak ada data");
                    }
                  }
                })
          ],
        )),
      ),
    );
  }
}
