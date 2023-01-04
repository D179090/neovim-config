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
				system("mv vimrc .vimrc");
				system("mkdir -p .config/nvim");
				system("mv neovim-config/.vimrc .config/nvim/");
				system("mv neovim-config/init.vim .config/nvim/");
				cout << "Теперь запустите nvim и введите команду Plug-install" << endl;
				cout << "На этом всё спасибо за установку" << endl;
		}
		if (a == "no"){
				cout << "Выход" << endl;
		}

}
