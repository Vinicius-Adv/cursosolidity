//SPDX-License-Identifier: CC-BY-4.0

pragma solidity 0.8.4;

/* Contrato apresentado para fins de avaliação dos requisitos mínimos;
trata-se de um mecanismo de bonificação promovido pelo dono de uma atividade empresarial qualquer;
vendedor que vende mais, recebe o bonus;
algumas estruturas estão obsoletas, mas é porque tive algumas ideias de automação do contrato que não consegui executar 
com o tempo que eu tinha, então optei por manter (maiorVenda, melhorVendedor e etc) para aprimorar depois. */


contract PrestacaoServico{
    
    uint public encerramentoVendas;
    uint public maiorVenda;
    address payable carteiraDono;
    address public carteiraVendedor;
    uint public bonus;
    
    constructor (
        uint duracaoDasVendas,
        address payable _carteiraDono) payable{
            encerramentoVendas = block.timestamp + duracaoDasVendas;
            carteiraDono = _carteiraDono;
            maiorVenda = msg.value;
            
            
        }
    
    struct Vendedor{
        string nome;
        uint valorArrecadado;
        address payable carteira;
       
    }
    
    struct Dono {
        address payable carteira;
    }
    
    modifier somenteDono {
        require (msg.sender == carteiraDono, "nanana, vc nao eh o dono");
        _;
        
    }
    
    
    
    mapping(address => Vendedor) public vendedores;
    
    
    //inserir aqui uma função simples para registrar vendedores
    
    Vendedor[] public ordemVendedores;
    
    //aqui também
    
    event atualizacaoBonus(uint bonus);
  
   
    function inserirBonus(uint bonusAtualizado)public payable somenteDono {
        bonus = bonusAtualizado;
    
    //Essa função injeta valor no contrato, certo? Não sei se domino isso direito
    emit atualizacaoBonus(bonusAtualizado);
    
    
    }
   
    
    event fimDoPeriodoDeVendas(address carteira, uint venda);
    
    
    function encerrarCompeticao() public somenteDono {
       
        require(block.timestamp >= encerramentoVendas);
       
        emit fimDoPeriodoDeVendas(carteiraVendedor, maiorVenda);

        carteiraDono.transfer(address(this).balance);
    }
    
    /* No caso, o dono faria a consulta dos vendedores registrados, e transferiria o valor
    armazenado no contrato para quem fizesse a maior venda. É esse o conceito? */
    
}
 

