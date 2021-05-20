//SPDX-License-Identifier: GPL - 3.0
pragma solidity 0.8.4;


contract CompraeVenda {
    string public vendedor;
    string comprador;
    string objetoPrestacao;
    uint public valorPrestacao;
    uint public constant dataEsperadaAdimplemento = 5;
    
    
    constructor () {
        vendedor = "Vini :)";
        comprador = "Algum Idiota Podre de Rico";
        objetoPrestacao = "Foto do meu pezinho lindo";
        valorPrestacao = 500000;
        
        
    }
    
    function nomeDoComprador () public view returns (string memory) {
    return comprador;
    }
    
    function objetoDoContrato () public view returns (string memory) {
        return objetoPrestacao;
    }
    
    function pagouQuando (uint dataAdimplemento) 
    public
    pure
    returns(bool resposta) {
        if (dataAdimplemento <= dataEsperadaAdimplemento) {
        return true;
    }
        else { return false;
        }
    
    //Acredito que em um contrato tão simples o bool apenas seria útil se eu integrasse uma resposta automática a constatação "false"
    
    }
    
    function prestacaoEmMora (uint diasEmMora, 
                        uint percentualMoraPorDia)
    public
    view

    returns (uint prestacaoComJurosDeMora) {
        prestacaoComJurosDeMora = valorPrestacao*percentualMoraPorDia;
        prestacaoComJurosDeMora = prestacaoComJurosDeMora*(diasEmMora);
        prestacaoComJurosDeMora = prestacaoComJurosDeMora/100;
        return prestacaoComJurosDeMora;
    }
    //a operação aqui é ((valorPrestacao*0,033%*(dias em mora))/100)
    /* Modifiquei(anteriormente) a estrutura do cálculo criando uma operação isolada para tornar fixo o percentual de mora por dia
    com o "uint percentual" e "percentualMoraPorDia = percentual/100", mas o compilador disse que isso implicaria em 
    uma modificação e, portanto pediu para que eu retirasse o view. Mantive o cálculo com um percentual inteiro ficto */
}
