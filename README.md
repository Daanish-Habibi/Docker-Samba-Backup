# Docker-Samba-Storage

A lightweight, low-power home storage solution built with Docker. This project provides:
- A cross-platform **Samba file server** for Android, iOS, and desktop access
- An **automated backup system** that watches for new or changed files and syncs them to an optional second drive (e.g., M.2 SSD)

Designed for always-on, low-resource environments (like repurposed desktops or mini PCs), this setup helps you manage local storage without the cloud — while optionally backing up files in near real-time.

---
## Instructions
- modify the following files to include the proper user information
    - config.txt
        - basic idea for -u → `user_name;password`
            - setting up a use account with name and password
        - basic idea for -s → `share_name;path;browseable;readonly;guest;user_list`
            - share_name = name of the shared folder
            - path = path to storage
            - browseable = boolean for does it show in network directory
            - readonly = boolean for reading content or read/write
            - guest = allow guest access meaning no login required
            - users = comma separated list of usernames setup with -u
- run (remove `all` if you dont need backup hard drive)
    - `bash script.sh all`


## 📦 Stack

| Component     | Purpose                        |
|---------------|--------------------------------|
| `dperson/samba` | Handles Samba file sharing      |
| `Alpine Linux`  | Lightweight base image         |
| `inotify-tools` | Watches for file system events |
| `rsync`         | Performs efficient backup sync |
| `bash`          | Logic layer for watching/syncing |

---


