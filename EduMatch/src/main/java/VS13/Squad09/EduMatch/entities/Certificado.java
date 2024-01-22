package VS13.Squad9.EduMatch.entities;

import VS13.Squad9.EduMatch.entities.enums.Games;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class Certificado {

    private Games trilha;

    private LocalDateTime conclusao = LocalDateTime.now();

    private VS13.Squad9.EduMatch.entities.Usuario usuario;

    private Integer id;
}
