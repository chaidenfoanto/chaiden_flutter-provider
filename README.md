# Session 4 Assignments - Flutter Provider

---
### Nama: Chaiden Richardo Foanto  
### NIM: 0806022310023  
### Mata Kuliah: Visual Programming - Flutter  

---

Program ini merupakan implementasi penggunaan **Provider** untuk mengelola **global state** pada Flutter. Dalam program ini, saya membuat sebuah **package baru** yang bertanggung jawab untuk mengelola state global, seperti daftar counter, serta menyediakan fungsionalitas untuk menambah, menghapus, mengubah warna, dan mengubah label dari counter yang ada.

Program ini juga menyediakan tampilan UI yang memungkinkan pengguna untuk mengatur label dan warna setiap counter serta menambah dan menghapus counter melalui tombol aksi.

## Struktur Proyek

### 1. **Global State Package**

Saya telah membuat package baru untuk mengelola state global yang bertanggung jawab atas seluruh data aplikasi. Package ini terletak pada folder `global_state/` dan terdiri dari beberapa file:

- **`lib/counter_data.dart`**: Menyimpan data untuk setiap counter yang mencakup nilai, label, dan warna.
- **`lib/global_state.dart`**: Menyediakan metode untuk mengelola daftar counter (menambah, menghapus, memperbarui warna, label, dan nilai).

### 2. **Main App**

Aplikasi utama terletak pada folder `lib/` dan terdiri dari:

- **`main.dart`**: Entry point aplikasi yang mengimpor package global state dan menggunakan `ChangeNotifierProvider` untuk mengelola state global dengan provider. Aplikasi ini menampilkan daftar counter yang dapat diubah oleh pengguna.
- **`color_picker.dart`**: Berisi dialog untuk memilih warna yang akan digunakan pada counter.

### 3. **Dependencies**

Aplikasi ini menggunakan beberapa dependencies, termasuk:
- `provider: ^6.0.5` untuk mengelola state global.
- `flutter: sdk` untuk membangun UI dan interaksi.

### 4. **Struktur File**

  ```vbnet
chaiden_flutter-provider/
├── global_state/
│   ├── lib/
│   │   ├── counter_data.dart
│   │   └── global_state.dart
│   └── test/
│       └── global_state_test.dart
├── lib/
│   ├── color_picker.dart
│   └── main.dart
└── pubspec.yaml
  ```


## Fitur Aplikasi

1. **Global State Management**:
   - Menggunakan `ChangeNotifier` untuk mengelola state global.
   - `GlobalState` mengelola daftar counter dan mendukung fungsionalitas untuk menambah, menghapus, dan mengubah nilai serta label dari setiap counter.

2. **UI Interaktif**:
   - Pengguna dapat menambahkan counter baru dengan menekan tombol floating action button (FAB).
   - Pengguna dapat mengubah nilai counter, label, dan warna melalui interaksi pada UI.
   - Setiap counter dapat dipindahkan dengan fitur reorderable list.

3. **Dialog Pemilih Warna**:
   - Menyediakan dialog untuk memilih warna bagi setiap counter menggunakan `BlockPicker`.

4. **Animasi dan Desain Modern**:
   - Menggunakan animasi untuk transisi item dalam daftar dan efek bayangan untuk meningkatkan pengalaman pengguna.

## Cara Menjalankan Aplikasi

1. Clone atau unduh proyek ini ke dalam direktori lokal Anda.
2. Buka terminal dan navigasikan ke direktori proyek.
3. Jalankan perintah berikut untuk menginstall dependencies:
 ```bash
    flutter pub get
  ``` 
4. Setelah itu, jalankan aplikasi dengan perintah:
  ```bash
    flutter run
  ```


## Penggunaan

1. **Menambah Counter**: Tekan tombol "Add Counter" untuk menambah counter baru.
2. **Mengubah Label**: Ketik pada field label dan tekan enter untuk memperbarui label.
3. **Mengubah Nilai**: Gunakan tombol `+` dan `-` untuk menambah atau mengurangi nilai counter.
4. **Menghapus Counter**: Tekan tombol `Delete` untuk menghapus counter.
5. **Mengubah Warna**: Tekan tombol warna untuk membuka dialog pemilih warna dan pilih warna yang diinginkan.

## Catatan

- Aplikasi ini menggunakan `ReorderableListView` untuk memungkinkan pengguna menyusun ulang urutan counter.
- Warna dan label setiap counter disimpan dalam `GlobalState` dan diperbarui menggunakan `ChangeNotifier`.
