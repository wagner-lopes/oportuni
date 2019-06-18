<%@ taglib uri="http://richfaces.org/rich" prefix="rich"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ taglib uri="http://myfaces.apache.org/tomahawk" prefix="t"%>
<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j"%>
<%@ taglib uri="http://jsftutorials.net/htmLib" prefix="htm"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>


<f:subview id="minhasOportunidades">
	<f:loadBundle basename="mensagens" var="msg" />

	<h:panelGroup id="pGroupMinhasOportunidades"
		rendered="#{alunoNavegacaoBean.minhasOportunidades}">
		<a4j:form>
			<t:div id="corpoMinhasOportunidades">

				<!-- Cabecalho -->
				<t:div styleClass="cabecalhoSubView">
					<t:div styleClass="tituloSubView">
						<h:graphicImage styleClass="imagemTituloSubView"
							url="/images/minhasOpts45.png"
							title="#{msg.aluno_minhasOportunidades}" />
						<h:outputText value="#{msg.aluno_minhasOportunidades}" />
					</t:div>
					<t:div>
						<rich:separator height="3px"></rich:separator>
					</t:div>
				</t:div>

				<!-- Menu do conteudo Minhas Oportunidades-->
				<t:div id="menuAlunoMinhasOportunidades"
					rendered="#{not empty alunoMinhasOptBB.minhasOportunidades}">
					<t:div styleClass="roundedcornr_box">
						<t:div styleClass="roundedcornr_top">
							<t:div></t:div>
						</t:div>
						<t:div styleClass="roundedcornr_content">
							<!-- Botao desativado 
							<a4j:commandLink action="#{alunoNavegacaoBean.voltar}"
								reRender="conteudo">
								<t:graphicImage url="/images/voltar20.png"
									styleClass="iconeMenu" title="#{msg.geral_voltar}"></t:graphicImage>
							</a4j:commandLink>
							-->
							<a4j:commandLink styleClass="iconeMenu"
								onclick="if(!confirm('Você será excluído da lista de candidatos das oportunidades selecionadas.')) {form.reset(); return false;}"
								rendered="#{alunoMinhasOptBB.botaoExcluir}"
								action="#{alunoMinhasOptBB.excluiMinhaOportunidade}"
								reRender="corpoMinhasOportunidades, boxCandidaturas">
								<t:graphicImage url="/images/excluir20.png"
									title="#{msg.aluno_cancelarCandidatura}"></t:graphicImage>
							</a4j:commandLink>

							<t:graphicImage url="/images/excluir20desabilitado.png"
								title="#{msg.aluno_avisoCancelarCandidatura}"
								rendered="#{not alunoMinhasOptBB.botaoExcluir}"></t:graphicImage>

						</t:div>
						<t:div styleClass="roundedcornr_bottom">
							<t:div></t:div>
						</t:div>
					</t:div>
				</t:div>

				<!-- Box Mensagens -->
				<c:import url="../mensagens/mensagensBox.jsp"></c:import>

				<!-- Corpo Minhas Oportunidades -->
				<t:div id="listaMinhasOportunidades">

					<rich:dataTable id="dtMinhasOportunidades"
						value="#{alunoMinhasOptBB.minhasOportunidades}" var="minhasOpts"
						rendered="#{not empty alunoMinhasOptBB.minhasOportunidades}"
						rowClasses="linha1, linha2" rows="10" styleClass="dataTablePadrao">

						<!-- CheckBox -->
						<rich:column styleClass="coluna" width="5%">

							<f:facet name="header">
								<h:graphicImage url="/images/selecionar20.png"
									title="#{msg.geral_selecionarDeselecionar}">
									<a4j:support event="onclick"
										action="#{alunoMinhasOptBB.selecionarDeselecionarTodosCheckBox}"
										reRender="listaMinhasOportunidades, menuAlunoMinhasOportunidades"></a4j:support>
								</h:graphicImage>
							</f:facet>

							<h:selectBooleanCheckbox
								value="#{alunoMinhasOptBB.optsSelecionadas[minhasOpts.id]}">
								<a4j:support event="onclick"
									reRender="menuAlunoMinhasOportunidades"></a4j:support>

							</h:selectBooleanCheckbox>
						</rich:column>

						<!--  Codigo -->
						<rich:column sortBy="#{minhasOpts.id.idopt}" sortOrder="DESCENDING"
							width="15px" styleClass="coluna">
							<f:facet name="header">
								<h:outputText value="#{msg.geral_optCod}"></h:outputText>
							</f:facet>
							<h:outputText value="#{minhasOpts.oportunidade.idopt}"></h:outputText>
						</rich:column>


						<!-- Nome -->
						<rich:column sortBy="#{minhasOpts.oportunidade.nome}"
							width="400px" styleClass="coluna">
							<f:facet name="header">
								<h:outputText
									value="#{msg.geral_optNome}"></h:outputText>
							</f:facet>
							<a4j:commandLink
								actionListener="#{alunoNavegacaoBean.renderizarExibirMinhaOportunidade}"
								reRender="conteudo" styleClass="link">
								<h:outputText value="#{minhasOpts.oportunidade.nome}"></h:outputText>
								<f:setPropertyActionListener value="#{minhasOpts}"
									target="#{alunoMinhasOptBB.optAlunoSelecionada}"></f:setPropertyActionListener>
							</a4j:commandLink>
						</rich:column>

						<!--  Tipo -->
						<rich:column sortBy="#{minhasOpts.oportunidade.tipooportunidade}"
							styleClass="coluna">
							<f:facet name="header">
								<h:outputText
									value="#{msg.geral_optTipo}"></h:outputText>
							</f:facet>
							<h:outputText
								value="#{minhasOpts.oportunidade.tipooportunidade.nometipoopt}"></h:outputText>
						</rich:column>

						<!-- Periodo -->
						<rich:column sortBy="#{minhasOpts.oportunidade.periodo}"
							styleClass="coluna">
							<f:facet name="header">
								<h:outputText
									value="#{msg.geral_optPeriodo}"></h:outputText>
							</f:facet>
							<h:outputText value="#{minhasOpts.oportunidade.periodo}"></h:outputText>
						</rich:column>

					</rich:dataTable>

					<t:div styleClass="mensageListaVazia"
						rendered="#{empty alunoMinhasOptBB.minhasOportunidades}">
						<t:graphicImage url="/images/aviso20.png" styleClass="imagem" />
						<h:outputText value="#{msg.geral_avisoSemOportunidade}"></h:outputText>
					</t:div>

				</t:div>
			</t:div>
		</a4j:form>
	</h:panelGroup>

</f:subview>
