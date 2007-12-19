#$: << File.dirname(__FILE__) + '/..' << File.dirname(__FILE__) + '/../lib'
#%w(test/unit rubygems init mocha).each { |lib| require lib }
require File.dirname(__FILE__) + '/test_helper'

class Carteira < ActiveRecord::Base
  
  usar_como_dinheiro :saldo
  
end

class DinheiroActiveRecordTest < Test::Unit::TestCase
  
  def setup
    @carteira = Carteira.new
  end
  
  def teste_se_aceita_dinheiro
    @carteira.saldo = 8.reais
    assert @carteira.save
    assert_equal 8.reais, @carteira.saldo
  end

  def teste_se_aceita_numero
    @carteira.saldo = 30
    assert @carteira.save
    assert_equal 30.reais, @carteira.saldo
  end
  
  def teste_se_rejeita_valor_invalido
    @carteira.saldo = 30
    assert @carteira.save
    @carteira.saldo = 'bla'
    assert_nil @carteira.saldo
    assert !@carteira.save
    assert_equal "O valor deve estar preenchido e no formato correto. Ex.: 100.00 .", @carteira.errors['saldo']    
  end
  
  def teste_se_trata_nulo_corretamente
    assert_nil @carteira.saldo
    @carteira.saldo = nil
    assert_nil @carteira.saldo
    @carteira.save
    assert_nil @carteira.saldo
  end

end
