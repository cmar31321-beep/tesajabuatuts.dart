//11111111111111sistem parkir mall
// import 'dart:io';

// // 1. Superclass (Inheritance & Encapsulation)
// abstract class Kendaraan {
//   String _platNomor;
//   int _waktuMasuk; // Jam masuk (0-23)

//   Kendaraan(this._platNomor, this._waktuMasuk);
// //
//   // Getter
//   String get platNomor => _platNomor;
//   int get waktuMasuk => _waktuMasuk;

//   // Method abstract untuk menghitung tarif parkir berdasarkan jenis kendaraan
//   int hitungTarif(int waktuKeluar);
// }

// // 2. Subclass Mobil (Polymorphism)
// class Mobil extends Kendaraan {
//   Mobil(String platNomor, int waktuMasuk) : super(platNomor, waktuMasuk);

//   @override
//   int hitungTarif(int waktuKeluar) {
//     int lamaParkir = waktuKeluar - waktuMasuk;
//     if (lamaParkir <= 0) lamaParkir = 1; // Minimal 1 jam
    
//     // Tarif mobil: Rp 5.000 untuk jam pertama, Rp 3.000 untuk jam berikutnya
//     return 5000 + ((lamaParkir - 1) * 3000);
//   }
// }

// // 3. Subclass Motor (Polymorphism)
// class Motor extends Kendaraan {
//   Motor(String platNomor, int waktuMasuk) : super(platNomor, waktuMasuk);

//   @override
//   int hitungTarif(int waktuKeluar) {
//     int lamaParkir = waktuKeluar - waktuMasuk;
//     if (lamaParkir <= 0) lamaParkir = 1;

//     // Tarif motor: Rp 2.000 untuk jam pertama, Rp 1.000 untuk jam berikutnya
//     return 2000 + ((lamaParkir - 1) * 1000);
//   }
// }

// // 4. Class Manajemen Parkir Mall
// class SistemParkir {
//   List<Kendaraan> _daftarParkir = [];
//   int _kapasitasMaksimal = 5; // Batas kapasitas untuk simulasi

//   void kendaraanMasuk(Kendaraan k) {
//     if (_daftarParkir.length < _kapasitasMaksimal) {
//       _daftarParkir.add(k);
//       print("Kendaraan ${k.platNomor} berhasil masuk parkir.");
//     } else {
//       print("Mohon maaf, kapasitas parkir mall penuh!");
//     }
//   }

//   void kendaraanKeluar(String plat, int waktuKeluar) {
//     Kendaraan? ditemukan;
    
//     // Mencari kendaraan di dalam list
//     for (var k in _daftarParkir) {
//       if (k.platNomor.toLowerCase() == plat.toLowerCase()) {
//         ditemukan = k;
//         break;
//       }
//     }

//     if (ditemukan != null) {
//       int totalBiaya = ditemukan.hitungTarif(waktuKeluar);
//       int lamaParkir = waktuKeluar - ditemukan.waktuMasuk;
      
//       print("\n--- STRUK KELUAR PARKIR ---");
//       print("Plat Nomor   : ${ditemukan.platNomor}");
//       print("Lama Parkir  : $lamaParkir Jam");
//       print("Total Bayar  : Rp $totalBiaya");
//       print("---------------------------\n");

//       _daftarParkir.remove(ditemukan);
//     } else {
//       print("Kendaraan dengan plat $plat tidak ditemukan di parkiran.");
//     }
//   }

//   void tampilkanStatus() {
//     print("\n--- STATUS SLOT PARKIR ---");
//     print("Terisi: ${_daftarParkir.length} / $_kapasitasMaksimal slot");
//     if (_daftarParkir.isEmpty) {
//       print("Parkiran Kosong.");
//     } else {
//       for (int i = 0; i < _daftarParkir.length; i++) {
//         var jenis = (_daftarParkir[i] is Mobil) ? "Mobil" : "Motor";
//         print("${i + 1}. [ $jenis ] Plat: ${_daftarParkir[i].platNomor} (Masuk Jam: ${_daftarParkir[i].waktuMasuk})");
//       }
//     }
//     print("--------------------------\n");
//   }
// }

// // 5. Fungsi Main dengan Perulangan Menu (Looping)
// void main() {
//   SistemParkir mallParkir = SistemParkir();
//   bool berjalan = true;

//   print("=== SISTEM MANAJEMEN PARKIR MALL ===");

