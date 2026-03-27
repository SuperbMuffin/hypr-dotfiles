# My Personal Dotfiles

These are my personal dotfiles. Don't expect much!  

Managed using [GNU Stow](https://www.gnu.org/software/stow/). To apply them, just run:

**Warning**: Make sure to run the stow command from the root of the Project, e.g. from ~/dotfiles

~~~bash
stow <folder-name>
~~~

---

## Clone & Setup

1. Clone the repo to your home directory (or wherever you keep dotfiles):

~~~bash
git clone https://github.com/SuperbMuffin/hypr-dotfiles.git ~/hypr-dotfiles
cd ~/hypr-dotfiles
~~~

2. Use Stow to link your dotfiles:

**Warning**: Make sure to run the stow command from the root of the Project, e.g. from ~/dotfiles

~~~bash
stow <folder-name>
~~~

Replace `<folder-name>` with the name of the directory you want to deploy (e.g., `nvim`, `hyprland`, etc.).  

---

Enjoy!
