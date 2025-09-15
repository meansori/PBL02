// for (inisialisasi; kondisi; iterasi) {
//   // kode yang akan dijalankan
// }

// for (let i = 0; i < 5; i++) {
//   console.log("Perulangan ke-" + i);
// }

// while (kondisi) {
//   // kode yang akan dijalankan
// }

// let i = 0;
// while (i < 5) {
//   console.log("Perulangan ke-" + i);
//   i++;
// }

// do {
//   // kode yang akan dijalankan
// } while (kondisi);

// let i = 0;
// do {
//   console.log("Perulangan ke-" + i);
//   i++;
// } while (i < 5);

// for (let item of iterable) {
//   // kode yang akan dijalankan
// }

// const buah = ["apel", "mangga", "pisang"];
// for (let item of buah) {
//   console.log(item);
// }

// for (let key in object) {
//   // kode yang akan dijalankan
// }

// const siswa = { nama: "Budi", umur: 17 };
// for (let key in siswa) {
//   console.log(key + ": " + siswa[key]);
// }

// for () {
//   if (kondisi) {
//     break;
//   }
//   // kode
// }

// for (let i = 1; i <= 5; i++) {
//   if (i === 3) {
//     break; // loop berhenti saat i = 3
//   }
//   console.log(i);
// }

// for (...) {
//   if (kondisi) {
//     continue;
//   }
//   // kode
// }

// for (let i = 1; i <= 5; i++) {
//   if (i === 3) {
//     continue; // skip iterasi saat i = 3
//   }
//   console.log(i);
// }

// function namaFungsi() {
//   for (...) {
//     if (kondisi) {
//       return;
//     }
//   }
// }

// function cekAngka() {
//   for (let i = 1; i <= 5; i++) {
//     if (i === 3) {
//       return console.log("Berhenti di 3");
//     }
//     console.log(i);
//   }
// }
// console.log(cekAngka());

// for (...) {
//   for (...) {
//     // kode dalam loop dalam
//   }
// }

// const matriks = [
//   [1, 2],
//   [3, 4]
// ];

// for (let i = 0; i < matriks.length; i++) {
//   for (let j = 0; j < matriks[i].length; j++) {
//     console.log(matriks[i][j]);
//   }
// }

// //contoh yg salah
// for (let i = 0; i < 5;) {
//   console.log(i);
// }

// //contoh yang benar
// for (let i = 0; i < 5; i++) {
//   console.log(i);
// }

// const angka = [1, 2, 3, 4];
// // forEach
// angka.forEach((a) => console.log(a));

// const angka = [1, 2, 3, 4];
// // map
// const kaliDua = angka.map((a) => a * 2);
// console.log(kaliDua); // [2, 4, 6, 8]

// filter
// const angka = [1, 2, 3, 4];
// const genap = angka.filter((a) => a % 2 === 0);
// console.log(genap); // [2, 4]

// reduce
// const angka = [1, 2, 3, 4];
// const total = angka.reduce((acc, a) => acc + a, 0);
// console.log(total); // 10

//latihan
// Buat program for yang mencetak angka 1 sampai 10 ke console.
// for (let i = 1; i <= 10; i++) {
//   console.log(i);
// }

// Buat program while yang mencetak angka genap dari 2 sampai 20.
// let i = 2;
// while (i <= 20) {
//   if (i % 2 === 0) {
//     console.log(i);
//   }
//   i++;
// }

// Buat program do...while yang mencetak "Hello" sebanyak 5 kali.
// let i = 0;
// do {
//   console.log("hello");
//   i++;
// } while (i < 5);

// Gunakan for...of untuk mencetak setiap huruf dalam string "Belajar".
// const kata = "Belajar";

// for (const huruf of kata) {
//   console.log(huruf);
// }

// Gunakan for...in untuk mencetak semua properti dan nilainya dari objek berikut:

// const siswa = { nama: "Budi", umur: 17, kelas: "11 IPA" };
// for (let key in siswa) {
//   console.log(`${key} : ${siswa[key]} `);
// }
