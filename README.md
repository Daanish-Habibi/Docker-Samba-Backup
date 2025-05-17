# Docker-Samba-Storage

A lightweight, low-power home storage solution built with Docker. This project provides:
- A cross-platform **Samba file server** for Android, iOS, and desktop access
- An **automated backup system** that watches for new or changed files and syncs them to an optional second drive (e.g., M.2 SSD)

Designed for always-on, low-resource environments (like repurposed desktops or mini PCs), this setup helps you manage local storage without the cloud — while optionally backing up files in near real-time.

---
## Instructions

- **Modify the following files to include the proper user information:**

  #### `config.txt`

  - **Basic idea for `-u`** → `user_name;password`
    - Sets up a Samba user with username and password

  - **Basic idea for `-s`** → `share_name;path;browseable;readonly;guest;user_list`
    - `share_name` — name of the shared folder (what shows on the network)
    - `path` — the path to the folder you want to share
    - `browseable` — `yes` or `no`; whether it appears in network folder list
    - `readonly` — `yes` (read-only) or `no` (read/write)
    - `guest` — `yes` allows access with no login; `no` requires user
    - `user_list` — comma-separated usernames (must match ones defined with `-u`)

- **Run the stack** (remove `all` if you don’t need the backup sync service):

  ```bash
  bash start.sh all


## 📦 Stack

| Component     | Purpose                        |
|---------------|--------------------------------|
| `dperson/samba` | Handles Samba file sharing      |
| `Alpine Linux`  | Lightweight base image         |
| `inotify-tools` | Watches for file system events |
| `rsync`         | Performs efficient backup sync |
| `bash`          | Logic layer for watching/syncing |

---


