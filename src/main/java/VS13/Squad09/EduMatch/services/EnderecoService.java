//package VS13.Squad09.EduMatch.services;
//
//
//import VS13.Squad09.EduMatch.dtos.mapper.EnderecoMapper;
//import VS13.Squad09.EduMatch.dtos.request.ContatoCreateDTO;
//import VS13.Squad09.EduMatch.dtos.request.EnderecoCreateDTO;
//import VS13.Squad09.EduMatch.dtos.response.ContatoDTO;
//import VS13.Squad09.EduMatch.dtos.response.EnderecoDTO;
//import VS13.Squad09.EduMatch.dtos.response.UsuarioDTO;
//import VS13.Squad09.EduMatch.entities.Contato;
//import VS13.Squad09.EduMatch.entities.Endereco;
//import VS13.Squad09.EduMatch.entities.Usuario;
//import VS13.Squad09.EduMatch.entities.enums.TipoDeEndereco;
//import VS13.Squad09.EduMatch.exceptions.BancoDeDadosException;
//import VS13.Squad09.EduMatch.exceptions.NaoEncontradoException;
//import VS13.Squad09.EduMatch.exceptions.RegraDeNegocioException;
//import VS13.Squad09.EduMatch.repositories.EnderecoRepository;
//import com.fasterxml.jackson.databind.ObjectMapper;
//import lombok.RequiredArgsConstructor;
//import org.springframework.stereotype.Service;
//
//import java.util.List;
//import java.util.stream.Collectors;
//
//
//@Service
//@RequiredArgsConstructor
//public class EnderecoService {
//
//    private final EnderecoRepository enderecoRepository;
//    private final UsuarioService usuarioService;
//    private final EnderecoMapper enderecoMapper;
//
//    public EnderecoDTO salvar(Integer id, EnderecoCreateDTO enderecoCreateDTO) throws Exception {
//        usuarioService.listarPorId(id);
//
//        if(returnEnderecoByIdUsuario(id) != null) {
//            throw new RegraDeNegocioException("Usuário já possui um endereço cadastrado.");
//        }
//
//        Endereco enderecoEntity = enderecoMapper.toEntity(enderecoCreateDTO);
//
//        return enderecoMapper.toDto(enderecoRepository.save(enderecoEntity));
//    }
//
//    public EnderecoDTO atualizar(Integer id, EnderecoCreateDTO enderecoCreateDTO) throws Exception {
//        findByIdEndereco(id);
//
//        Endereco enderecoEntity = enderecoMapper.toEntity(enderecoCreateDTO);
//
//        return enderecoMapper.toDto(enderecoRepository.save(enderecoEntity));
//    }
//
//    public void deletar(Integer id) throws Exception {
//        enderecoRepository.delete(obterEnderecoPorId(id));
//    }
//
//    public EnderecoDTO findByIdEndereco(Integer id) throws Exception{
//        return enderecoMapper.toDto(obterEnderecoPorId(id));
//    }
//
//    public EnderecoDTO findEnderecoByUsuarioId(Integer idUsuario) throws Exception{
//        if (returnEnderecoByIdUsuario(idUsuario) == null){
//            throw new NaoEncontradoException("O endereço é nulo!");
//        }
//        return enderecoMapper.toDto(returnEnderecoByIdUsuario(idUsuario));
//    }
//
//    private Endereco obterEnderecoPorId(Integer id) throws Exception {
//        return enderecoRepository.findById(id)
//                .orElseThrow(() -> new NaoEncontradoException("Id informado não pertence a um endereço válido!"));
//    }
//
//    private Endereco returnEnderecoByIdUsuario(Integer idUsuario) {
//        return enderecoRepository.findEnderecoByUsuarioId(idUsuario);
//    }
//
//}