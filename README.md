# Docker-Samba-Storage

# Samba Backup Watcher

A lightweight, low-power home storage solution built with Docker. This project provides:
- A cross-platform **Samba file server** for Android, iOS, and desktop access
- An **automated backup system** that watches for new or changed files and syncs them to an optional second drive (e.g., M.2 SSD)

Designed for always-on, low-resource environments (like repurposed desktops or mini PCs), this setup helps you manage local storage without the cloud — while optionally backing up files in near real-time.

---

## 🔧 Features

- 🧠 **Simple architecture** using `docker-compose`
- 🗃 **Samba server** container with customizable user/share access
- 🔁 **Bash-based watcher** that detects file changes using `inotifywait`
- 💾 **Automatic backup** to a second mounted drive using `rsync`
- 🔋 **Low power & CPU usage** — ideal for 24/7 operation
- ✅ Easy to customize, run, and share

---

## 📦 Stack

| Component     | Purpose                        |
|---------------|--------------------------------|
| `dperson/samba` | Handles Samba file sharing      |
| `Alpine Linux`  | Lightweight base image         |
| `inotify-tools` | Watches for file system events |
| `rsync`         | Performs efficient backup sync |
| `bash`          | Logic layer for watching/syncing |

---

## 📁 Folder Structure

