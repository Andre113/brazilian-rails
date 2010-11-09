# encoding: UTF-8

require 'rubygems'  
require 'action_controller'
require 'active_support'
require 'action_view'
require "brdata/version"  
require "brdata/excecoes"


module BrData
  def self.setup
    yield self 
  end

  private
  def self.ativar_time
    require File.dirname(__FILE__) + "/brdata/time_portuguese.rb"
  end

  def self.ativar_date
    require File.dirname(__FILE__) + "/brdata/date_portuguese.rb"    
  end

  def self.ativar_feriados
    require File.dirname(__FILE__) + "/brdata/feriado.rb"     
    require File.dirname(__FILE__) + "/brdata/feriado_parser.rb"   
    # FERIADOS_PATH = RAILS_ROOT + '/config/feriados'
    feriados, metodos = FeriadoParser.parser(File.dirname(__FILE__) + "/brdata/config")
    # if File.directory?(FERIADOS_PATH)
    #   f, m = FeriadoParser.parser(FERIADOS_PATH)
    #   feriados += f
    #   metodos += m
    # end
    Date::FERIADOS.clear
    Date::FERIADOS_METODOS.clear
    feriados.each { |f| Date::FERIADOS << f }
    metodos.each { |m| Date::FERIADOS_METODOS << m }
  end

  def self.ativar_helpers
    require File.dirname(__FILE__) + "/brdata/br_date_helper.rb"    
  end

end

old_verbose = $VERBOSE
$VERBOSE = nil
[Time, Date].each do |clazz|
  eval "#{clazz}::MONTHNAMES = [nil] + %w(Janeiro Fevereiro Março Abril Maio Junho Julho Agosto Setembro Outubro Novembro Dezembro)"
  eval "#{clazz}::DAYNAMES = %w(Domingo Segunda-Feira Terça-Feira Quarta-Feira Quinta-Feira Sexta-Feira Sábado)"
  eval "#{clazz}::ABBR_MONTHNAMES = [nil] + %w(Jan Fev Mar Abr Mai Jun Jul Ago Set Out Nov Dez)"
  eval "#{clazz}::ABBR_DAYNAMES = %w(Dom Seg Ter Qua Qui Sex Sab)"
end

$VERBOSE = old_verbose