//   // Perulangan Menu Utama menggunakan While Loop
//   while (berjalan) {
//     print("Menu Utama:");
//     print("1. Kendaraan Masuk");
//     print("2. Kendaraan Keluar & Bayar");
//     print("3. Cek Status Slot");
//     print("4. Keluar Aplikasi");
//     stdout.write("Pilih menu (1-4): ");
//     String? pilihan = stdin.readLineSync();

//     switch (pilihan) {
//       case '1':
//         stdout.write("Masukkan Jenis Kendaraan (1 untuk Mobil, 2 untuk Motor): ");
//         String? jenis = stdin.readLineSync();
//         stdout.write("Masukkan Plat Nomor: ");
//         String plat = stdin.readLineSync() ?? "";
//         stdout.write("Masukkan Jam Masuk (Format Angka 0-23): ");
//         int jamMasuk = int.tryParse(stdin.readLineSync() ?? "0") ?? 0;

//         if (jenis == '1') {
//           mallParkir.kendaraanMasuk(Mobil(plat, jamMasuk));
//         } else if (jenis == '2') {
//           mallParkir.kendaraanMasuk(Motor(plat, jamMasuk));
//         } else {
//           print("Pilihan jenis kendaraan salah.");
//         }
//         break;

//       case '2':
//         stdout.write("Masukkan Plat Nomor yang Keluar: ");
//         String platKeluar = stdin.readLineSync() ?? "";
//         stdout.write("Masukkan Jam Keluar (Format Angka 0-23): ");
//         int jamKeluar = int.tryParse(stdin.readLineSync() ?? "0") ?? 0;
        
//         mallParkir.kendaraanKeluar(platKeluar, jamKeluar);
//         break;

//       case '3':
//         mallParkir.tampilkanStatus();
//         break;

//       case '4':
//         print("Terima kasih telah menggunakan sistem parkir mall!");
//         berjalan = false; // Menghentikan perulangan while
//         break;

//       default:
//         print("Menu tidak valid. Silakan coba lagi.");
//     }
//     print(""); // Baris baru untuk estetika terminal
//   }
// }

//2222222222222222SISTEM KASIR / TOKO ONLINE
// import 'dart:io';

// // 1. Superclass / Abstract Class (Encapsulation & Inheritance)
// abstract class Produk {
//   String _nama;
//   int _harga;

//   Produk(this._nama, this._harga);

//   // Getter
//   String get nama => _nama;
//   int get harga => _harga;

//   // Method Abstract untuk Polymorphism
//   int hitungTotalHarga();
// }

// // 2. Subclass Produk Fisik (Polymorphism)
// class ProdukFisik extends Produk {
//   int beratBenda; // dalam gram
//   int ongkirPerKg = 10000;

//   ProdukFisik(String nama, int harga, this.beratBenda) : super(nama, harga);

//   @override
//   int hitungTotalHarga() {
//     // Hitung ongkir: minimal 1 kg dibulatkan ke atas
//     int hitungOngkir = ((beratBenda / 1000).ceil()) * ongkirPerKg;
//     return harga + hitungOngkir;
//   }
// }

// // 3. Subclass Produk Digital (Polymorphism)
// class ProdukDigital extends Produk {
//   ProdukDigital(String nama, int harga) : super(nama, harga);

//   @override
//   int hitungTotalHarga() {
//     // Produk digital tidak memiliki ongkir
//     return harga;
//   }
// }

// // 4. Class Keranjang Belanja / Kasir
// class Kasir {
//   List<Produk> _keranjang = [];

//   void tambahKeKeranjang(Produk p) {
//     _keranjang.add(p);
//     print("${p.nama} berhasil dimasukkan ke keranjang.");
//   }

//   void tampilkanKeranjang() {
//     print("\n--- ISI KERANJANG BELANJA ---");
//     if (_keranjang.isEmpty) {
//       print("Keranjang masih kosong.");
//       print("--------------------------------");
//       return;
//     }

//     int totalPembayaran = 0;
//     int nomor = 1;

//     // Perulangan FOR-IN untuk membaca koleksi objek di dalam List
//     for (var produk in _keranjang) {
//       String jenis = (produk is ProdukFisik) ? "Fisik" : "Digital";
//       int hargaAkhir = produk.hitungTotalHarga();
//       totalPembayaran += hargaAkhir;

