# encoding: UTF-8

require File.join(File.expand_path(File.dirname(__FILE__)), "../test_helper.rb")

module BrNumeros
  module Generators
    module Tests
      class InstallGeneratorTest < Rails::Generators::TestCase
        tests BrNumeros::Generators::InstallGenerator
        destination File.expand_path(File.dirname(__FILE__), "tmp")
        setup :prepare_destination

        test "Verifica se o generator efetua a copia do arquivo de configuração br_numeros.rb" do
          run_generator
          assert_file "config/br_numeros.rb"
        end

      end
    end
  end
end

