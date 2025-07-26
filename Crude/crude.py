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
            print(f"Usuário com ID {id_do_usuario} atualizado para {novo_nome}.")
            return usuario_na_lista
        
    print(f"Usuário com ID {id_do_usuario} não encontrado para atualizar.")
    return None


def deletar_usuario(id_do_usuario):

    usuario_a_deletar = next((u for u in usuarios if u.id == id_do_usuario), None)

    if usuario_a_deletar:
        usuarios.remove(usuario_a_deletar)
        print(f"Usuário com ID {id_do_usuario} ({usuario_a_deletar.nome}) foi deletado.")
        return usuario_a_deletar
    
    else:
        print(f"Usuário com ID {id_do_usuario} não encontrado para deletar.")
        return None



usuario1 = criar_usuario("Maria Clara")
print(f"Criado: {usuario1}")

usuario2 = criar_usuario("Paulo Gustavo")
print(f"Criado: {usuario2}")

usuario3 = criar_usuario("Fernanda Silva")
print(f"Criado: {usuario3}")

ler_usuarios()


usuario_atualizado = atualizar_usuario(1, "Ana Clara")
if usuario_atualizado:
    print(f"Detalhes do usuário atualizado: {usuario_atualizado}")

ler_usuarios()

print("\n3. Tentando atualizar um usuário que não existe (ID 99):")
atualizar_usuario(99, "Usuário Inexistente")

print("\n4. Deletando o usuário com ID 2 (Paulo Gustavo):")
usuario_deletado = deletar_usuario(2)
if usuario_deletado:
    print(f"Detalhes do usuário deletado: {usuario_deletado}")

ler_usuarios()

print("\n5. Tentando deletar um usuário que não existe (ID 5):")
deletar_usuario(5)


