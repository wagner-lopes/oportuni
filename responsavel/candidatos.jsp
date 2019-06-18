<%@ taglib uri="http://richfaces.org/rich" prefix="rich"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ taglib uri="http://myfaces.apache.org/tomahawk" prefix="t"%>
<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j"%>
<%@ taglib uri="http://jsftutorials.net/htmLib" prefix="htm"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>


<f:subview id="candidatosOportunidade">
	<f:loadBundle basename="mensagens" var="msg" />

	<h:panelGroup id="mp_globalCandidatos"
		rendered="#{responsavelNavegacaoBean.candidatosOportunidade}">
		<a4j:form id="listaCandidatosResp">
			<t:div styleClass="cabecalhoSubView">
				<t:div styleClass="tituloSubView">
					<h:graphicImage url="/images/candidatos50.png"
						styleClass="imagemTituloSubView"
						title="#{msg.responsavel_menuCandidatos}" />
					<h:outputText value="#{msg.responsavel_menuCandidatos}" />
				</t:div>
				<t:div>
					<rich:separator height="3px"></rich:separator>
					<rich:spacer height="7px"></rich:spacer>
				</t:div>
			</t:div>
			<t:div id="barraMenuCandidatos">
				<t:div styleClass="roundedcornr_box">
					<t:div styleClass="roundedcornr_top">
						<t:div></t:div>
					</t:div>
					<t:div styleClass="roundedcornr_content">
						<!-- Botoes -->

						<a4j:commandLink action="#{responsavelNavegacaoBean.voltar}"
							reRender="conteudoResponsavel">
							<t:graphicImage url="/images/voltar20.png" styleClass="iconeMenu"
								title="#{msg.geral_voltar}"></t:graphicImage>
						</a4j:commandLink>

						<!-- Funcionalidades desativadas na tela de candidatos
						<a4j:commandLink
							action="#{responsavelCandidatosBean.selecionarAlunos}"
							rendered="#{not empty responsavelCandidatosBean.candidatos}"
							reRender="msgOportuniSelecaoCandidato">
							<t:graphicImage url="/images/salvar25.png" styleClass="iconeMenu"
								title="#{msg.geral_Salvar}"></t:graphicImage>
						</a4j:commandLink>

						<a4j:commandLink id="enviarMensagemCandidatos"
							action="#{responsavelOportunidadesBean.inicializaEnvioMensagem}"
							rendered="#{not empty responsavelCandidatosBean.candidatos}"
							reRender="conteudoResponsavel">
							<h:graphicImage url="/images/enviarMensagem20.png"
								styleClass="iconeMenu" title="#{msg.responsavel_enviarMensagem}" />
						</a4j:commandLink>
						-->

					</t:div>
					<t:div styleClass="roundedcornr_bottom">
						<t:div></t:div>
					</t:div>
				</t:div>
			</t:div>

			<t:div styleClass="mensageListaVazia"
				rendered="#{empty responsavelCandidatosBean.candidatos}">
				<t:graphicImage url="/images/aviso20.png" styleClass="imagem" />
				<t:outputText value="#{msg.responsavel_avisoSemCandidatos}"></t:outputText>
			</t:div>

			<rich:spacer height="3px"></rich:spacer>

			<!-- Mensagens Oportuni -->
			<t:div id="msgOportuniSelecaoCandidato">
				<c:import url="../mensagens/mensagensBox.jsp"></c:import>
			</t:div>
			<!-- Fim das mensagens -->
			<rich:spacer height="10px"></rich:spacer>

			<!-- Início da Tabela de Candidatos -->

			<rich:dataTable  id="tabelaCandidatosResp"
				rendered="#{not empty responsavelCandidatosBean.candidatos}"
				value="#{responsavelCandidatosBean.candidatos}" var="candidato"
				rows="10"
				styleClass="dataTablePadrao"
				rowClasses="linha1, linha2">
				
				<rich:column styleClass="coluna">
					<f:facet name="header">
						<h:outputText value="#{msg.geral_curriculo}" />
					</f:facet>
					<a4j:commandLink reRender="conteudoResponsavel"
						action="#{responsavelCandidatosBean.marcaCurriculoVisitado}"
						actionListener="#{responsavelNavegacaoBean.renderizaCurriculoCandidato}">
						<h:graphicImage url="/images/curriculo20.png"
							title="#{msg.responsavel_visualizarCurriculo}" />
						<f:setPropertyActionListener value="#{candidato.aluno}"
							target="#{curriculoBean.alunoSelecionado}" />
						<f:setPropertyActionListener value="#{candidato}"
							target="#{responsavelCandidatosBean.candidatoSelecionado}" />
					</a4j:commandLink>
				</rich:column>
				
				<rich:column  styleClass="coluna" sortBy="#{candidato.aluno.nome}">
					<f:facet name="header">
						<h:outputText value="#{msg.geral_alunoNome}" />
					</f:facet>
					<h:outputText value="#{candidato.aluno.nome}"
						styleClass="#{candidato.styleVisitado}"></h:outputText>
				</rich:column>
				
				<rich:column  styleClass="coluna"
					sortBy="#{candidato.aluno.curso.nome}" sortOrder="ASCENDING">
					<f:facet name="header">
						<h:outputText value="#{msg.geral_alunoCurso}" />
					</f:facet>
					<h:outputText value="#{candidato.aluno.curso.nome}"></h:outputText>
				</rich:column>
				
				<rich:column styleClass="coluna"
					sortBy="#{candidato.aluno.periodo}" sortOrder="ASCENDING">
					<f:facet name="header">
						<h:outputText value="#{msg.geral_alunoPeriodo}" />
					</f:facet>
					<h:outputText value="#{candidato.aluno.periodo}"></h:outputText>
				</rich:column>
			</rich:dataTable>
			<rich:datascroller for="tabelaCandidatosResp" maxPages="20"
				rendered="#{not empty responsavelCandidatosBean.candidatos}"></rich:datascroller>

		</a4j:form>
		<!-- Fim da Tabela de Candidatos -->
	</h:panelGroup>

</f:subview>
