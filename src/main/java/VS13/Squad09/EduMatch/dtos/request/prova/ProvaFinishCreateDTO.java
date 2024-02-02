package VS13.Squad09.EduMatch.dtos.request.prova;


import VS13.Squad09.EduMatch.entities.Resposta;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProvaFinishCreateDTO {

    @NotNull
    private Integer idUsuario;

    @NotNull
    @Size(min = 5, max = 5)
    private List<Resposta> respostas;

}
