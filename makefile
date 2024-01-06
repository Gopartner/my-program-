# Nama branch yang akan digunakan
BRANCH := Master

# Mendapatkan nomor urut dari commit terakhir
COMMIT_NUMBER := $(shell git rev-list --count HEAD)

# Mendapatkan tanggal hari ini
TODAY := $(shell date +"%Y-%m-%d")

# Target untuk menginstal dependensi
.PHONY: install
install:
	npm install

# Target untuk menjalankan program
.PHONY: run
run:
	node src/index.js

# Target untuk membersihkan proyek
.PHONY: clean
clean:
	rm -rf node_modules

# Target untuk menjalankan semua langkah setelah selesai ngoding
.PHONY: finish
finish:
	@git add .
	@git commit -m "Perubahan otomatis di loval (#$(COMMIT_NUMBER)) [$(TODAY)]"
	@git push -u origin $(BRANCH)
	@echo "Proses selesai."

# Target untuk menjalankan Git Actions
.PHONY: git-actions
git-actions: add commit push
	@echo "Git Actions selesai."

# Target default saat hanya menjalankan 'make' di terminal
.PHONY: default
default: install run

# Target untuk menampilkan bantuan
.PHONY: help
help:
	@echo "Targets yang tersedia:"
	@echo "  install   : Menginstal dependensi"
	@echo "  run       : Menjalankan program"
	@echo "  clean     : Hapus folder node_modules"
	@echo "  finish    : Menjalankan git [add,commit,push]"
	@echo "  help      : Menampilkan bantuan"

# ...

