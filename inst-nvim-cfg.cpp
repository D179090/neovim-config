#include <iostream>
#include <cstdlib>
#include <fstream>

using namespace std;

int main(){
		cout << "Вы хотите установить конфиг neovim? (yes or no)" << endl;
		string a;
		cin >> a;
		if  (a == "yes"){
				system("git clone https://github.com/D179090/neovim-config");
				system("cd && sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' && cd neovim-config")
				system("mv neovim-config/vimrc neovim-config/.vimrc");
				system("mkdir -p $HOME/.config/nvim");
				system("mv /neovim-config/.vimrc $HOME/.config/nvim/");
				system("mv /neovim-config/init.vim $HOME/.config/nvim/");
				cout << "Теперь запустите nvim и введите команду Plug-install" << endl;
				cout << "На этом всё спасибо за установку" << endl;
		}
		if (a == "no"){
				cout << "Выход" << endl;
		}

}
