// Funcao para validar numeros de cpf.
// Criado por Iuri Andrei Guntchnigg & Valtoir Jardim em 13/01/2004.
/// Email: iuri@sapiranga.rs.gov.br; valtoir@sapiranga.rs.gov.br
//// O Codigo a seguir eh regido sob a licenca GPL,podendo ser distribuido livremente desde que mantido os devidos //// //// creditos.
function chkcic(vcic){
   if (isNaN(vcic.value) || vcic.value.length != 11){
      alert("valores invalidos");
      return false;
   }
   for (var vdigpos = 10; vdigpos < 12; vdigpos++ ){
      var vdig = 0;
      var vpos = 0;
      for (var vfator = vdigpos;vfator >= 2; vfator-- ){
         vdig = eval(vdig + vcic.value.substr(vpos,1) * vfator);
         vpos++;
      }
      vdig  = eval(11 -(vdig % 11)) < 10 ? eval(11 - vdig % 11) : 0;
       if (vdig != eval(vcic.value.substr(vdigpos-1,1))) {
       alert("cpf falso");
         return false;
      } 
   }
   alert("cpf verdadeiro");
   return true;
}   
   
   
        
