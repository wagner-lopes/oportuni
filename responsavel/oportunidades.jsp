<%@ taglib uri="http://richfaces.org/rich" prefix="rich"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ taglib uri="http://myfaces.apache.org/tomahawk" prefix="t"%>
<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j"%>
<%@ taglib uri="http://jsftutorials.net/htmLib" prefix="htm"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>


<f:subview id="oportunidadesResponsavel">
	<f:loadBundle basename="mensagens" var="msg" />

	<h:panelGroup id="mp_globalOportunidadesResp"
		rendered="#{responsavelNavegacaoBean.oportunidades}">
		<a4j:form id="listaOportunidadesResp">
			<t:div styleClass="cabecalhoSubView">
				<t:div styleClass="tituloSubView">
					<h:graphicImage url="/images/logoOportuni3D50.png"
						styleClass="imagemTituloSubView"
						title="#{msg.responsavel_linkOportunidades}" />
					<h:outputText value="#{msg.responsavel_linkOportunidades}" />
				</t:div>
				<t:div>
					<rich:separator height="3px"></rich:separator>
				</t:div>
			</t:div>
			<t:div id="barraMenu">
				<t:div styleClass="roundedcornr_box">
					<t:div styleClass="roundedcornr_top">
						<t:div></t:div>
					</t:div>
					<t:div styleClass="roundedcornr_content">
						<a4j:commandLink
							actionListener="#{responsavelNavegacaoBean.renderizaNovaOportunidade}"
							action="#{responsavelOportunidadesBean.inicializaNovaOpt}"
							reRender="conteudoResponsavel">
							<h:graphicImage url="/images/novo20.png" styleClass="iconeMenu"
								title="#{msg.responsavel_novaOportunidade}" />
						</a4j:commandLink>

						<a4j:commandLink id="excluirOportunidade"
							rendered="#{responsavelOportunidadesBean.botaoExcluir and responsavelOportunidadesBean.opcaoExcluir}"
							action="#{responsavelOportunidadesBean.excluirOportunidades}"
							onclick="if(!confirm('As oportunidades selecionadas serão excluídas.')) {form.reset(); return false;}"
							reRender="conteudoResponsavel">
							<t:graphicImage url="/images/excluir20.png"
								styleClass="iconeMenu" title="#{msg.geral_excluir}"></t:graphicImage>
						</a4j:commandLink>

						<t:graphicImage styleClass="iconeMenu"
							url="/images/excluir20desabilitado.png"
							title="#{msg.responsavel_avisoExcluir}"
							rendered="#{not responsavelOportunidadesBean.botaoExcluir and responsavelOportunidadesBean.opcaoExcluir}"></t:graphicImage>


						<!-- Funcionalidades desativadas na tela principal
						<a4j:commandLink id="exibirOportunidade"
							action="#{responsavelOportunidadesBean.exibirOportunidade}"
							reRender="conteudoResponsavel">
							<t:graphicImage url="/images/detalhe20.png"
								styleClass="iconeMenu" title="#{msg.geral_exibir}"></t:graphicImage>
						</a4j:commandLink>

						<a4j:commandLink id="editarOportunidade"
							rendered="#{responsavelOportunidadesBean.opcaoEditar}"
							action="#{responsavelOportunidadesBean.editarOportunidade}"
							reRender="conteudoResponsavel">
							<t:graphicImage url="/images/editar30.png" styleClass="iconeMenu"
								title="#{msg.geral_editar}"></t:graphicImage>
						</a4j:commandLink>

						
						<a4j:commandLink id="verCandidatos"
							rendered="#{responsavelOportunidadesBean.opcaoCandidatos}"
							action="#{responsavelOportunidadesBean.verCandidatos}"
							actionListener="#{responsavelCandidatosBean.selecionaCandidatosOportunidade}"
							reRender="conteudoResponsavel">
							<h:graphicImage url="/images/candidatos20.png"
								styleClass="iconeMenu" title="#{msg.responsavel_menuCandidatos}" />
						</a4j:commandLink>
						 
						<a4j:commandLink id="publicarOportunidade"
							rendered="#{responsavelOportunidadesBean.opcaoPublicar}"
							onclick="if(!confirm('Após a publicação, as oportunidades não poderão ser editadas. Deseja continuar?')) {form.reset(); return false;}"
							action="#{responsavelOportunidadesBean.publicarOportunidades}"
							reRender="conteudoResponsavel">
							<h:graphicImage url="/images/publicar20.png"
								styleClass="iconeMenu" title="#{msg.responsavel_publicar}" />
						</a4j:commandLink>
						
						<a4j:commandLink id="enviarMensagem"
							action="#{responsavelOportunidadesBean.inicializaEnvioMensagem}"
							rendered="#{responsavelOportunidadesBean.opcaoEnviarMensagem}"
							actionListener="#{responsavelCandidatosBean.selecionaCandidatosOportunidade}"
							reRender="conteudoResponsavel">
							<h:graphicImage url="/images/enviarMensagem20.png"
								styleClass="iconeMenu" title="#{msg.responsavel_enviarMensagem}" />
						</a4j:commandLink>
						-->

						<a4j:commandLink id="finalizarOportunidade"
							action="#{responsavelOportunidadesBean.finalizaOportunidade}"
							rendered="#{responsavelOportunidadesBean.opcaoFinalizar and responsavelOportunidadesBean.botaoFinalizar}"
							onclick="if(!confirm('As oportunidades selecionadas serão finalizadas.')) {form.reset(); return false;}"
							reRender="conteudoResponsavel">
							<h:graphicImage url="/images/finalizar.png"
								styleClass="iconeMenu" title="#{msg.responsavel_finalizar}" />
						</a4j:commandLink>

						<t:graphicImage styleClass="iconeMenu"
							url="/images/finalizarDesabilitado.png"
							title="#{msg.responsavel_avisoFinalizar}"
							rendered="#{not responsavelOportunidadesBean.botaoFinalizar and responsavelOportunidadesBean.opcaoFinalizar}"></t:graphicImage>


						<t:panelGrid id="filtroStatus" columns="2"
							styleClass="opcaoMenuBoxDireita">
							<h:outputText value="#{msg.responsavel_exibirOportunidades}" styleClass="label1"></h:outputText>
							<h:selectOneMenu value="#{responsavelOportunidadesBean.idStatus}">
								<f:selectItems
									value="#{responsavelOportunidadeBB.opcaoStatusOportunidade}" />
								<a4j:support event="onchange"
									actionListener="#{responsavelOportunidadesBean.selecionaOportunidadesResp}"
									reRender="mp_globalOportunidadesResp"></a4j:support>
							</h:selectOneMenu>
						</t:panelGrid>

					</t:div>
					<t:div styleClass="roundedcornr_bottom">
						<t:div></t:div>
					</t:div>

				</t:div>
			</t:div>

			<rich:spacer height="3px"></rich:spacer>

			<!-- Mensagens Oportuni -->
			<c:import url="../mensagens/mensagensBox.jsp"></c:import>
			<!-- Fim das mensagens -->


			<rich:spacer height="10px"></rich:spacer>

			<!-- Início da Tabela de Oportunidades -->
			<t:div id="tabelaOportunidadesResp"
				rendered="#{not empty responsavelOportunidadesBean.oportunidades}">


				<!-- Tabela para as oportunidades editáveis -->
				<rich:dataTable id="tabOptEditaveis" rows="10"
					styleClass="dataTablePadrao" rowClasses="linha1, linha2"
					value="#{responsavelOportunidadesBean.oportunidades}"
					var="oportunidade"
					rendered="#{responsavelOportunidadesBean.tabelaEditaveis}">

					<!-- CheckBox -->
					<rich:column styleClass="coluna" width="5%">
						<f:facet name="header">
							<h:graphicImage url="/images/selecionar20.png"
								title="#{msg.geral_selecionarDeselecionar}">
								<a4j:support event="onclick"
									action="#{responsavelOportunidadesBean.selecionarDeselecionarTodosCheckBox}"
									reRender="tabOptEditaveis, barraMenu"></a4j:support>
							</h:graphicImage>
						</f:facet>
						<h:selectBooleanCheckbox
							value="#{responsavelOportunidadesBean.optSelecionadas[oportunidade.idopt]}">
							<a4j:support event="onclick" reRender="barraMenu"></a4j:support>
						</h:selectBooleanCheckbox>
					</rich:column>

					<!-- Codigo -->
					<rich:column sortBy="#{oportunidade.idopt}" sortOrder="DESCENDING"
						styleClass="coluna" width="5%">
						<f:facet name="header">
							<h:outputText value="#{msg.geral_optCod}" />
						</f:facet>
						<h:outputText value="#{oportunidade.idopt}"></h:outputText>
					</rich:column>

					<!-- Nome -->
					<rich:column styleClass="coluna" width="50%"
						sortBy="#{oportunidade.nome}">
						<f:facet name="header">
							<h:outputText value="#{msg.geral_optNome}" />
						</f:facet>

						<a4j:commandLink id="exibirOportunidade"
							action="#{responsavelOportunidadesBean.exibirOportunidadePeloNome}"
							reRender="conteudoResponsavel" styleClass="link">
							<h:outputText value="#{oportunidade.nome}"></h:outputText>
							<f:setPropertyActionListener value="#{oportunidade}"
								target="#{responsavelOportunidadesBean.oportunidadeSelecionada}"></f:setPropertyActionListener>
						</a4j:commandLink>
					</rich:column>

					<!-- Tipo -->
					<rich:column styleClass="coluna" width="20%"
						sortBy="#{oportunidade.tipooportunidade}">
						<f:facet name="header">
							<h:outputText value="#{msg.geral_optTipo}" />
						</f:facet>
						<h:outputText value="#{oportunidade.tipooportunidade.nometipoopt}"></h:outputText>
					</rich:column>

					<!-- Status -->
					<rich:column styleClass="coluna" width="20%">
						<f:facet name="header">
							<h:outputText value="#{msg.geral_optStatus}" />
						</f:facet>
						<h:outputText value="#{oportunidade.statusOportunidade}"
							styleClass="#{oportunidade.styleStatus}"></h:outputText>
					</rich:column>
				</rich:dataTable>

				<rich:datascroller for="tabOptEditaveis" maxPages="20"
					rendered="#{responsavelOportunidadesBean.tabelaEditaveis}"
					stepControls="auto" ajaxSingle="false"></rich:datascroller>


				<!-- Tabela para as oportunidades não editáveis -->
				<rich:dataTable id="tabOptNaoEditaveis"
					styleClass="dataTablePadrao" rowClasses="linha1, linha2"
					rows="10"
					rendered="#{not responsavelOportunidadesBean.tabelaEditaveis}"
					value="#{responsavelOportunidadesBean.oportunidades}"
					onRowMouseOver="pointer:hand" var="oportunidade">

					<!-- CheckBox -->
					<rich:column styleClass="coluna" width="5%">
						<f:facet name="header">
							<h:graphicImage url="/images/selecionar20.png"
								title="#{msg.geral_selecionarDeselecionar}">
								<a4j:support event="onclick"
									action="#{responsavelOportunidadesBean.selecionarDeselecionarTodosCheckBox}"
									reRender="tabOptNaoEditaveis, barraMenu"></a4j:support>
							</h:graphicImage>
						</f:facet>
						<h:selectBooleanCheckbox
							value="#{responsavelOportunidadesBean.optSelecionadas[oportunidade.idopt]}">
							<a4j:support event="onclick" reRender="barraMenu"></a4j:support>
						</h:selectBooleanCheckbox>
					</rich:column>

					<!-- Codigo -->
					<rich:column sortBy="#{oportunidade.idopt}" styleClass="coluna"
						width="5%">
						<f:facet name="header">
							<h:outputText value="#{msg.geral_optCod}" />
						</f:facet>
						<h:outputText value="#{oportunidade.idopt}"></h:outputText>
					</rich:column>

					<!-- Nome -->
					<rich:column styleClass="coluna" sortBy="#{oportunidade.nome}"
						width="29%">
						<f:facet name="header">
							<h:outputText value="#{msg.geral_optNome}" />
						</f:facet>

						<a4j:commandLink id="exibirOportunidade"
							action="#{responsavelOportunidadesBean.exibirOportunidadePeloNome}"
							reRender="conteudoResponsavel" styleClass="link">
							<h:outputText value="#{oportunidade.nome}"></h:outputText>
							<f:setPropertyActionListener value="#{oportunidade}"
								target="#{responsavelOportunidadesBean.oportunidadeSelecionada}"></f:setPropertyActionListener>
						</a4j:commandLink>

					</rich:column>

					<!-- Tipo -->
					<rich:column styleClass="coluna"
						sortBy="#{oportunidade.tipooportunidade}" width="21%">
						<f:facet name="header">
							<h:outputText value="#{msg.geral_optTipo}" />
						</f:facet>
						<h:outputText value="#{oportunidade.tipooportunidade.nometipoopt}"></h:outputText>
					</rich:column>

					<!-- Publicacao -->
					<rich:column styleClass="coluna" width="10%"
						sortBy="#{oportunidade.dtini}">
						<f:facet name="header">
							<h:outputText value="Publicação" />
						</f:facet>
						<h:outputText value="#{oportunidade.dtini}"></h:outputText>
					</rich:column>

					<!-- Finalizacao -->
					<rich:column styleClass="coluna" width="10%"
						sortBy="#{oportunidade.dtfim}" sortOrder="ASCENDING">
						<f:facet name="header">
							<h:outputText value="Finalização" />
						</f:facet>
						<h:outputText value="#{oportunidade.dtfim}"></h:outputText>
					</rich:column>

					<!-- Status -->
					<rich:column styleClass="coluna" width="15%">
						<f:facet name="header">
							<h:outputText value="#{msg.geral_optStatus}" />
						</f:facet>
						<h:outputText value="#{oportunidade.statusOportunidade}"
							styleClass="#{oportunidade.styleStatus}"></h:outputText>
					</rich:column>
				</rich:dataTable>
				<rich:datascroller for="tabOptNaoEditaveis" maxPages="20"
					rendered="#{not responsavelOportunidadesBean.tabelaEditaveis}"
					stepControls="auto" ajaxSingle="false"></rich:datascroller>
			</t:div>
		</a4j:form>
		<!-- Fim da Tabela de Oportunidades -->
	</h:panelGroup>

</f:subview>