//       print("$nomor. [ $jenis ] ${produk.nama}");
//       print("   Harga Asli  : Rp ${produk.harga}");
//       if (produk is ProdukFisik) {
//         print("   + Ongkir    : Rp ${hargaAkhir - produk.harga} (${produk.beratBenda} gram)");
//       }
//       print("   Total Item  : Rp $hargaAkhir");
//       nomor++;
//     }

//     // Penerapan logika diskon (kondisional di luar loop)
//     print("--------------------------------");
//     if (totalPembayaran >= 150000) {
//       int diskon = (totalPembayaran * 0.1).toInt(); // Diskon 10%
//       print("Subtotal     : Rp $totalPembayaran");
//       print("Diskon (10%) : -Rp $diskon");
//       print("TOTAL BAYAR  : Rp ${totalPembayaran - diskon}");
//     } else {
//       print("TOTAL BAYAR  : Rp $totalPembayaran");
//     }
//     print("--------------------------------\n");
//   }

//   void kosongkanKeranjang() {
//     _keranjang.clear();
//   }
// }

// // 5. Fungsi Utama dengan Perulangan Menu (While Loop)
// void main() {
//   Kasir kasirMall = Kasir();
//   bool programBerjalan = true;

//   print("=== SISTEM KASIR TOKO ONLINE VIA TERMINAL ===");

//   // Perulangan utama program menggunakan While Loop
//   while (programBerjalan) {
//     print("Menu Kasir:");
//     print("1. Tambah Produk Fisik (Baju, Sepatu, dll)");
//     print("2. Tambah Produk Digital (E-Book, Voucher, dll)");
//     print("3. Lihat Keranjang & Cetak Struk");
//     print("4. Reset / Kosongkan Keranjang");
//     print("5. Keluar");
//     stdout.write("Pilih menu (1-5): ");
//     String? pilihan = stdin.readLineSync();

//     switch (pilihan) {
//       case '1':
//         stdout.write("Nama Produk Fisik: ");
//         String nama = stdin.readLineSync() ?? "Produk Tanpa Nama";
//         stdout.write("Harga Produk     : Rp ");
//         int harga = int.tryParse(stdin.readLineSync() ?? "0") ?? 0;
//         stdout.write("Berat Benda (Gram): ");
//         int berat = int.tryParse(stdin.readLineSync() ?? "0") ?? 0;

//         kasirMall.tambahKeKeranjang(ProdukFisik(nama, harga, berat));
//         break;

//       case '2':
//         stdout.write("Nama Produk Digital: ");
//         String namaDigital = stdin.readLineSync() ?? "Produk Tanpa Nama";
//         stdout.write("Harga Produk       : Rp ");
//         int hargaDigital = int.tryParse(stdin.readLineSync() ?? "0") ?? 0;

//         kasirMall.tambahKeKeranjang(ProdukDigital(namaDigital, hargaDigital));
//         break;

//       case '3':
//         kasirMall.tampilkanKeranjang();
//         break;

//       case '4':
//         kasirMall.kosongkanKeranjang();
//         print("Keranjang belanja telah dikosongkan.");
//         break;

//       case '5':
//         print("Terima kasih telah berbelanja!");
//         programBerjalan = false; // Menghentikan perulangan while
//         break;

//       default:
//         print("Menu tidak valid. Silakan ketik angka 1-5.");
//     }
//     print(""); // Memberikan space baris kosong di terminal
//   }
// }

//333333333333toko buah per kg dan stok
// import 'dart:io';

// // 1. Class Buah (Encapsulation)
// class Buah {
//   String _nama;
//   int _hargaPerKg;
//   int _stokKg;

//   Buah(this._nama, this._hargaPerKg, this._stokKg);

//   // Getter untuk mengakses properti privat
//   String get nama => _nama;
//   int get hargaPerKg => _hargaPerKg;
//   int get stokKg => _stokKg;

//   // Method untuk mengurangi stok jika dibeli
//   bool kurangiStok(int jumlah) {
//     if (_stokKg >= jumlah) {
//       _stokKg -= jumlah;
//       return true;
//     }
//     return false;
//   }
// }

// // 2. Class ItemTransaksi (Menyimpan data buah yang dibeli beserta jumlahnya)
// class ItemTransaksi {
//   Buah buah;
//   int jumlahBeliKg;

//   ItemTransaksi(this.buah, this.jumlahBeliKg);

