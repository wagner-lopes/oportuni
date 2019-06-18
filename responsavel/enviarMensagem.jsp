<%@ taglib uri="http://richfaces.org/rich" prefix="rich"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ taglib uri="http://myfaces.apache.org/tomahawk" prefix="t"%>
<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j"%>
<%@ taglib uri="http://jsftutorials.net/htmLib" prefix="htm"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>


<f:subview id="enviarMensagem">
	<f:loadBundle basename="mensagens" var="msg" />

	<h:panelGroup id="mp_globalMensagem"
		rendered="#{responsavelNavegacaoBean.enviarMensagem}">
		<t:div styleClass="cabecalhoSubView">
			<t:div styleClass="tituloSubView">
				<h:graphicImage url="/images/enviarMensagem50.png"
					styleClass="imagemTituloSubView"
					title="#{msg.responsavel_enviarMensagem}" />
				<h:outputText value="#{msg.responsavel_enviarMensagem}" />
			</t:div>
			<t:div>
				<rich:separator height="3px"></rich:separator>
				<rich:spacer height="3px"></rich:spacer>
			</t:div>
		</t:div>
		<t:div id="barraMenuEnviarMensagem">
			<t:div styleClass="roundedcornr_box">
				<t:div styleClass="roundedcornr_top">
					<t:div></t:div>
				</t:div>
				<t:div styleClass="roundedcornr_content">
					<!-- Botoes -->
					<a4j:form>
						<a4j:commandLink action="#{responsavelNavegacaoBean.voltar}"
							reRender="conteudoResponsavel">
							<t:graphicImage url="/images/voltar20.png" styleClass="iconeMenu"
								title="#{msg.geral_voltar}"></t:graphicImage>
						</a4j:commandLink>

						<!-- Opcao de editar candidatos -->

						<a4j:commandLink id="editarCandidatos"
							actionListener="#{responsavelCandidatosBean.selecionaCandidatosOportunidade}"
							rendered="#{not empty responsavelCandidatosBean.candidatos}"
							action="#{responsavelNavegacaoBean.renderizaCandidatosOportunidade}"
							reRender="conteudoResponsavel">
							<h:graphicImage url="/images/candidatos20.png"
								styleClass="iconeMenu"
								title="#{msg.responsavel_editarCandidatos}" />
						</a4j:commandLink>
					</a4j:form>
					<!-- Fim da opcao de editar candidatos -->
				</t:div>
				<t:div styleClass="roundedcornr_bottom">
					<t:div></t:div>
				</t:div>

			</t:div>
		</t:div>

		<!-- Mensagens Oportuni -->
		<t:div id="msgOportuniEnviaMensagem">
			<c:import url="../mensagens/mensagensBox.jsp"></c:import>
		</t:div>
		<!-- Fim das mensagens -->

		<!-- Cabeçalho da oportunidade -->
		<t:div styleClass="roundedcornr_lGr_box">
			<t:div styleClass="roundedcornr_lGr_top">
				<t:div></t:div>
			</t:div>
			<t:div styleClass="roundedcornr_lGr_content">
				<t:panelGrid columns="3">
					<h:outputText value="#{msg.geral_optNome}: "
						styleClass="cabecalhoOportunidadeAtributo" />
					<h:outputText
						value="#{responsavelOportunidadesBean.oportunidadeSelecionada.nome}"
						styleClass="cabecalhoOportunidadeValor" />
					<br />
					<h:outputText value="#{msg.geral_optTipo}: "
						styleClass="cabecalhoOportunidadeAtributo" />
					<h:outputText
						value="#{responsavelOportunidadesBean.oportunidadeSelecionada.tipooportunidade.nometipoopt}"
						styleClass="cabecalhoOportunidadeValor" />
					<br />
				</t:panelGrid>
			</t:div>
			<t:div styleClass="roundedcornr_lGr_bottom">
				<t:div></t:div>
			</t:div>
		</t:div>
		<rich:separator height="3px"></rich:separator>
		<rich:spacer height="10px"></rich:spacer>
		<!--  -->

		<!-- Início da Tabela de Candidatos Escolhidos -->

		<rich:dataTable width="100%" id="tabelaCandidatosEscolhidos"
			rendered="#{not empty responsavelOportunidadesBean.candidatosEscolhidos}"
			value="#{responsavelOportunidadesBean.candidatosEscolhidos}"
			var="candidato" rows="10">
			<f:facet name="header">
				<h:outputText value="#{msg.responsavel_candidatosSelecionados}" />
			</f:facet>
			<rich:column style="text-align:center">
				<f:facet name="header">
					<h:outputText value="#{msg.geral_alunoNome}" />
				</f:facet>
				<h:outputText value="#{candidato.aluno.nome}"></h:outputText>
			</rich:column>
			<rich:column style="text-align:center">
				<f:facet name="header">
					<h:outputText value="#{msg.geral_alunoCurso}" />
				</f:facet>
				<h:outputText value="#{candidato.aluno.curso.nome}"></h:outputText>
			</rich:column>
			<rich:column style="text-align:center">
				<f:facet name="header">
					<h:outputText value="#{msg.geral_alunoPeriodo}" />
				</f:facet>
				<h:outputText value="#{candidato.aluno.periodo}"></h:outputText>
			</rich:column>
		</rich:dataTable>
		<t:outputText value="#{msg.responsavel_candTabAviso}"
			rendered="#{empty responsavelOportunidadesBean.candidatosEscolhidos}"></t:outputText>


		<rich:spacer height="10px"></rich:spacer>
		<rich:separator height="3px"></rich:separator>
		<!-- Fim da Tabela de Candidatos Escolhidos -->

		<!--  -->
		<a4j:form>
			<rich:spacer height="10px"></rich:spacer>

			<t:panelGrid columns="2" width="100%"
				rendered="#{not empty responsavelOportunidadesBean.candidatosEscolhidos}">
				<t:outputText value="Assunto: "></t:outputText>
				<t:inputText value="#{responsavelOportunidadesBean.assuntoMensagem}"></t:inputText>
			</t:panelGrid>
			<!-- Mensagem para os alunos selecionados -->
			<rich:spacer height="10px"></rich:spacer>
			<t:panelGrid columns="1" width="100%"
				rendered="#{not empty responsavelOportunidadesBean.candidatosEscolhidos}">
				<t:div id="mensagemCandidatosSelecionados">
					<rich:simpleTogglePanel
						label="#{msg.responsavel_msgCandidatosSelecionados}"
						style="text-align:center" switchType="client">
						<!-- Lista de templates para a mensagem -->
						<h:outputText value="#{msg.responsavel_escolhaTemplate}" />
						<h:selectOneMenu
							value="#{responsavelOportunidadesBean.idTemplateMensagem}">
							<f:selectItems
								value="#{responsavelOportunidadesBean.opcaoTemplateMensagem}" />
							<a4j:support event="onchange"
								action="#{responsavelOportunidadesBean.atribuiTemplate}"
								reRender="editorMensagem" />
						</h:selectOneMenu>
						<!-- Fim da lista de templates  -->
						<rich:spacer height="10px"></rich:spacer>
						<rich:editor id="editorMensagem"
							value="#{responsavelOportunidadesBean.mensagemCandidatosEscolhidos}"
							width="692" height="200" theme="advanced">
							<f:param name="theme_advanced_buttons1"
								value="bold,italic,underline,separator,bullist,numlist,
                                        separator,undo,redo,fontsizeselect" />
							<f:param name="theme_advanced_buttons2" value="" />
							<f:param name="theme_advanced_buttons3" value="" />
							<f:param name="theme_advanced_toolbar_location" value="top" />
							<f:param name="theme_advanced_toolbar_align" value="left" />
						</rich:editor>
					</rich:simpleTogglePanel>
				</t:div>
			</t:panelGrid>

			<rich:spacer height="10px"></rich:spacer>
			<a4j:commandButton value="Enviar Mensagem"
				action="#{responsavelOportunidadesBean.enviaMensagem}"
				rendered="#{not empty responsavelOportunidadesBean.candidatosEscolhidos}"
				onclick="if(!confirm('Deseja enviar a mensagem?')) {form.reset(); return false;}"
				reRender="conteudoResponsavel"></a4j:commandButton>
		</a4j:form>
	</h:panelGroup>

</f:subview>
