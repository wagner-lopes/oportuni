<%@ taglib uri="http://richfaces.org/rich" prefix="rich"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ taglib uri="http://myfaces.apache.org/tomahawk" prefix="t"%>
<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<f:subview id="exibirOportunidade">
	<f:loadBundle basename="mensagens" var="msg" />

	<h:panelGroup rendered="#{alunoNavegacaoBean.exibirOportunidade}"
		id="pGroupDetalhes">


		<!-- Cabecalho -->
		<t:div styleClass="cabecalhoSubView">
			<t:div styleClass="tituloSubView">
				<h:graphicImage styleClass="imagemTituloSubView"
					url="/images/detalhe50.png"
					title="#{msg.aluno_detalhesOportunidade}" />
				<h:outputText value="#{msg.aluno_detalhesOportunidade}" />
			</t:div>
			<t:div>
				<rich:separator height="3px"></rich:separator>
			</t:div>
		</t:div>

		<!-- Box Mensagens -->
		<c:import url="../mensagens/mensagensBox.jsp"></c:import>

		<!-- Box Mensagens Aviso -->
		<t:div styleClass="roundedcornr_box_sBorderYellow"
			rendered="#{not pesquisaOportunidadeBean.login.aluno.permissaoCandidatura}">
			<t:div styleClass="roundedcornr_top_sBorderYellow">
				<t:div></t:div>
			</t:div>
			<t:div styleClass="roundedcornr_content_sBorderYellow">
				<t:panelGrid columns="2" styleClass="estiloMensagemYellow">
					<h:graphicImage url="/images/aviso20.png" styleClass="iconeMenu" />
					<h:outputText value="#{msg.aluno_avisoSemCandidaturas}"></h:outputText>
				</t:panelGrid>
			</t:div>
			<t:div styleClass="roundedcornr_bottom_sBorderYellow">
				<t:div></t:div>
			</t:div>
		</t:div>
		<!-- Menu do conteudo Pesquisar Oportunidades Detalhes-->
		<t:div id="menuPesquisarOportunidadesDetalhes">
			<t:div styleClass="roundedcornr_box">
				<t:div styleClass="roundedcornr_top">
					<t:div></t:div>
				</t:div>
				<t:div styleClass="roundedcornr_content">
					<a4j:form>
						<a4j:commandLink action="#{alunoNavegacaoBean.voltar}"
							reRender="conteudo">
							<t:graphicImage url="/images/voltar20.png" styleClass="iconeMenu"
								title="#{msg.geral_voltar}"></t:graphicImage>
						</a4j:commandLink>

						<a4j:commandLink
							onclick="if(!confirm('Você será adicionado à lista de candidatos desta oportunidade.')) {form.reset(); return false;}"
							rendered="#{loginBean.aluno.permissaoCandidatura}"
							action="#{pesquisaOportunidadeBean.candidataNaOportunidade}"
							reRender="boxCandidaturas, pGroupDetalhes">
							<t:graphicImage url="/images/candidatar.png"
								title="#{msg.aluno_candidatar}"></t:graphicImage>
						</a4j:commandLink>

					</a4j:form>
				</t:div>
				<t:div styleClass="roundedcornr_bottom">
					<t:div></t:div>
				</t:div>
			</t:div>
		</t:div>

		<t:panelGrid columns="1" width="100%">
			<!-- Nome -->
			<t:div id="nome">
				<rich:simpleTogglePanel label="#{msg.geral_optNome}"
					styleClass="simpleTogglePanel" switchType="client">
					<h:outputText
						value="#{pesquisaOportunidadeBean.oportunidadeSelecionada.nome}">
					</h:outputText>
				</rich:simpleTogglePanel>
			</t:div>
		</t:panelGrid>


		<t:panelGrid columns="3" width="100%">
			<!-- Tipo -->
			<t:div id="tipo">
				<rich:simpleTogglePanel label="#{msg.geral_optTipo}"
					styleClass="simpleTogglePanel" switchType="client">
					<h:outputText
						value="#{pesquisaOportunidadeBean.oportunidadeSelecionada.tipooportunidade.nometipoopt}">
					</h:outputText>
				</rich:simpleTogglePanel>
			</t:div>

			<!-- Remuneracao -->
			<t:div id="remuneracao">
				<rich:simpleTogglePanel label="#{msg.geral_optRemuneracao}"
					switchType="client" styleClass="simpleTogglePanel">
					<h:outputText
						value="#{pesquisaOportunidadeBean.oportunidadeSelecionada.remuneracaoFormatada}">
					</h:outputText>
				</rich:simpleTogglePanel>
			</t:div>

			<!-- Periodo -->
			<t:div id="periodo">
				<rich:simpleTogglePanel label="#{msg.geral_optPeriodo}"
					styleClass="simpleTogglePanel" switchType="client">
					<h:outputText
						value="#{pesquisaOportunidadeBean.oportunidadeSelecionada.periodo}">
					</h:outputText>
				</rich:simpleTogglePanel>
			</t:div>
		</t:panelGrid>

		<t:panelGrid columns="1" width="100%">
			<!-- Cursos -->
			<t:div id="cursos">
				<rich:simpleTogglePanel label="#{msg.geral_optCursos}"
					styleClass="simpleTogglePanel" switchType="client">

					<rich:dataTable styleClass="dataTableCursoOportunidade"
						rendered="#{not empty pesquisaOportunidadeBean.cursos}"
						value="#{pesquisaOportunidadeBean.cursos}" var="curso"
						rowClasses="linha1, linha2">

						<rich:column styleClass="coluna">
							<f:facet name="header">
								<h:outputText value="#{msg.geral_curso}" />
							</f:facet>
							<h:outputText value="#{curso.nome}"></h:outputText>
						</rich:column>

						<rich:column styleClass="coluna">
							<f:facet name="header">
								<h:outputText value="#{msg.geral_nivel}" />
							</f:facet>
							<h:outputText value="#{curso.nivel}"></h:outputText>
						</rich:column>
					</rich:dataTable>

					<t:div styleClass="mensageListaVazia"
						rendered="#{empty  pesquisaOportunidadeBean.cursos}">
						<t:graphicImage url="/images/aviso20.png" styleClass="imagem" />
						<h:outputText value="#{msg.geral_avisoSemCursos}"></h:outputText>
					</t:div>

				</rich:simpleTogglePanel>
			</t:div>
		</t:panelGrid>

		<t:panelGrid columns="1" width="100%">
			<!-- Descricao -->
			<t:div id="descricao">
				<rich:simpleTogglePanel label="#{msg.geral_optDescricao}"
					styleClass="simpleTogglePanel" switchType="client">
					<rich:editor
						value="#{pesquisaOportunidadeBean.oportunidadeSelecionada.descricao}"
						readonly="true" theme="advanced" width="692" height="400"></rich:editor>
					<f:param name="theme_advanced_buttons1" value="" />
					<f:param name="theme_advanced_buttons2" value="" />
					<f:param name="theme_advanced_buttons3" value="" />
				</rich:simpleTogglePanel>
			</t:div>
		</t:panelGrid>

	</h:panelGroup>

</f:subview>