//   // Menghitung total harga per item buah
//   int hitungSubtotal() {
//     int total = buah.hargaPerKg * jumlahBeliKg;
//     // BONUS/POLYMORPHISM SEDERHANA: Jika beli buah tertentu (misal: Mangga) lebih dari 3kg, diskon Rp 5.000
//     if (buah.nama.toLowerCase() == 'mangga' && jumlahBeliKg >= 3) {
//       total -= 5000;
//     }
//     return total;
//   }
// }

// // 3. Class TransaksiToko
// class TransaksiToko {
//   List<ItemTransaksi> _keranjangBelanja = [];

//   void tambahKeKeranjang(Buah buah, int jumlah) {
//     if (buah.kurangiStok(jumlah)) {
//       _keranjangBelanja.add(ItemTransaksi(buah, jumlah));
//       print(" Berhasil memasukkan ${buah.nama} sebanyak $jumlah Kg ke keranjang.");
//     } else {
//       print("Stok tidak cukup! Sisa stok ${buah.nama} saat ini: ${buah.stokKg} Kg.");
//     }
//   }

//   void cetakStruk() {
//     print("\n=================================");
//     print("        NOTA TOKO BUAH SEGAR     ");
//     print("=================================");
    
//     if (_keranjangBelanja.isEmpty) {
//       print("Belum ada buah yang dibeli.");
//       print("=================================\n");
//       return;
//     }

//     int totalBayar = 0;
//     int nomor = 1;

//     // Perulangan FOR-IN untuk mengiterasi isi List belanjaan
//     for (var item in _keranjangBelanja) {
//       int subtotal = item.hitungSubtotal();
//       totalBayar += subtotal;

//       print("$nomor. ${item.buah.nama}");
//       print("   ${item.jumlahBeliKg} Kg x Rp ${item.buah.hargaPerKg}/Kg = Rp $subtotal");
//       nomor++;
//     }

//     print("---------------------------------");
//     print("TOTAL YANG HARUS DIBAYAR: Rp $totalBayar");
//     print("=================================\n");
//   }
// }

// // 4. Main Program dengan While Loop Menu
// void main() {
//   // Inisialisasi daftar buah yang tersedia di toko
//   List<Buah> daftarBuah = [
//     Buah("Apel", 30000, 20),
//     Buah("Mangga", 25000, 15), // Ada promo beli >= 3kg diskon 5rb
//     Buah("Jeruk", 20000, 30),
//   ];

//   TransaksiToko transaksiSekarang = TransaksiToko();
//   bool kasirBerjalan = true;

//   print("=== APLIKASI KASIR TOKO BUAH ===");

//   // Perulangan utama menggunakan WHILE loop untuk menu kasir
//   while (kasirBerjalan) {
//     print("Menu Kasir Toko Buah:");
//     print("1. Lihat Daftar Buah & Stok");
//     print("2. Tambah Buah ke Keranjang");
//     print("3. Cetak Struk Belanja & Total");
//     print("4. Selesai / Keluar");
//     stdout.write("Pilih menu (1-4): ");
//     String? pilihan = stdin.readLineSync();

//     switch (pilihan) {
//       case '1':
//         print("\n--- DAFTAR BUAH TERSEDIA ---");
//         // Perulangan FOR konvensional untuk menampilkan indeks nomor urut
//         for (int i = 0; i < daftarBuah.length; i++) {
//           print("${i + 1}. ${daftarBuah[i].nama} - Rp ${daftarBuah[i].hargaPerKg}/Kg (Stok: ${daftarBuah[i].stokKg} Kg)");
//         }
//         print("-----------------------------\n");
//         break;

//       case '2':
//         print("\nPilih nomor buah yang ingin dibeli:");
//         for (int i = 0; i < daftarBuah.length; i++) {
//           print("${i + 1}. ${daftarBuah[i].nama}");
//         }
//         stdout.write("Masukkan nomor buah: ");
//         int nomorBuah = (int.tryParse(stdin.readLineSync() ?? "0") ?? 0) - 1;

//         // Validasi agar input nomor buah tidak eror (out of bounds)
//         if (nomorBuah >= 0 && nomorBuah < daftarBuah.length) {
//           stdout.write("Berapa Kg yang ingin dibeli?: ");
//           int jumlahBeli = int.tryParse(stdin.readLineSync() ?? "0") ?? 0;

//           if (jumlahBeli > 0) {
//             transaksiSekarang.tambahKeKeranjang(daftarBuah[nomorBuah], jumlahBeli);
//           } else {
//             print("Jumlah pembelian harus lebih dari 0.");
//           }
//         } else {
//           print("Nomor buah tidak valid!");
//         }
//         break;

