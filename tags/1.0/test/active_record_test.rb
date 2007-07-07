require 'test_helper'
require File.expand_path(File.dirname(__FILE__) + "/../lib/active_record_portuguese")

class ActiveRecordTestable < ActiveRecord::Errors
  
  def self.default_error_messages
    @@default_error_messages
  end
  
end

class ActiveRecordTest < Test::Unit::TestCase
  
  # Replace this with your real tests.
  def test_this_plugin
    errors = ActiveRecordTestable.default_error_messages
    assert_equal "n�o est� inclu�do na lista", errors[:inclusion]  
    assert_equal "est� reservado", errors[:exclusion]  
    assert_equal "� inv�lido.", errors[:invalid]  
    assert_equal "n�o corresponde � confirma��o", errors[:confirmation]  
    assert_equal "deve ser aceito", errors[:accepted]  
    assert_equal "n�o pode estar vazio", errors[:empty]  
    assert_equal "n�o pode estar em branco", errors[:blank]  
    assert_equal "muito longo (m�ximo %d caracteres)", errors[:too_long]  
    assert_equal "muito curto (m�nimo %d caracteres)", errors[:too_short]  
    assert_equal "de comprimento errado (deveria ter %d caracteres)", errors[:wrong_length]  
    assert_equal "j� est� em uso", errors[:taken]  
    assert_equal "n�o � um n�mero", errors[:not_a_number]  
  end

end
