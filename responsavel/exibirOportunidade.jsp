<%@ taglib uri="http://richfaces.org/rich" prefix="rich"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ taglib uri="http://myfaces.apache.org/tomahawk" prefix="t"%>
<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<f:subview id="exibirOportunidadeResp">
	<f:loadBundle basename="mensagens" var="msg" />
	<h:panelGroup
		rendered="#{responsavelNavegacaoBean.exibirOportunidadeResp}"
		id="pGroupExibirOptResp">

		<!-- Cabecalho -->
		<t:div styleClass="cabecalhoSubView">
			<t:div styleClass="tituloSubView">
				<h:graphicImage url="/images/detalhe50.png"
					styleClass="imagemTituloSubView" title="#{msg.responsavel_detOpt}" />
				<h:outputText value="#{msg.responsavel_detOpt}" />
			</t:div>
			<t:div>
				<rich:separator height="3px"></rich:separator>
			</t:div>
		</t:div>

		<t:div id="barraMenuExibicao">
			<a4j:form>
				<t:div styleClass="roundedcornr_box">
					<t:div styleClass="roundedcornr_top">
						<t:div></t:div>
					</t:div>
					<t:div styleClass="roundedcornr_content">

						<a4j:commandLink action="#{responsavelNavegacaoBean.voltar}"
							actionListener="#{responsavelOportunidadesBean.selecionaOportunidadesResp}"
							reRender="conteudoResponsavel">
							<t:graphicImage url="/images/voltar20.png" styleClass="iconeMenu"
								title="#{msg.geral_voltar}"></t:graphicImage>
						</a4j:commandLink>

						<a4j:commandLink id="excluirOportunidade"
							rendered="#{responsavelOportunidadesBean.opcaoExcluir and not responsavelOportunidadesBean.oportunidadeSelecionada.foiPublicada}"
							action="#{responsavelOportunidadesBean.exibicaoExcluirOportunidades}"
							onclick="if(!confirm('Tem certeza que deseja excluir essa oportunidade?')) {form.reset(); return false;}"
							reRender="conteudoResponsavel">
							<t:graphicImage url="/images/excluir20.png"
								styleClass="iconeMenu" title="#{msg.geral_excluir}"></t:graphicImage>
						</a4j:commandLink>

						<a4j:commandLink id="exibicaoEditarOportunidade"
							rendered="#{responsavelOportunidadesBean.opcaoEditar and not responsavelOportunidadesBean.oportunidadeSelecionada.foiPublicada}"
							action="#{responsavelOportunidadesBean.exibicaoEditarOportunidade}"
							reRender="conteudoResponsavel">
							<t:graphicImage url="/images/editar30.png" styleClass="iconeMenu"
								title="#{msg.geral_editar}"></t:graphicImage>
						</a4j:commandLink>

						<a4j:commandLink id="exibicaoVerCandidatos"
							rendered="#{responsavelOportunidadesBean.oportunidadeSelecionada.foiPublicada and not responsavelOportunidadesBean.oportunidadeSelecionada.estaFinalizada}"
							action="#{responsavelOportunidadesBean.exibicaoVerCandidatos}"
							actionListener="#{responsavelCandidatosBean.selecionaCandidatosOportunidade}"
							reRender="conteudoResponsavel">
							<h:graphicImage url="/images/candidatos20.png"
								styleClass="iconeMenu" title="#{msg.responsavel_menuCandidatos}" />
						</a4j:commandLink>

						<a4j:commandLink id="exibicaoPublicarOportunidade"
							rendered="#{responsavelOportunidadesBean.opcaoPublicar and not responsavelOportunidadesBean.oportunidadeSelecionada.foiPublicada}"
							onclick="if(!confirm('Após a publicação a oportunidade não poderá ser editada.')) {form.reset(); return false;}"
							action="#{responsavelOportunidadesBean.exibicaoPublicarOportunidade}"
							reRender="conteudoResponsavel">
							<h:graphicImage url="/images/publicar20.png"
								styleClass="iconeMenu" title="#{msg.responsavel_publicar}" />
						</a4j:commandLink>

						<a4j:commandLink id="exibicaoFinalizarOportunidade"
							action="#{responsavelOportunidadesBean.exibicaoFinalizaOportunidade}"
							rendered="#{responsavelOportunidadesBean.oportunidadeSelecionada.estaPublicada}"
							onclick="if(!confirm('Deseja confirmar a finalização?')) {form.reset(); return false;}"
							reRender="conteudoResponsavel">
							<h:graphicImage url="/images/finalizar.png"
								styleClass="iconeMenu" title="#{msg.responsavel_finalizar}" />
						</a4j:commandLink>
						
						<a4j:commandLink id="exibicaoRecuperarOportunidade"
							action="#{responsavelOportunidadesBean.exibicaoRecuperarOportunidade}"
							rendered="#{responsavelOportunidadesBean.oportunidadeSelecionada.estaFinalizada}" 
							onclick="if(!confirm('A oportunidade voltará a ser editável.')) {form.reset(); return false;}"
							reRender="conteudoResponsavel, barraMenuExibicao">
							<h:graphicImage url="/images/recuperar.png"
								styleClass="iconeMenu" title="#{msg.responsavel_recuperar}" />
						</a4j:commandLink>

					</t:div>
					<t:div styleClass="roundedcornr_bottom">
						<t:div></t:div>
					</t:div>

				</t:div>
			</a4j:form>
		</t:div>


		<!-- Mensagens Oportuni -->
		<c:import url="../mensagens/mensagensBox.jsp"></c:import>

		<!-- Box Mensagens Aviso -->
		<t:div styleClass="roundedcornr_box_sBorderYellow"
			rendered="#{not responsavelOportunidadesBean.oportunidadeSelecionada.foiPublicada}">
			<t:div styleClass="roundedcornr_top_sBorderYellow">
				<t:div></t:div>
			</t:div>
			<t:div styleClass="roundedcornr_content_sBorderYellow">
				<t:panelGrid columns="2" styleClass="estiloMensagemYellow">
					<h:graphicImage url="/images/aviso20.png" styleClass="iconeMenu" />
					<h:outputText value="#{msg.responsavel_avisoOptEmEdicao}"></h:outputText>
				</t:panelGrid>
			</t:div>
			<t:div styleClass="roundedcornr_bottom_sBorderYellow">
				<t:div></t:div>
			</t:div>
		</t:div>


		<t:panelGrid columns="2" width="100%">
			<t:div id="exibeNome">
				<rich:simpleTogglePanel label="#{msg.geral_optNome}"
					styleClass="simpleTogglePanel" switchType="client">
					<h:outputText
						value="#{responsavelOportunidadesBean.oportunidadeSelecionada.nome}">
					</h:outputText>
				</rich:simpleTogglePanel>
			</t:div>

			<t:div id="exibeStatus">
				<rich:simpleTogglePanel label="#{msg.geral_optStatus}"
					styleClass="simpleTogglePanel" switchType="client">
					<h:outputText
						value="#{responsavelOportunidadesBean.oportunidadeSelecionada.statusOportunidade}"
						styleClass="#{responsavelOportunidadesBean.oportunidadeSelecionada.styleStatus}">
					</h:outputText>
				</rich:simpleTogglePanel>
			</t:div>
		</t:panelGrid>

		<t:panelGrid columns="3" width="100%">
			<t:div id="exibeTipo">
				<rich:simpleTogglePanel label="#{msg.geral_optTipo}"
					styleClass="simpleTogglePanel" switchType="client">
					<h:outputText
						value="#{responsavelOportunidadesBean.oportunidadeSelecionada.tipooportunidade.nometipoopt}">
					</h:outputText>
				</rich:simpleTogglePanel>
			</t:div>

			<t:div id="exibeRemuneracao">
				<rich:simpleTogglePanel label="#{msg.geral_optRemuneracao}"
					switchType="client" styleClass="simpleTogglePanel">
					<h:outputText
						value="#{responsavelOportunidadesBean.oportunidadeSelecionada.remuneracaoFormatada}">
					</h:outputText>
				</rich:simpleTogglePanel>
			</t:div>

			<t:div id="exibePeriodo">
				<rich:simpleTogglePanel label="#{msg.geral_optPeriodo}"
					styleClass="simpleTogglePanel" switchType="client">
					<h:outputText
						value="#{responsavelOportunidadesBean.oportunidadeSelecionada.periodo}">
					</h:outputText>
				</rich:simpleTogglePanel>
			</t:div>
		</t:panelGrid>

		<!-- Data de inicio e fim da publicacao da oportunidade -->
		<t:panelGrid columns="2" width="100%"
			rendered="#{responsavelOportunidadesBean.oportunidadeSelecionada.foiPublicada}">
			<t:div id="exibeDataInicio">
				<rich:simpleTogglePanel label="#{msg.geral_optDataPublicacao}"
					styleClass="simpleTogglePanel" switchType="client">
					<h:outputText
						value="#{responsavelOportunidadesBean.oportunidadeSelecionada.dtini}">
					</h:outputText>
				</rich:simpleTogglePanel>
			</t:div>
			<t:div id="exibeDataFim">
				<rich:simpleTogglePanel label="#{msg.geral_optDataFinalizacao}"
					styleClass="simpleTogglePanel" switchType="client">
					<h:outputText
						value="#{responsavelOportunidadesBean.oportunidadeSelecionada.dtfim}">
					</h:outputText>
				</rich:simpleTogglePanel>
			</t:div>
		</t:panelGrid>


		<!-- Cursos -->
		<t:panelGrid columns="1" width="100%">
			<t:div id="cursos">
				<rich:simpleTogglePanel label="#{msg.geral_optCursos}"
					style="text-align:center" switchType="client">

					<t:div id="tabCursosOptExibicao">
						<rich:dataTable styleClass="dataTableCursoOportunidade"
							value="#{responsavelOportunidadesBean.cursos}"
							rendered="#{not empty responsavelOportunidadesBean.cursos}"
							var="curso" rowClasses="linha1, linha2">
							<rich:column styleClass="coluna" width="60%">
								<f:facet name="header">
									<h:outputText value="#{msg.geral_curso}" />
								</f:facet>
								<h:outputText value="#{curso.nome}"></h:outputText>
							</rich:column>

							<rich:column styleClass="coluna" width="40%">
								<f:facet name="header">
									<h:outputText value="#{msg.geral_nivel}" />
								</f:facet>
								<h:outputText value="#{curso.nivel}"></h:outputText>
							</rich:column>
						</rich:dataTable>
					</t:div>
					<t:div styleClass="mensageListaVazia"
						rendered="#{empty responsavelOportunidadesBean.cursos}">
						<t:graphicImage url="/images/aviso20.png" styleClass="imagem" />
						<h:outputText value="#{msg.geral_avisoSemCursos}"></h:outputText>
					</t:div>
				</rich:simpleTogglePanel>
			</t:div>
		</t:panelGrid>

		<t:panelGrid columns="1" width="100%">
			<t:div id="exibeDescricao">
				<rich:simpleTogglePanel label="#{msg.geral_optDescricao}"
					style="text-align:center" switchType="client">
					<rich:editor
						value="#{responsavelOportunidadesBean.oportunidadeSelecionada.descricao}"
						readonly="true" theme="advanced" width="692" height="400"></rich:editor>
					<f:param name="theme_advanced_buttons1" value="" />
					<f:param name="theme_advanced_buttons2" value="" />
					<f:param name="theme_advanced_buttons3" value="" />
				</rich:simpleTogglePanel>
			</t:div>
		</t:panelGrid>

		<!-- Campo desativado
		<t:panelGrid columns="1" width="100%"
			rendered="#{responsavelOportunidadesBean.oportunidadeSelecionada.foiPublicada}">
			<t:div id="exibeCandidatos">
				<rich:simpleTogglePanel
					label="#{msg.responsavel_candidatosSelecionados}"
					style="text-align:center" switchType="client">
					<rich:dataTable width="100%" id="tabelaExibeCandidatosResp"
						style="border:0"
						rendered="#{not empty responsavelOportunidadesBean.candidatosExibicao}"
						value="#{responsavelOportunidadesBean.candidatosExibicao}"
						var="candidato" rows="10">
						<rich:column style="text-align:center; border:0">
							<f:facet name="header">
								<h:outputText value="#{msg.responsavel_candTabColNome}" />
							</f:facet>
							<h:outputText value="#{candidato.aluno.nome}"></h:outputText>
						</rich:column>
						<rich:column style="text-align:center; border:0">
							<f:facet name="header">
								<h:outputText value="#{msg.geral_email}" />
							</f:facet>
							<h:outputText value="#{candidato.aluno.email}"></h:outputText>
						</rich:column>
						<rich:column style="text-align:center; border:0">
							<f:facet name="header">
								<h:outputText value="#{msg.responsavel_candTabColCurso}" />
							</f:facet>
							<h:outputText value="#{candidato.aluno.curso.nome}"></h:outputText>
						</rich:column>
						<rich:column style="text-align:center; border:0">
							<f:facet name="header">
								<h:outputText value="#{msg.responsavel_candTabColPer}" />
							</f:facet>
							<h:outputText value="#{candidato.aluno.periodo}"></h:outputText>
						</rich:column>
					</rich:dataTable>
					<t:outputText value="#{msg.responsavel_avisoSemCandidatosSelecionados}"
						rendered="#{empty responsavelOportunidadesBean.candidatosExibicao}"></t:outputText>
				</rich:simpleTogglePanel>
			</t:div>
		</t:panelGrid>
		 -->
		<rich:spacer height="10px"></rich:spacer>
	</h:panelGroup>

</f:subview>