//       case '3':
//         transaksiSekarang.cetakStruk();
//         break;

//       case '4':
//         print("Sesi kasir ditutup. Terima kasih!");
//         kasirBerjalan = false; // Menghentikan perulangan while loop
//         break;

//       default:
//         print("Pilihan menu salah, coba lagi.");
//     }
//     print(""); // Membuat space baris baru di console terminal
//   }
// }
//4444444444444persputakaan
// import 'dart:io';

// // 1. Class Buku (Encapsulation)
// class Buku {
//   String _judul;
//   String _penulis;
//   bool _isDipinjam = false; // Status awal buku tersedia

//   Buku(this._judul, this._penulis);

//   // Getter
//   String get judul => _judul;
//   String get penulis => _penulis;
//   bool get isDipinjam => _isDipinjam;

//   // Setter untuk mengubah status pinjam
//   set isDipinjam(bool status) {
//     _isDipinjam = status;
//   }
// }

// // 2. Class Perpustakaan (Mengelola Koleksi Objek Buku)
// class Perpustakaan {
//   List<Buku> _daftarBuku = [];

//   // Method untuk menambah buku ke perpustakaan
//   void tambahBuku(Buku buku) {
//     _daftarBuku.add(buku);
//     print("Buku '${buku.judul}' berhasil ditambahkan ke rak perpustakaan.");
//   }

//   // Method untuk menampilkan semua buku menggunakan FOR loop konvensional
//   void tampilkanSemuaBuku() {
//     print("\n--- DAFTAR BUKU DI PERPUSTAKAAN ---");
//     if (_daftarBuku.isEmpty) {
//       print("Rak buku masih kosong.");
//       print("---------------------------------------");
//       return;
//     }

//     for (int i = 0; i < _daftarBuku.length; i++) {
//       String status = _daftarBuku[i].isDipinjam ? "Dipinjam" : "Tersedia";
//       print("${i + 1}. ${_daftarBuku[i].judul} - ${_daftarBuku[i].penulis} [ $status ]");
//     }
//     print("---------------------------------------\n");
//   }

//   // Method untuk meminjam buku menggunakan perulangan FOR-IN (Searching & Filtering)
//   void pinjamBuku(String judulDicari) {
//     bool ditemukan = false;

//     // Perulangan FOR-IN untuk mencari buku di dalam List
//     for (var buku in _daftarBuku) {
//       if (buku.judul.toLowerCase() == judulDicari.toLowerCase()) {
//         ditemukan = true;
//         if (!buku.isDipinjam) {
//           buku.isDipinjam = true; // Mengubah status buku menjadi dipinjam
//           print("Berhasil! Kamu meminjam buku '${buku.judul}'. Selamat membaca!");
//         } else {
//           print("Maaf, buku '${buku.judul}' saat ini sedang dipinjam orang lain.");
//         }
//         break; // Hentikan perulangan jika buku sudah ketemu
//       }
//     }

//     if (!ditemukan) {
//       print("Maaf, buku dengan judul '$judulDicari' tidak ada di perpustakaan.");
//     }
//   }

//   // Method untuk mengembalikan buku
//   void kembalikanBuku(String judulDicari) {
//     bool ditemukan = false;

//     for (var buku in _daftarBuku) {
//       if (buku.judul.toLowerCase() == judulDicari.toLowerCase()) {
//         ditemukan = true;
//         if (buku.isDipinjam) {
//           buku.isDipinjam = false; // Mengubah status menjadi tersedia kembali
//           print("Terima kasih! Buku '${buku.judul}' telah dikembalikan ke rak.");
//         } else {
//           print("Buku '${buku.judul}' sebenarnya sudah ada di rak (belum pernah dipinjam).");
//         }
//         break;
//       }
//     }

//     if (!ditemukan) {
//       print("Judul buku '$judulDicari' salah atau tidak terdaftar di sistem kami.");
//     }
//   }
// }

// // 3. Main Program dengan Perulangan Menu (While Loop)
// void main() {
//   Perpustakaan perpusKota = Perpustakaan();
//   bool programBerjalan = true;

//   // Memasukkan beberapa data buku default di awal program
//   perpusKota.tambahBuku(Buku("Belajar Dart OOP", "Eko Kurniawan"));
//   perpusKota.tambahBuku(Buku("Laskar Pelangi", "Andrea Hirata"));
//   perpusKota.tambahBuku(Buku("Harry Potter", "J.K. Rowling"));

