<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://richfaces.org/rich" prefix="rich"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ taglib uri="http://myfaces.apache.org/tomahawk" prefix="t"%>
<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j"%>
<%@ taglib uri="http://jsftutorials.net/htmLib" prefix="htm"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>


<f:subview id="pesquisarOportunidades">
	<f:loadBundle basename="mensagens" var="msg" />

	<h:panelGroup rendered="#{alunoNavegacaoBean.pesquisaOportunidade}">
		<a4j:form>
			<!-- Cabecalho  -->
			<t:div styleClass="cabecalhoSubView">
				<t:div styleClass="tituloSubView">
					<h:graphicImage styleClass="imagemTituloSubView"
						url="/images/pesquisar45.png"
						title="#{msg.aluno_pesquisarOportunidades}" />
					<h:outputText value="#{msg.aluno_pesquisarOportunidades}" />
				</t:div>
				<rich:separator height="3px"></rich:separator>
			</t:div>

			<!-- Box Mensagens Aluno -->
			<c:import url="../mensagens/mensagensBox.jsp"></c:import>

			<!-- Início do cabecalho de filtro -->
			<t:div id="conteudoPesquisar">

				<!-- Início da Pesquisa -->
				<t:div id="painelPesquisaAvancada"
					rendered="#{alunoNavegacaoBean.pesquisaAvancada}">

					<t:div styleClass="roundedcornr_box">
						<t:div styleClass="roundedcornr_top">
							<t:div></t:div>
						</t:div>
						<t:div styleClass="roundedcornr_content">

							<t:panelGrid columns="2" styleClass="filtroPesquisarOportunidade">
								<t:column>
									<t:outputText value="#{msg.geral_optCod}:" styleClass="label"></t:outputText>
									<h:inputText size="4" maxlength="4" styleClass="box"
										value="#{pesquisaOportunidadeBB.oportunidadePorId.idopt}">
									</h:inputText>
								</t:column>

								<t:column>
									<t:graphicImage styleClass="box" url="/images/pesquisar25.png"
										title="#{msg.aluno_pesquisarOportunidades}">
										<a4j:support event="onclick"
											actionListener="#{pesquisaOportunidadeBB.pesquisarOportunidadePorCodigo}"
											reRender="listaOportunidades"></a4j:support>
									</t:graphicImage>
								</t:column>
							</t:panelGrid>

							<t:panelGrid columns="3" styleClass="filtroPesquisarOportunidade">

								<t:column>
									<t:outputText value="#{msg.geral_optNome}:" styleClass="label"></t:outputText>
									<t:inputText size="37" styleClass="box"
										value="#{pesquisaOportunidadeBB.oportunidade.nome}">
									</t:inputText>
								</t:column>

								<t:column>
									<t:outputText value="#{msg.geral_optTipo}:" styleClass="label"></t:outputText>
									<t:selectOneMenu id="idTipoOportunidade" styleClass="box"
										value="#{pesquisaOportunidadeBB.codigoTipoOportunidade}">
										<f:selectItems
											value="#{pesquisaOportunidadeBB.tiposOportunidade}" />
									</t:selectOneMenu>
								</t:column>

								<t:column>
									<t:outputText value="#{msg.geral_optPeriodo}:"
										styleClass="label"></t:outputText>
									<t:selectOneMenu id="idPeriodo" styleClass="box"
										value="#{pesquisaOportunidadeBB.oportunidade.periodo}">
										<f:selectItems value="#{pesquisaOportunidadeBB.periodos}" />

									</t:selectOneMenu>
								</t:column>
							</t:panelGrid>

							<t:panelGrid columns="3" styleClass="filtroPesquisarOportunidade">

								<t:column>
									<t:outputText value="#{msg.geral_nivel}:" styleClass="label"></t:outputText>
									<t:selectOneMenu id="idNivel" styleClass="box"
										value="#{pesquisaOportunidadeBB.nivelCursoSelecionado}">
										<f:selectItems
											value="#{pesquisaOportunidadeBB.listNivelCurso}" />
										<a4j:support event="onchange" reRender="idCursos"></a4j:support>
									</t:selectOneMenu>
								</t:column>

								<t:column>
									<t:outputText value="#{msg.geral_curso}:" styleClass="label"></t:outputText>
									<t:selectOneMenu id="idCursos" styleClass="box"
										value="#{pesquisaOportunidadeBB.idCurso}">
										<f:selectItems value="#{pesquisaOportunidadeBB.cursos}" />
									</t:selectOneMenu>
								</t:column>

								<t:column>
									<t:graphicImage styleClass="box" url="/images/pesquisar25.png"
										title="#{msg.aluno_pesquisarOportunidades}">
										<a4j:support event="onclick"
											actionListener="#{pesquisaOportunidadeBB.pesquisarOportunidade}"
											reRender="listaOportunidades"></a4j:support>
									</t:graphicImage>
								</t:column>

							</t:panelGrid>



							<!-- Opção desabilitada
								<a4j:commandLink
									action="#{pesquisaOportunidadeBean.obterDetalhesOportunidadeSelecionada}"
									reRender="conteudo">
									<t:graphicImage url="/images/detalhe20.png" title="Detalhes"></t:graphicImage>
								</a4j:commandLink>
								 -->
						</t:div>
						<t:div styleClass="roundedcornr_bottom">
							<t:div></t:div>
						</t:div>
					</t:div>

				</t:div>
				<!-- Fim da Pesquisa Avancada -->
			</t:div>
		</a4j:form>
		<a4j:form>
			<!-- Fim do cabecalho de filtro -->

			<!-- Início da Tabela de Oportunidades -->

			<t:div id="listaOportunidades">
				<rich:dataTable id="dtOportunidades"
					value="#{pesquisaOportunidadeBB.oportunidades}" var="oportunidade"
					rendered="#{not empty pesquisaOportunidadeBB.oportunidades}"
					rowClasses="linha1, linha2" rows="10" styleClass="dataTablePadrao">

					<!-- Codigo -->
					<rich:column sortBy="#{oportunidade.idopt}" sortOrder="DESCENDING"
						width="15px" styleClass="coluna">
						<f:facet name="header">
							<h:outputText value="#{msg.geral_optCod}" />
						</f:facet>
						<h:outputText value="#{oportunidade.idopt}"></h:outputText>
					</rich:column>

					<!-- Nome -->
					<rich:column sortBy="#{oportunidade.nome}" width="400px"
						styleClass="coluna">
						<f:facet name="header">
							<h:outputText value="#{msg.geral_optNome}" />
						</f:facet>

						<a4j:commandLink
							action="#{pesquisaOportunidadeBean.exibirOportunidadeSelecionada}"
							reRender="conteudo" styleClass="link">
							<h:outputText value="#{oportunidade.nome}"></h:outputText>
							<f:setPropertyActionListener value="#{oportunidade}"
								target="#{pesquisaOportunidadeBean.oportunidadeSelecionada}"></f:setPropertyActionListener>
						</a4j:commandLink>

					</rich:column>

					<!-- Tipo -->
					<rich:column sortBy="#{oportunidade.tipooportunidade}"
						styleClass="coluna">
						<f:facet name="header">
							<h:outputText value="#{msg.geral_optTipo}" />
						</f:facet>
						<h:outputText value="#{oportunidade.tipooportunidade.nometipoopt}"></h:outputText>
					</rich:column>

					<!-- Periodo -->
					<rich:column styleClass="coluna" sortBy="#{oportunidade.periodo}">
						<f:facet name="header">
							<h:outputText value="#{msg.geral_optPeriodo}" />
						</f:facet>
						<h:outputText value="#{oportunidade.periodo}"></h:outputText>
					</rich:column>

				</rich:dataTable>
				<rich:datascroller for="dtOportunidades" maxPages="20"
					rendered="#{not empty pesquisaOportunidadeBB.oportunidades}"></rich:datascroller>

				<t:div styleClass="mensageListaVazia"
					rendered="#{empty pesquisaOportunidadeBB.oportunidades}">
					<t:graphicImage url="/images/aviso20.png" styleClass="imagem" />
					<h:outputText value="#{msg.geral_avisoSemOportunidade}"></h:outputText>
				</t:div>

			</t:div>
			<!-- Fim da Tabela de Oportunidades -->
		</a4j:form>
	</h:panelGroup>

</f:subview>
