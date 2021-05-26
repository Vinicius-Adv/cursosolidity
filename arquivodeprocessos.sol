//SPDX-License-Identifier: NONE
pragma solidity 0.8.4;

contract arquivodeprocessos {
    
    mapping(string => string) public nomeClientes;
    
    //você pode nomear o arquivo com a ação de consulta que você quer realizar para não precisar criar uma função específica para isso
    
    function registrarProcesso (string memory cliente, string memory nomeProcesso) public {
        nomeClientes [cliente] = nomeProcesso;
    }
    
    
    string [] public agendaMensalDeDemandas;
    
    function demandaAtiva(string memory nomeDemanda) public {
        agendaMensalDeDemandas.push(nomeDemanda);
    }
    
    /* "agendaMensalDeDemanda" já abre uma caixa de consulta; a seguinte função seria redundante,
    mas é como se expressa a função implícita em sua plenitude */
   // function consultarOrdemDemanda(uint ordemDemanda) public view returns (string memory) {
       // return agendaMensalDeDemandas [ordemDemanda];
   // }
    

    
  
    
}
