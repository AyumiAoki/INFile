package model.bean;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import model.dao.BaseEntity;

/**
 *
 * @author rivail
 */
@Entity
@Table(name = "usuario")
public class Usuario implements BaseEntity, Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column
    private String nome;

    @Column
    private String matricula;

    @Column
    private String email;

    @Column
    private String regiao;

    @Column
    private String git;

    @Column
    private String lattes;

    @Column
    private String senha;

    @Column
    private String arquivo_imagem;

    @Column(length = 255, columnDefinition = "longblob")
    private byte[] bio;

    public String getArquivo_imagem() {
        return arquivo_imagem;
    }

    public void setArquivo_imagem(String arquivo_imagem) {
        this.arquivo_imagem = arquivo_imagem;
    }

    public byte[] getBio() {
        return bio;
    }

    public void setBio(byte[] bio) {
        this.bio = bio;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRegiao() {
        return regiao;
    }

    public void setRegiao(String regiao) {
        this.regiao = regiao;
    }

    public String getGit() {
        return git;
    }

    public void setGit(String git) {
        this.git = git;
    }

    public String getLattes() {
        return lattes;
    }

    public void setLattes(String lattes) {
        this.lattes = lattes;
    }

    public Usuario() {
    }
}