//   print("\n=== SYSTEM MANAJEMEN PERPUSTAKAAN DIGITAL ===");

//   // Perulangan utama program menggunakan While Loop
//   while (programBerjalan) {
//     print("Menu Utama:");
//     print("1. Lihat Daftar Buku & Status");
//     print("2. Tambah Koleksi Buku Baru");
//     print("3. Pinjam Buku");
//     print("4. Kembalikan Buku");
//     print("5. Keluar Sistem");
//     stdout.write("Pilih menu (1-5): ");
//     String? pilihan = stdin.readLineSync();

//     switch (pilihan) {
//       case '1':
//         perpusKota.tampilkanSemuaBuku();
//         break;

//       case '2':
//         stdout.write("Masukkan Judul Buku Baru : ");
//         String judul = stdin.readLineSync() ?? "Tanpa Judul";
//         stdout.write("Masukkan Nama Penulis    : ");
//         String penulis = stdin.readLineSync() ?? "Anonim";
        
//         perpusKota.tambahBuku(Buku(judul, penulis));
//         break;

//       case '3':
//         stdout.write("Ketik Judul Buku yang Ingin Dipinjam: ");
//         String judulPinjam = stdin.readLineSync() ?? "";
//         perpusKota.pinjamBuku(judulPinjam);
//         break;

//       case '4':
//         stdout.write("Ketik Judul Buku yang Ingin Dikembalikan: ");
//         String judulKembali = stdin.readLineSync() ?? "";
//         perpusKota.kembalikanBuku(judulKembali);
//         break;

//       case '5':
//         print("Sistem perpustakaan dimatikan. Terima kasih!");
//         programBerjalan = false; // Menghentikan perulangan menu utama
//         break;

//       default:
//         print("Menu tidak valid. Silakan masukkan angka antara 1-5.");
//     }
//     print(""); // Memberikan baris kosong pembatas di console terminal
//   }
// }

//5555555555555555sistem validasi keamanan(login)

// import 'dart:io';

// class Kredensial {
//   final String _pinBenar = "1234";
  
//   bool verifikasi(String inputPin) {
//     return _pinBenar == inputPin;
//   }
// }

// void main() {
//   Kredensial akun = Kredensial();
//   int batasPercobaan = 3;
//   int jumlahMencoba = 0;
//   bool loginSukses = false;

//   print("=== SISTEM VALIDASI KEAMANAN ===");

//   // PERULANGAN DO-WHILE: Berjalan minimal 1 kali untuk meminta input
//   do {
//     jumlahMencoba++;
//     stdout.write("Masukkan 4-digit PIN Anda (Percobaan $jumlahMencoba/$batasPercobaan): ");
//     String input = stdin.readLineSync() ?? "";

//     if (akun.verifikasi(input)) {
//       print(" Akses Diterima! Selamat datang.");
//       loginSukses = true;
//       break; // Langsung keluar dari perulangan jika sukses
//     } else {
//       print(" PIN Salah!");
//     }
//   } while (jumlahMencoba < batasPercobaan);

//   if (!loginSukses) {
//     print("\n Akun Anda DIBLOKIR karena salah memasukkan PIN sebanyak 3 kali.");
//   }
// }

//66666666666666 pemesanan tiket bioskop

// import 'dart:io';

// // 1. Class Kursi (Encapsulation)
// class Kursi {
//   String _baris;
//   int _nomor;
//   bool _isTersedia = true; // Default kursi kosong/tersedia

//   Kursi(this._baris, this._nomor);

//   // Getter
//   String get baris => _baris;
//   int get nomor => _nomor;
//   bool get isTersedia => _isTersedia;

//   // Setter untuk mengubah status ketersediaan kursi
//   set isTersedia(bool status) {
//     _isTersedia = status;
//   }

//   // Method untuk mendapatkan kode unik kursi (Contoh: A1, B3)
//   String get kodeKursi => "$_baris$_nomor";
// }

// // 2. Class TransaksiTiket
// class TransaksiTiket {
//   List<Kursi> _kursiDipesan = [];
//   int _hargaPerTiket = 50000;

