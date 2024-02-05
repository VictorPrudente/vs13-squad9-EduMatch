package VS13.Squad09.EduMatch.repositories;

import VS13.Squad09.EduMatch.entities.Endereco;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EnderecoRepository extends JpaRepository<Endereco, Integer> {
}
