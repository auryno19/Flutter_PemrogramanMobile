class Transaksi {
  /*
  tipe
  1 -> pemasukan
  2 -> pengeluaran
  */
  int? id, type, total;
  String? name, createdAt, updatedAt;

  Transaksi(
      {this.id,
      this.type,
      this.total,
      this.name,
      this.createdAt,
      this.updatedAt});

  factory Transaksi.fromJson(Map<String, dynamic> json) {
    return Transaksi(
        id: json['id'],
        type: json['type'],
        total: json['total'],
        name: json['name'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at']);
  }
}