# encoding: UTF-8
require File.join(File.expand_path(File.dirname(__FILE__)), "test_helper.rb")

class FeriadoParserTest < ActiveSupport::TestCase
  
  FERIADO_YML_PATH = File.expand_path(File.dirname(__FILE__) + '/../lib/brdata/config')
  NATAL = Feriado.new("natal", 25, 12)
  
  test "Feriados" do
    feriados, metodos = FeriadoParser.parser(FERIADO_YML_PATH)
    feriados.each {|feriado| assert_kind_of Feriado, feriado}
    assert_equal NATAL, feriados.find {|f| f.nome == "natal"}
    assert metodos.include?( "pascoa") 
    assert metodos.include?( "corpus_christi")
  end
  
  test "Feriados quando path não é diretório" do
    assert_raise  FeriadoParserDiretorioInvalidoError do
      FeriadoParser.parser(File.dirname(__FILE__) + 'dinheiro_test.rb')  
    end
  end
  
  test "Feriados quando path não contem arquivos" do
    assert_raise  FeriadoParserDiretorioVazioError do
      FeriadoParser.parser(File.dirname(__FILE__))  
    end
  end
  
end
