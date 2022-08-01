# -*- coding: utf-8 -*-
$:.push 'modelos/'
require 'linha.rb'
require 'tipo.rb'

lista_linhas = 
  [
   {:nome => "Inter 2", :codigo => "023", :cor => "cinza"        },
   {:nome => "Solitude", :codigo => "463", :cor => "amarelo"     },
   {:nome => "Petrópolis", :codigo => "334", :cor => "amarelo"        },
   {:nome => "Bairro Novo", :codigo => "506", :cor => "cinza"        },
   {:nome => "Fazendinha", :codigo => "654", :cor => "amarelo"        },
   {:nome => "Ahú / Los Angeles", :codigo => "543", :cor => "amarelo"     },
   {:nome => "Sta Candida / Capao Raso", :codigo => "543", :cor => "vermelho"       },
   {:nome => "Interbairros III", :codigo => "030", :cor => "verde"        },
   {:nome => "Interbairros V", :codigo => "050", :cor => "verde"        },
   {:nome => "Fanny", :codigo => "045", :cor => "amarelo"     },
   {:nome => "CENTENARIO / C. COMPRIDO", :codigo => "543", :cor => "vermelho"       },
   {:nome => "Estudantes", :codigo => "466", :cor => "amarelo"          },
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

lin = Linha.new ()
lin.nome = "Turismo"
lin.codigo = "979"
t = Tipo.find_by_nome("Jardineira")
lin.tipo = t
lin.save