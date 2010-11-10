# encoding: UTF-8
require "test_helper.rb"

class BrcepTest < ActiveSupport::TestCase

  test "BrCep should accept a configuration block" do
    assert BrCep.respond_to?("setup") 
  end 

  test "Assert the block yields self" do
    BrCep.setup do |config|
      assert_equal config, BrCep
    end
  end

  test "Should have a method called proxy_address= and proxy_address" do
    assert_respond_to BrCep ,"proxy_address="
    assert_respond_to BrCep ,"proxy_address"
  end

  test "Should have a method called proxy_port= and proxy_port" do
    assert_respond_to BrCep ,"proxy_port="
    assert_respond_to BrCep ,"proxy_port"
  end
  
  test "Should have a method called cep_invalido and cep_invalido=" do
    assert_respond_to BrCep ,"cep_invalido"
    assert_respond_to BrCep ,"cep_invalido="
  end
  
  test "Should have a method called servico_indisponivel and servico_indisponivel=" do
    assert_respond_to BrCep ,"servico_indisponivel"
    assert_respond_to BrCep ,"servico_indisponivel="
  end
  
end
