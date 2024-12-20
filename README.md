# 🐧 Linux Dotfiles Configuration

Welcome to my **dotfiles** repository! 🎉 This repository is a collection of my personalized configurations, crafted to enhance productivity and streamline my Linux experience. Whether you're a beginner or a seasoned Linux user, you might find something useful here. 🚀

---

## 🌟 What's Inside?

Here's a glimpse of the configurations you can explore:

```
📂 dotfiles/
 ├── 📂 kitty/        # Kitty shell setup
 ├── 📂 tmux/         # Tmux session manager configs
 ├── 📂 hyprpaper/    # Hyprpaper wallpaper manager config
 ├── 📂 hyprland/     # Hyperland configuration files
 ├── 📂 waybar/       # Waybar status bar configuration
```

Each tool or plugin has its own directory containing relevant configuration files.

---

## 🚀 Getting Started

### 1. Clone the Repository

```bash
$ git clone https://github.com/juliencm-dev/dotfiles.git
$ cd dotfiles
```

### 2. Install GNU Stow

Ensure you have GNU Stow installed. It simplifies managing dotfiles by creating symbolic links.

```bash
$ sudo apt install stow    # For Debian-based systems
$ sudo pacman -S stow      # For Arch-based systems
```

### 3. Apply the Dotfiles Using Stow

Navigate to the `dotfiles/` directory and run the following command:

```bash
$ stow bash
$ stow vim
$ stow waybar
```

> 💡 **Pro Tip**: Each folder corresponds to a specific tool. Use `stow <folder_name>` to link the desired configuration.

---

## 🔧 Customizations

### Shell Configurations
- **`bash/`**: Custom `.bashrc` with aliases, environment variables, and prompt setup.

### Tools and Plugins
- **`hyprpaper/`**: Configuration for Hyprpaper wallpaper manager.
- **`waybar/`**: Custom Waybar status bar configurations.
- **`tmux/`**: Tailored `.tmux.conf` with custom key bindings and themes.

---

## 📦 Installation Scripts

This repository includes a setup script to simplify the process:

```bash
$ ./install.sh
```

The script will:
- Install required dependencies.
- Create symbolic links using Stow.
- Source the new configurations.

---

## 🤝 Contributions

Have suggestions or improvements? Feel free to:

1. Fork the repository.
2. Create a feature branch.
3. Submit a pull request.

---

## 🛡️ License

This repository is licensed under the [MIT License](LICENSE). Feel free to use and adapt the configurations.

---

## 📬 Contact

Have questions or feedback? Reach out to me at `youremail@example.com` or open an issue. 📩

---

_⭐ If you find these dotfiles useful, don’t forget to star this repository! ⭐_

---