//   void pesanKursi(Kursi kursi) {
//     if (kursi.isTersedia) {
//       kursi.isTersedia = false; // Ubah status menjadi terisi
//       _kursiDipesan.add(kursi);
//       print("Kursi ${kursi.kodeKursi} berhasil dipesan!");
//     } else {
//       print("Gagal! Kursi ${kursi.kodeKursi} sudah dipesan orang lain.");
//     }
//   }

//   void cetakStruk() {
//     print("\n=================================");
//     print("      🧾 STRUK PEMBELIAN TIKET     ");
//     print("=================================");
    
//     if (_kursiDipesan.isEmpty) {
//       print("Belum ada tiket yang dipesan.");
//       print("=================================\n");
//       return;
//     }

//     int totalBayar = 0;
//     stdout.write("Kursi dipesan: ");
    
//     // Perulangan FOR-IN untuk mengumpulkan kode kursi dan menghitung total
//     for (var kursi in _kursiDipesan) {
//       stdout.write("[${kursi.kodeKursi}] ");
//       totalBayar += _hargaPerTiket;
//     }
    
//     print("\n---------------------------------");
//     print("Jumlah Tiket : ${_kursiDipesan.length}");
//     print("Harga /Tiket : Rp $_hargaPerTiket");
//     print("TOTAL BAYAR  : Rp $totalBayar");
//     print("=================================\n");
//   }
// }

// // 3. Main Program dengan Nested Loop dan Menu Interaktif
// void main() {
//   // Inisialisasi studio bioskop dua dimensi (3 Baris x 4 Kolom)
//   List<String> daftarBaris = ['A', 'B', 'C'];
//   int jumlahKolom = 4;
//   List<Kursi> studioBioskop = [];

//   // NESTED LOOP: Membuat denah kursi otomatis saat program pertama kali jalan
//   for (var baris in daftarBaris) {
//     for (int kolom = 1; kolom <= jumlahKolom; kolom++) {
//       studioBioskop.add(Kursi(baris, kolom));
//     }
//   }

//   TransaksiTiket kasirBioskop = TransaksiTiket();
//   bool programBerjalan = true;

//   print("=== SISTEM PEMESANAN TIKET BIOSKOP ===");

//   // Perulangan WHILE untuk menjaga menu utama kasir terus berulang
//   while (programBerjalan) {
//     print("Menu Utama:");
//     print("1. Lihat Denah Kursi");
//     print("2. Pesan Tiket (Pilih Kursi)");
//     print("3. Cetak Struk Pembayaran");
//     print("4. Keluar");
//     stdout.write("Pilih menu (1-4): ");
//     String? pilihan = stdin.readLineSync();

//     switch (pilihan) {
//       case '1':
//         print("\n--- DENAH KURSI STUDIO (X = Terisi, O = Kosong) ---");
//         int counter = 0;
        
//         // NESTED LOOP: Menampilkan visualisasi denah kursi di terminal
//         for (var baris in daftarBaris) {
//           String barisTeks = "Baris $baris:  ";
//           for (int kolom = 1; kolom <= jumlahKolom; kolom++) {
//             var kursi = studioBioskop[counter];
//             // Jika tersedia cetak [ O ], jika sudah dipesan cetak [ X ]
//             barisTeks += kursi.isTersedia ? "[ O ] " : "[ X ] ";
//             counter++;
//           }
//           print(barisTeks);
//         }
//         print("------------------------------------------------------\n");
//         break;

//       case '2':
//         stdout.write("\nMasukkan Kode Kursi yang ingin dipesan (Contoh: A3 / B2): ");
//         String inputKode = (stdin.readLineSync() ?? "").toUpperCase().trim();

//         bool ditemukan = false;
//         // Perulangan FOR-IN untuk mencari objek kursi berdasarkan input pengguna
//         for (var kursi in studioBioskop) {
//           if (kursi.kodeKursi == inputKode) {
//             ditemukan = true;
//             kasirBioskop.pesanKursi(kursi);
//             break; // Hentikan pencarian jika sudah ketemu
//           }
//         }

//         if (!ditemukan) {
//           print("Kode kursi tidak valid! Pastikan format sesuai (A1 - C4).");
//         }
//         break;

//       case '3':
//         kasirBioskop.cetakStruk();
//         break;

//       case '4':
//         print("Sistem bioskop dimatikan. Selamat menonton!");
//         programBerjalan = false; // Menghentikan perulangan menu utama
//         break;

//       default:
//         print("Menu tidak valid. Silakan ketik angka 1-4.");
//     }
//     print(""); // Baris kosong pembatas interaksi
//   }
// }


