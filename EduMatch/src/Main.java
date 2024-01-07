import entities.*;
import entities.enums.Dificuldades;
import services.*;
import utils.Cadastro;
import utils.Menu;

import java.util.Random;
import java.awt.*;
import java.util.InputMismatchException;
import java.util.Locale;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {

        EscolaService escolaService = new EscolaService();
        UsuarioService usuarioService = new UsuarioService();
        SoftSkillService softSkillService = new SoftSkillService();
        EnderecoService enderecoService = new EnderecoService();
        EmpresaService empresaService = new EmpresaService();
        ContatoService contatoService = new ContatoService();
        PortuguesService portuguesService = new PortuguesService();
        MatematicaService matematicaService = new MatematicaService();
        Cadastro cadastro = new Cadastro();
        Random random = new Random();
        Menu menu = new Menu();
        Scanner sc = new Scanner(System.in);
        int opcao = 0;
        boolean execucao = true;
        String opcaoQuestao;


        System.out.println("BEM VINDOS AO EDUMATCH");


        Usuario usuario = cadastro.cadastrarUsuario(sc);
        usuarioService.salvar(usuario);

        System.out.println();
        System.out.println();

        while (execucao) {
            menu.menuPrincipal();
            System.out.print("Digite sua opção: ");
            opcao = sc.nextInt();
            sc.nextLine();

            switch (opcao) {
                //NOVO JOGO
                case 1: {
                    System.out.println();
                    menu.menuNovoJogo();
                    System.out.print("Digite sua opção: ");
                    opcao = sc.nextInt();
                    sc.nextLine();
                    switch (opcao) {
                        case 1: {
                            for (int i = 0; i<3; i++){
                                Portugues questao = portuguesService.listarPelaDificuldade(Dificuldades.valueOf(i)).get(random.nextInt(0, 2));
                                System.out.println(questao);

                                System.out.print("Opção: ");
                                opcaoQuestao = sc.nextLine().toUpperCase().trim();
                                menu.validarQuestao(opcaoQuestao, questao, usuario);
                            }
                            break;
                        }
                        case 2: {
                            for(int i = 0; i < 3; i++) {
                                Matematica questao = matematicaService.listarPelaDificuldade(Dificuldades.valueOf(i)).get(random.nextInt(0, 2));
                                System.out.println(questao);
                                System.out.print("Opção: ");
                                opcaoQuestao = sc.nextLine().toUpperCase().trim();

                                menu.validarQuestao(opcaoQuestao, questao, usuario);
                            }
                            break;
                        }
                        case 3: {
                            System.out.println();
                            for (int i = 0; i < 3; i++) {
                                SoftSkill questao = softSkillService.listarPelaDificuldade(Dificuldades.valueOf(i)).get(i);
                                System.out.println(questao);

                                System.out.print("Opção: ");
                                opcaoQuestao = sc.nextLine().toUpperCase().trim();


                                menu.validarQuestao(opcaoQuestao, questao, usuario);
                            }
                            break;
                        }
                    }
                    continue;
                }
                //RANKING
                case 2: {
                    menu.menuRanking();
                    System.out.print("Opção: ");
                    opcao = sc.nextInt();
                    switch (opcao) {
                        case 1: {
                            System.out.println();
                            System.out.println("Sua pontuação é de: " + usuario.getPontuacao());
                            continue;
                        }
                        case 2: {
                            usuarioService.rankearUsuarios();
                            System.out.println();
                            continue;
                        }
                        case 3: {
                            System.out.println("Retornando ao Menu Principal");
                            continue;
                        }
                        default: {
                            System.out.println("Opção Inválida!");
                        }
                    }
                }
                break;
                //OPÇÕES
                case 3: {
                    menu.menuOpcoes();
                    System.out.print("Opção: ");
                    opcao = sc.nextInt();
                    sc.nextLine();

                    switch (opcao) {
                        case 1: {
                            menu.menuEndereco();
                            System.out.print("Opção: ");
                            opcao = sc.nextInt();
                            sc.nextLine();
                            switch (opcao){
                                case 1:{
                                    System.out.println();
                                    System.out.println("ENDEREÇOS CADASTRADOS");
                                    for (Endereco endereco : usuario.getEnderecos()) {
                                        System.out.println(endereco);
                                    }
                                    continue;
                                }
                                case 2:{
                                    System.out.println();

                                    System.out.println("CADASTRO DE UM NOVO ENDEREÇO");
                                    Endereco endereco = cadastro.cadastrarEndereco(sc);
                                    usuario.addEnderecos(endereco);
                                    enderecoService.salvar(endereco);

                                    continue;
                                }
                                case 3:{
                                    //ATUALIZAR UM ENDEREÇO
                                    System.out.println("ATUALIZAR UM ENDEREÇO");
                                    for (Endereco endereco : usuario.getEnderecos()) {
                                        System.out.println(endereco);
                                    }
                                    System.out.print("Escolha um endereço pelo seu ID: ");
                                    int id = sc.nextInt();
                                    sc.nextLine();
                                    Endereco endereco = cadastro.cadastrarEndereco(sc);
                                    enderecoService.atualizar(id, endereco);
                                    break;
                                }
                                case 4:{
                                    //DELETAR UM ENDEREÇO
                                    System.out.println("DELETAR UM ENDEREÇO");
                                    for (Endereco endereco : usuario.getEnderecos()) {
                                        System.out.println(endereco);
                                    }
                                    System.out.print("Escolha um endereço pelo seu ID: ");
                                    int id = sc.nextInt();
                                    Endereco endereco = enderecoService.listarPorId(id);
                                    enderecoService.deletar(endereco);
                                    usuario.getEnderecos().remove(endereco);
                                    break;
                                }
                                case 5:{
                                    continue;
                                }
                            }
                            continue;
                        }
                        case 2: {
                            //Contatos
                            menu.menuContato();
                            System.out.print("Opção: ");
                            opcao = sc.nextInt();
                            sc.nextLine();

                            switch (opcao){
                                case 1:{
                                    System.out.println();
                                    System.out.println("CONTATOS CADASTRADOS");
                                    for(Contato contato : usuario.getContatos()){
                                        System.out.println(contato);
                                    }
                                    System.out.println();
                                    continue;
                                }
                                case 2:{
                                    Contato contato = cadastro.cadastrarContato(sc);
                                    usuario.addContatos(contato);
                                    contatoService.salvar(contato);
                                    break;
                                }
                                case 3:{
                                    System.out.println("Escolha o ID do contato a ser atualizado: ");
                                    for(Contato contato : usuario.getContatos()){
                                        System.out.println(contato);
                                    }
                                    System.out.print("Opção: ");
                                    opcao = sc.nextInt();
                                    sc.nextLine();
                                    Contato contato = contatoService.listarPorId(opcao);
                                    Contato contatoAtualizado = cadastro.cadastrarContato(sc);
                                    contatoService.atualizar(opcao, contato);
                                    usuario.getContatos().remove(contato);
                                    usuario.addContatos(contatoAtualizado);
                                    break;
                                }
                                case 4:{
                                    System.out.println("Escolha o ID do contato a ser deletado: ");
                                    for(Contato contato : usuario.getContatos()){
                                        System.out.println(contato);
                                    }
                                    System.out.print("Opção: ");
                                    opcao = sc.nextInt();
                                    Contato contato = contatoService.listarPorId(opcao);
                                    usuario.getContatos().remove(contato);
                                    contatoService.deletar(contato);
                                }
                                case 5:{
                                    continue;
                                }
                                default:
                                    System.out.println("Opção inválida.");
                            }
                            continue;
                        }
                        case 3: {
                            menu.menuEscola();
                            System.out.print("Opção: ");
                            opcao = sc.nextInt();
                            sc.nextLine();
                            switch (opcao){
                                case 1:{
                                    escolaService.listarTodos();
                                    continue;
                                }
                                case 2:{
                                    escolaService.listarTodos();
                                    System.out.print("Escolha o ID de uma escola para se cadastrar (0 caso não tenha na lista): ");
                                    opcao = sc.nextInt();
                                    sc.nextLine();
                                    if (opcao == 0){
                                        Escola escola = cadastro.cadastrarEscola(sc);
                                        escolaService.salvar(escola);
                                        usuario.setEscola(escola);
                                    } else {
                                        Escola escola = escolaService.listarPorId(opcao);
                                        usuario.setEscola(escola);
                                    }
                                    continue;
                                }
                                case 3:{
                                }
                                case 4:{
                                    System.out.println("Voltando ao menu principal.");
                                    continue;
                                }

                            }
                            continue;
                        }
                        case 4: {
                                switch (opcao) {
                                    case 1: {
                                        //TODO Listar certificados
                                        break;
                                    }
                                    case 2: {
                                        //TODO Listar ultimo certificado adquirido
                                        break;
                                    }
                                    case 3: {
                                        System.out.println("Voltar ao menu opções.");
                                        break;
                                    }
                                    default: {
                                        System.out.println("Opção não implementada! Aguarde futuras atualizações :)");
                                    }
                                }
                            break;
                        }
                        case 5: {
                            System.out.println(usuario.imprimirDados());
                            continue;
                        }
                        case 6: {
                            empresaService.listarTodos();
                            break;
                        }
                        case 7: {
                            System.out.println("Retornar ao Menu Principal");
                            break;
                        }
                        default: {
                            System.out.println("Opção Inválida!");
                        }
                    }

                    break;
                }
                case 4: {
                    System.out.println("Finalizando a aplicação. Até logo!");
                    execucao = false;
                    break;
                }
                default: {
                    System.out.println("Opção Inválida!");
                }
                break;
            }
        }
    }
}