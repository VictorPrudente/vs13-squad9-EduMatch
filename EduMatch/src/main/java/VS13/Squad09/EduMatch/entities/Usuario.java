package VS13.Squad09.EduMatch.entities;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Usuario {

    private Integer id;
    private String nome;
    private String sobrenome;
    private String email;
    private String senha;
    private String CPF;
    private Integer idEndereco;
    private Integer idContato;
    private Integer idade;
    private Integer pontuacao;
    private Integer idCertificado;
    private Integer idEscola;
    private Integer idEmpresa;
}
