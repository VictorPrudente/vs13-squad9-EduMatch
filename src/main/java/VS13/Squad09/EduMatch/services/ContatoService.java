package VS13.Squad09.EduMatch.services;

import VS13.Squad09.EduMatch.dtos.mapper.ContatoMapper;
import VS13.Squad09.EduMatch.dtos.request.ContatoCreateDTO;
import VS13.Squad09.EduMatch.dtos.response.ContatoDTO;
import VS13.Squad09.EduMatch.entities.Contato;
import VS13.Squad09.EduMatch.exceptions.NaoEncontradoException;
import VS13.Squad09.EduMatch.exceptions.RegraDeNegocioException;
import VS13.Squad09.EduMatch.repositories.ContatoRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ContatoService {

    private final ContatoRepository contatoRepository;
    private final UsuarioService usuarioService;
    private final ContatoMapper contatoMapper;

    public ContatoDTO salvar(Integer id, ContatoCreateDTO contatoCreateDTO) throws Exception {
        usuarioService.listarPorId(id);


            Contato contatoEntity = contatoMapper.toEntity(contatoCreateDTO);

            return contatoMapper.toDto(contatoRepository.save(contatoEntity));
    }

    public ContatoDTO atualizar(Integer id, ContatoCreateDTO contatoCreateDTO) throws Exception {
        findByIdContato(id);

        Contato contatoEntity = contatoMapper.toEntity(contatoCreateDTO);

        return contatoMapper.toDto(contatoRepository.save(contatoEntity));
    }

    public void deletar(Integer id) throws Exception {
        contatoRepository.delete(obterContatoPorId(id));
    }

    public ContatoDTO findByIdContato(Integer id) throws Exception{
        return contatoMapper.toDto(obterContatoPorId(id));
    }

    public ContatoDTO findContatoByUsuarioId(Integer idUsuario) throws Exception{
        if (returnContatoByIdUsuario(idUsuario) == null){
            throw new NaoEncontradoException("O contato é nulo!");
        }
        return contatoMapper.toDto(returnContatoByIdUsuario(idUsuario));
    }

    private Contato obterContatoPorId(Integer id) throws Exception {
        return contatoRepository.findById(id)
                .orElseThrow(() -> new NaoEncontradoException("Id informado não pertence a um contato válido!"));
    }

    private Contato returnContatoByIdUsuario(Integer idUsuario) throws NaoEncontradoException {
        return contatoRepository.findAll()
                .stream()
                .filter(contato -> contato.getUsuario().getIdUsuario().equals(idUsuario))
                .findFirst()
                .orElseThrow(() -> new NaoEncontradoException("Usuário informado não possui endereço!"));
    }
}
