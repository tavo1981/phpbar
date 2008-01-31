<?
class PrintLPT1 {

    function PrintLPT1() {
    }

    // Abre a porta lpt1, ou outra porta que aceite ser aberta
    // para escrita ou pode ser passado um arquivo de texto para teste.
    function abrirPorta($strPorta="LPT1:") {

        $fp = fopen($strPorta,"w");

        return $fp;
    }

    // Reseta a configuracao geral da impressora Obs: Use Somente em casos realmente necess\uffffrios
    function resetImp(&$fp) {

        fwrite($fp, chr(27)."@");
    }

    //D\uffff um Salto de Formulario de acordo com o tamanho do Formul\uffffrio
    function formFeed(&$fp) {

        fwrite($fp, chr(12));
    }

    // Salto de Linha Obs: Geralmente usado no final da impress\uffffo de uma linha
    function lineFeed(&$fp) {

        fwrite($fp, chr(10));
    }

    // Passada Dupla Obs: Deixa o Texto com apar\uffffncia de Negrito
    function passadaDupla(&$fp) {

        fwrite($fp, chr(27)."G");
    }

    // Espacamento entre linhas de 1/6
    function space1_6(&$fp) {

        fwrite($fp, chr(27)."2");
    }

    // Espacamento entre linhas de 1/8
    function space1_8(&$fp) {

        fwrite($fp, chr(27)."0");
    }

    // Espacamento entre linhas de 7/72
    function space7_72(&$fp) {

        fwrite($fp, chr(27)."1");
    }

    // Define o tamanho do formulario em linhas
    function setNumPageLinePol(&$fp, $numLine) {

        fwrite($fp, chr(27)."C".chr($numLine));
    }

    // Ativa a impressao com caracter normal
    function caracterNormalOn(&$fp) {

        fwrite($fp, chr(18));
    }

    // Ativa a impressao com caracter condensado (comprimido)
    function condensedOn(&$fp) {

        fwrite($fp, chr(15));
    }

    // Imprime uma string de texto
    function imprimir(&$fp, $string) {

        fwrite($fp, $string);
    }

    // Fecha a porta LPT1
    function fecharPorta(&$fp) {

        fclose($fp);
    }

}

?>