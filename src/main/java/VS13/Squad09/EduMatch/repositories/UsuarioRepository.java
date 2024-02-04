package VS13.Squad09.EduMatch.repositories;
import VS13.Squad09.EduMatch.dtos.*;
import VS13.Squad09.EduMatch.entities.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface UsuarioRepository extends JpaRepository<Usuario, Integer> {

    @Query(value = "SELECT * FROM VEM_SER.USUARIO u WHERE p.email = ?1", nativeQuery = true)
    Usuario listarPorEmail(String email);

    @Query(value = "SELECT * FROM VEM_SER.USUARIO u ORDER BY p.pontuacao DESC", nativeQuery = true)
    List <Usuario> rankearJogadores();

    @Query("""
            SELECT new VS13.Squad09.EduMatch.dtos.UsuarioCompletoRelatorioDTO(
                u.idUsuario, u.nome, u.email)
                from USUARIO u
                where u.idUsuario = :idUsuario
            """)
    UsuarioCompletoRelatorioDTO procurarUsuarioCompletoDTO(@Param("idUsuario") Integer idUsuario);

    @Query("""
            SELECT new VS13.Squad09.EduMatch.dtos.EnderecoRelatorioDTO(
              e.cep, e.cidade, e.estado, e.pais)
            FROM usuario u
            JOIN u.enderecos e
            WHERE u.idUsuario = :idUsuario""")
    EnderecoRelatorioDTO procurarEnderecos(@Param("idUsuario") Integer idUsuario);


    @Query("""
            SELECT new VS13.Squad09.EduMatch.dtos.ContatoRelatorioDTO(
                c.numero)
            FROM USUARIO u
            JOIN u.contatos c
            where u.idUsuario = :idUsuario""")
    ContatoRelatorioDTO procurarContatos(@Param("idUsuario") Integer idUsuario);

    @Query("""
            SELECT new VS13.Squad09.EduMatch.dtos.UsuarioECertificadoRelatorioDTO(
                u.idUsuario,  u.nome,  u.email)
            FROM USUARIO u
             where u.idUsuario = :idUsuario
            """)
    UsuarioECertificadoRelatorioDTO procurarUsuarioECertificadoDTO(@Param("idUsuario") Integer idUsuario);

    @Query("""
            SELECT new VS13.Squad09.EduMatch.dtos.CertificadoRelatorioDTO(
            ce.id_certificado, ce.trilha, ce.conclusao, ce.dificuldade)
            FROM USUARIO u
            JOIN u.certificados ce
            where u.idUsuario = :idUsuario
            """)
    List<CertificadoRelatorioDTO> procurarCertificado(@Param("idUsuario") Integer idUsuario);
}
