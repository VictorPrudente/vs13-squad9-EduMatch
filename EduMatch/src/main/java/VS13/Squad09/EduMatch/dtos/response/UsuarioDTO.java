package VS13.Squad09.EduMatch.dtos.response;

import VS13.Squad09.EduMatch.entities.enums.Status;
import VS13.Squad09.EduMatch.entities.enums.TipoUsuario;
import VS13.Squad09.EduMatch.entities.enums.Role;
import VS13.Squad09.EduMatch.entities.enums.TipoEmpresa;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UsuarioDTO {
    private Integer id;
    private String nome;
    private String sobrenome;
    private String email;
    //@Hidden
    private String senha;
    private String CPF;
    private String CNPJ;
    private TipoUsuario tipoUsuario;
    private Role role;
    private Status status;
    private LocalDate dataNascimento;
    private Integer pontuacao;
    private TipoEmpresa tipoEmpresa;
}
