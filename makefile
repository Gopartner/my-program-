# Makefile untuk proyek Node.js

# Nama berkas utama dan direktori sumber
MAIN_FILE := src/index.js
SRC_DIR := src

# Nama direktori node_modules
NODE_MODULES_DIR := node_modules

# Nama berkas konfigurasi
CONFIG_FILE := config/config.js

# Nama berkas output
OUTPUT_FILE := build/app.js

# Pilihan node.js yang akan digunakan
NODE := node

# Pilihan perintah npm yang akan digunakan
NPM := npm

# Perintah default saat hanya menjalankan 'make' di terminal
.PHONY: default
default: install run

# Target untuk menginstal dependensi
.PHONY: install
install:
	$(NPM) install

# Target untuk menjalankan program
.PHONY: run
run:
	$(NODE) $(MAIN_FILE)

# Target untuk membersihkan proyek
.PHONY: clean
clean:
	rm -rf $(NODE_MODULES_DIR)
	rm -rf $(OUTPUT_FILE)

# Target untuk menampilkan bantuan
.PHONY: help
help:
	@echo "Targets yang tersedia:"
	@echo "  install   : Menginstal dependensi"
	@echo "  run       : Menjalankan program"
	@echo "  clean     : Membersihkan proyek"
	@echo "  help      : Menampilkan bantuan"

# Target default jika tidak ada target yang diberikan
.PHONY: .DEFAULT
.DEFAULT:
	@echo "Gunakan 'make help' untuk menampilkan bantuan"
 
