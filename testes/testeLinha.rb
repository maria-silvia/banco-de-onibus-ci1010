# -*- coding: utf-8 -*-
require "test/unit"

$:.push 'modelos/'
require 'linha.rb'
require 'tipo.rb'

class TestLinha < Test::Unit::TestCase

    def test_simples
        l = Linha.new()
        l.nome = "Um Teste"
        l.codigo = '123'
        l.tipo = Tipo.find(1)
        res = l.save
        assert_equal(res, true, 'TESTE SIMPLES FAILED')
        # se res nao for true, imprime mensagem
    end

    def test_grava_codigo_vazio
        l = Linha.new()
        l.nome = "Segundo Teste"
        l.codigo = nil
        l.tipo = Tipo.find(1)
        res = l.save
        assert_equal(res, false, 'Salvou com codigo vazio')
        # se res nao for false, imprime msg que salvou quando nao deveria
    end

    def test_grava_nome_vazio
        l = Linha.new()
        l.nome = nil
        l.codigo = '123'
        l.tipo = Tipo.find(1)
        res = l.save
        assert_equal(res, false, 'Salvou com nome vazio')
    end

    def test_grava_tipo_vazio
        l = Linha.new()
        l.nome = "Outro Teste"
        l.codigo = '123'
        l.tipo = nil
        res = l.save
        assert_equal(res, false, 'Salvou com tipo vazio')
    end

    def test_grava_codigo_grande
        l = Linha.new()
        l.nome = "Teste"
        l.codigo = '1233'
        l.tipo = Tipo.find(1)
        res = l.save
        assert_equal(res, false, 'Salvou com codigo errado')

        l.codigo = '1'
        assert_equal(res, false, 'Salvou com codigo errado')
    end
end