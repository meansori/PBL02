// use database
use belajar
// membuat collection
db.createCollection('satuan');
db.createCollection('jenis_kelamin');
db.createCollection('kota');
db.createCollection('pelanggan');
db.createCollection('produk');
db.createCollection('penjualan');


db.getCollectionNames();

// Create collection satuan
db.satuan.insertMany([
  { kode: "BUNGKUS", nama: "Bungkus" },
  { kode: "PAK", nama: "Pak" },
  { kode: "BOTOL", nama: "Botol" }
]);

// Create collection jenis_kelamin
db.jenis_kelamin.insertMany([
  { kode: "P", nama: "Pria" },
  { kode: "W", nama: "Wanita" }
]);

// Create collection kota
db.kota.insertMany([
  { kode: "JKT", nama: "Jakarta" },
  { kode: "BDG", nama: "Bandung" },
  { kode: "SUB", nama: "Surabaya" }
]);

// Create collection pelanggan dengan referensi
db.pelanggan.insertMany([
  {
    kode: "PLG01",
    nama: "Mohamad",
    kode_kelamin: "P",
    alamat: "Priok",
    kode_kota: "JKT"
  },
  {
    kode: "PLG02",
    nama: "Naufal",
    kode_kelamin: "P",
    alamat: "Cilincing",
    kode_kota: "JKT"
  },
  {
    kode: "PLG03",
    nama: "Atila",
    kode_kelamin: "P",
    alamat: "Bojongsoang",
    kode_kota: "BDG"
  },
  {
    kode: "PLG04",
    nama: "Tsaisa",
    kode_kelamin: "W",
    alamat: "Bush Batu",
    kode_kota: "BDG"
  },
  {
    kode: "PLG05",
    nama: "Damay",
    kode_kelamin: "W",
    alamat: "Gubeng",
    kode_kota: "SUB"
  },
  {
    kode: "PLG06",
    nama: "Tsaniy",
    kode_kelamin: "P",
    alamat: "Darmo",
    kode_kota: "SUB"
  },
  {
    kode: "PLG07",
    nama: "Nabila",
    kode_kelamin: "W",
    alamat: "Lebak Bulus",
    kode_kota: "JKT"
  }
]);

// Create collection produk dengan referensi satuan
db.produk.insertMany([
  {
    kode: "P001",
    nama: "Indomie",
    kode_satuan: "BUNGKUS",
    stok: 10,
    harga: 3000
  },
  {
    kode: "P002",
    nama: "Roti",
    kode_satuan: "PAK",
    stok: 3,
    harga: 18000
  },
  {
    kode: "P003",
    nama: "Kecap",
    kode_satuan: "BOTOL",
    stok: 8,
    harga: 4700
  },
  {
    kode: "P004",
    nama: "Saos Tomat",
    kode_satuan: "BOTOL",
    stok: 8,
    harga: 5800
  },
  {
    kode: "P005",
    nama: "Bihun",
    kode_satuan: "BUNGKUS",
    stok: 5,
    harga: 3500
  },
  {
    kode: "P006",
    nama: "Sikat Gigi",
    kode_satuan: "PAK",
    stok: 5,
    harga: 15000
  },
  {
    kode: "P007",
    nama: "Pasta Gigi",
    kode_satuan: "PAK",
    stok: 7,
    harga: 10000
  },
  {
    kode: "P008",
    nama: "Saos Sambal",
    kode_satuan: "BOTOL",
    stok: 5,
    harga: 7300
  }
]);

// Create collection penjualan dengan referensi
db.penjualan.insertMany([
  {
    tgl_jual: new Date("2025-09-08"),
    no_jual: "J001",
    kode_pelanggan: "PLG03",
    items: [
      { kode_produk: "P001", jumlah: 2 },
      { kode_produk: "P003", jumlah: 1 },
      { kode_produk: "P004", jumlah: 1 }
    ]
  },
  {
    tgl_jual: new Date("2025-09-08"),
    no_jual: "J002",
    kode_pelanggan: "PLG07",
    items: [
      { kode_produk: "P006", jumlah: 3 },
      { kode_produk: "P007", jumlah: 1 }
    ]
  },
  {
    tgl_jual: new Date("2025-09-09"),
    no_jual: "J003",
    kode_pelanggan: "PLG02",
    items: [
      { kode_produk: "P001", jumlah: 5 },
      { kode_produk: "P004", jumlah: 2 },
      { kode_produk: "P008", jumlah: 2 },
      { kode_produk: "P003", jumlah: 1 }
    ]
  },
  {
    tgl_jual: new Date("2025-09-10"),
    no_jual: "J004",
    kode_pelanggan: "PLG05",
    items: [
      { kode_produk: "P002", jumlah: 3 },
      { kode_produk: "P004", jumlah: 2 },
      { kode_produk: "P008", jumlah: 2 },
      { kode_produk: "P006", jumlah: 2 },
      { kode_produk: "P007", jumlah: 1 }
    ]
  }
]);

// Query sederhana untuk melihat penjualan dengan nama pelanggan dan produk
db.penjualan.aggregate([
  {
    $lookup: {
      from: "pelanggan",
      localField: "kode_pelanggan",
      foreignField: "kode",
      as: "pelanggan_info"
    }
  },
  {
    $lookup: {
      from: "produk",
      localField: "items.kode_produk",
      foreignField: "kode",
      as: "produk_info"
    }
  },
  {
    $project: {
      no_jual: 1,
      tgl_jual: 1,
      nama_pelanggan: { $arrayElemAt: ["$pelanggan_info.nama", 0] },
      items: {
        $map: {
          input: "$items",
          as: "item",
          in: {
            jumlah: "$$item.jumlah",
            produk: {
              $arrayElemAt: [
                {
                  $filter: {
                    input: "$produk_info",
                    cond: { $eq: ["$$this.kode", "$$item.kode_produk"] }
                  }
                },
                0
              ]
            }
          }
        }
      }
    }
  }
]);

// Total penjualan per kota
db.penjualan.aggregate([
  {
    $lookup: {
      from: "pelanggan",
      localField: "kode_pelanggan",
      foreignField: "kode",
      as: "pelanggan"
    }
  },
  { $unwind: "$pelanggan" },
  {
    $lookup: {
      from: "kota",
      localField: "pelanggan.kode_kota",
      foreignField: "kode",
      as: "kota"
    }
  },
  { $unwind: "$kota" },
  {
    $group: {
      _id: "$kota.nama",
      total_transaksi: { $sum: 1 },
      total_pelanggan: { $addToSet: "$pelanggan.kode" }
    }
  },
  {
    $project: {
      kota: "$_id",
      total_transaksi: 1,
      jumlah_pelanggan: { $size: "$total_pelanggan" }
    }
  }
]);
