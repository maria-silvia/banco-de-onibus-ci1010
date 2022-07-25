# -*- coding: utf-8 -*-
$:.push 'modelos/'
require 'linha.rb'
require 'tipo.rb'

lista_linhas = 
  [
   {:nome => "Inter 2", :codigo => "023", :cor => "cinza"        },
   {:nome => "Solitude", :codigo => "345", :cor => "amarelo"     },
   {:nome => "Petrópolis", :codigo => "334", :cor => "amarelo"        },
   {:nome => "Fazendinha", :codigo => "654", :cor => "amarelo"        },
   {:nome => "Ahú / Los Angeles", :codigo => "543", :cor => "amarelo"     },
   {:nome => "Sta Candida / Capão Raso", :codigo => "543", :cor => "vermelho"       },
   {:nome => "Interbairros III", :codigo => "531", :cor => "verde"        },
   {:nome => "Fanny", :codigo => "045", :cor => "amarelo"     },
   {:nome => "Portão", :codigo => "001", :cor => "amarelo"          },
   {:nome => "Vila Rex", :codigo => "079", :cor => "amarelo"          },
  ]

lista_linhas.each do |e|
  lin = Linha.new ()
  lin.nome = e[:nome]
  lin.codigo = e[:codigo]
  t = Tipo.find_by_cor(e[:cor])
  lin.tipo = t
  lin.save
end
