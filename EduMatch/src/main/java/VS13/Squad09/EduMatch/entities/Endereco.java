package VS13.Squad9.EduMatch.entities;

import VS13.Squad9.EduMatch.entities.enums.TipoDeEndereco;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Endereco {

    private Integer id;
    private String logradouro;
    private Integer numero;
    private String complemento;
    private TipoDeEndereco tipo;
    private String cep;
    private String cidade;
    private String estado;
    private String pais;
    private Integer id_usuario;
    private Integer id_escola;
    private Integer id_empresa;
}