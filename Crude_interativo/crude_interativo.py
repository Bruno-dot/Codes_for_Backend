class Usuario:
    def __init__(self, id, nome):
        self.id = id
        self.nome = nome

    def __repr__(self):
        return f"Usuario(id={self.id}, nome={self.nome})"


usuarios = []
proximo_id = 1




def criar_usuario(nome):

    global proximo_id
    novo_usuario = Usuario(proximo_id, nome)
    usuarios.append(novo_usuario)
    proximo_id += 1

    print(f"Usuário '{nome}' criado com ID {novo_usuario.id}.")
    return novo_usuario


def ler_usuarios():
    
    if not usuarios:
        print("Nenhum usuário cadastrado ainda.")
    else:
        for usuario in usuarios:
            print(usuario)


def atualizar_usuario(id_do_usuario, novo_nome):

    for usuario_na_lista in usuarios:
        if usuario_na_lista.id == id_do_usuario:
            usuario_na_lista.nome = novo_nome
            print(f"Usuário com ID {id_do_usuario} atualizado para '{novo_nome}'.")
            return usuario_na_lista
        
    print(f"Usuário não encontrado.")

    return None


def deletar_usuario(id_do_usuario):
 
    usuario_a_deletar = None

    for u in usuarios:
        if u.id == id_do_usuario:
            usuario_a_deletar = u
            break 

    if usuario_a_deletar:
        usuarios.remove(usuario_a_deletar)
        print(f"Usuário foi deletado.")
        return usuario_a_deletar
    
    else:
        print(f"Usuário não encontrado..")
        return None



def exibir_menu():
   
    print("1. Criar Usuário")
    print("2. Ver Usuários")
    print("3. Atualizar Usuário")
    print("4. Deletar Usuário")
    print("5. Sair")
    

def main():

    while True:

        exibir_menu()
        escolha = input("Escolha uma opção: ")

        if escolha == '1':
            nome = input("Digite o nome do novo usuário: ")
            criar_usuario(nome)

        elif escolha == '2':
            ler_usuarios()

        elif escolha == '3':
            try:
                id_atualizar = int(input("Digite o ID do usuário para atualizar: "))
                novo_nome = input("Digite o novo nome para o usuário: ")
                atualizar_usuario(id_atualizar, novo_nome)

            except ValueError:
                print("ID inválido. Por favor, digite um número.")

        elif escolha == '4':
            try:
                id_deletar = int(input("Digite o ID do usuário para deletar: "))
                deletar_usuario(id_deletar)

            except ValueError:
                print("ID inválido. Por favor, digite um número.")

        elif escolha == '5':
            print("Saindo do sistema. Até mais!")
            break # Sai do loop while

        else:
            print("Opção inválida. Por favor, escolha um número de 1 a 5.")


if __name__ == "__main__":
    main()
