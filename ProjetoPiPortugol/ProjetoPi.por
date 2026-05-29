programa
{
	inclua biblioteca Sons --> s
	inclua biblioteca Util --> u
	inclua biblioteca Teclado --> t
	inclua biblioteca Graficos --> g

	cadeia pasta_sprites = "spr_projetoPi/"
	
	inteiro bolinha_papel_spr = g.carregar_imagem(pasta_sprites+"bolinha_papel_spr.jpeg")
	inteiro lata_metal_spr = g.carregar_imagem(pasta_sprites+"lata_metal_spr.jpeg")
	inteiro garrafa_plastico_spr = g.carregar_imagem(pasta_sprites+"garrafa_plastico_spr.jpeg")
	inteiro garrafa_vidro_spr = g.carregar_imagem(pasta_sprites+"garrafa_vidro_spr.jpeg")

	inteiro vitoria_jogo_joia_spr = g.carregar_imagem(pasta_sprites+"vitoria_jogo_joia_spr.jpeg")
	inteiro vitoria_fase_joia_spr = g.carregar_imagem(pasta_sprites+"+15sc.jpg")

	
	inteiro lixo_azul_spr = g.carregar_imagem(pasta_sprites+"lixo_azul_spr.jpg")
	inteiro lixo_amarelo_spr = g.carregar_imagem(pasta_sprites+"lixo_amarelo_spr.jpg")
	inteiro lixo_verde_spr = g.carregar_imagem(pasta_sprites+"lixo_verde_spr.jpg")
	inteiro lixo_vermelho_spr = g.carregar_imagem(pasta_sprites+"lixo_vermelho_spr.jpg")

	inteiro musica_jogo = s.carregar_som("banger.mp3")

	inteiro posicao_X_lata = 500
	inteiro posicao_Y_lata = 650 

	logico vitoria_fase = falso

	inteiro vidas = 3
	
	funcao inicio()
	{
		g.iniciar_modo_grafico(verdadeiro)
		g.definir_dimensoes_janela(1000, 900)
		enquanto(nao t.tecla_pressionada(t.TECLA_ESC)){
			s.reproduzir_som(musica_jogo,verdadeiro)
			enquanto(vitoria_fase == falso){
			fase_1()
			}
			enquanto(nao t.tecla_pressionada(t.TECLA_ESPACO)){
				tela_vitoria_fase()			
			}
			vitoria_fase = falso
			enquanto(vitoria_fase == falso){
				fase_2()
			}
			enquanto(nao t.tecla_pressionada(t.TECLA_ESPACO)){
				tela_vitoria_fase()			
			}
			vitoria_fase = falso
			enquanto(vitoria_fase == falso){
				fase_3()
			}
			enquanto(nao t.tecla_pressionada(t.TECLA_ESPACO)){
				tela_vitoria_fase()			
			}
			vitoria_fase = falso
			enquanto(vitoria_fase == falso){
				fase_4()
			}
			enquanto(1==1){
				tela_vitoria_jogo()			
			}
		}
	}
	funcao fase_1(){
		inteiro qtd_lixo = 3
		real velocidade = 0.5
		lixosCaindo(velocidade,bolinha_papel_spr,lixo_azul_spr,qtd_lixo)
	}
	funcao fase_2(){
		inteiro qtd_lixo = 4
		real velocidade = 0.75
		lixosCaindo(velocidade,garrafa_plastico_spr,lixo_vermelho_spr,qtd_lixo)
	}
	funcao fase_3(){
		inteiro qtd_lixo = 7
		real velocidade = 1.0	
		lixosCaindo(velocidade,garrafa_vidro_spr,lixo_verde_spr,qtd_lixo)
	}
	funcao fase_4(){
		inteiro qtd_lixo = 10
		real velocidade = 1.25
		lixosCaindo(velocidade,lata_metal_spr,lixo_amarelo_spr,qtd_lixo)
	}
	funcao lixosCaindo(real velocidade,inteiro lixo_spr,inteiro lata_spr,inteiro qtd_lixo){
		enquanto(qtd_lixo > 0){
		inteiro posicao_X = u.sorteia(100, 900)
		real posicao_Y = 0.0
		logico lixo_coletado = falso
			enquanto(posicao_Y < 1000 e lixo_coletado == falso){
				exibir_vidas()
				posicao_Y += velocidade
				g.desenhar_imagem(posicao_X, posicao_Y, lixo_spr)
				movimento_lixo(lata_spr)
				se(posicao_Y > 600 e posicao_X_lata < posicao_X e posicao_X_lata > posicao_X - 190 e lixo_coletado == falso){
					qtd_lixo--
					lixo_coletado = verdadeiro
				}
				se(posicao_Y > 950 e lixo_coletado == falso){
					vidas--
					lixo_coletado = verdadeiro
					game_over()
				}		
				g.renderizar()
			}
		}
		vitoria_fase = verdadeiro
		
	}
	funcao movimento_lixo(inteiro lata_spr){
		
		g.desenhar_imagem(posicao_X_lata, posicao_Y_lata,lata_spr)
		se(t.tecla_pressionada(t.TECLA_D)){
			posicao_X_lata++
		}
		se(t.tecla_pressionada(t.TECLA_A)){
			posicao_X_lata--
		}
	}
	funcao tela_vitoria_fase(){
		g.definir_cor(g.COR_BRANCO)
		g.limpar()
		g.desenhar_imagem(200, 200,vitoria_fase_joia_spr)
		g.renderizar()
	}
	funcao tela_vitoria_jogo(){
		g.definir_cor(g.COR_BRANCO)
		g.limpar()
		g.desenhar_imagem(100, 0,vitoria_jogo_joia_spr)
		g.renderizar()
	}
	funcao exibir_vidas(){
		g.definir_cor(g.COR_BRANCO)
		g.limpar()
		g.definir_cor(g.COR_PRETO)
		g.definir_tamanho_texto(15.0)
		g.desenhar_texto(100,100,"vidas: "+vidas+"\n")
	}
	funcao game_over(){
		se(vidas == 0){
			g.encerrar_modo_grafico()
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 3230; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */