<%@ taglib uri="http://richfaces.org/rich" prefix="rich"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ taglib uri="http://myfaces.apache.org/tomahawk" prefix="t"%>
<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j"%>
<%@ taglib uri="http://jsftutorials.net/htmLib" prefix="htm"%>
<%@ taglib uri="http://stella.caelum.com.br/faces" prefix="stella"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>


<f:subview id="meuCurriculo">
	<f:loadBundle basename="mensagens" var="msg" />

	<h:panelGroup id="mp_globalMeuCurriculo"
		rendered="#{alunoNavegacaoBean.meuCurriculo}">

		<t:div styleClass="cabecalhoSubView">
			<t:div styleClass="tituloSubView">
				<h:graphicImage styleClass="imagemTituloSubView"
					url="/images/curriculo45.png" title="#{msg.aluno_meuCurriculo}" />
				<h:outputText value="#{msg.aluno_meuCurriculo}">
				</h:outputText>
			</t:div>
			<rich:separator height="3px"></rich:separator>
		</t:div>


		<!-- Menu do conteudo Aluno Mensagens-->
		<!-- Barra desativada
		<t:div id="menuCurriculo">
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
					</a4j:form>
				</t:div>
				<t:div styleClass="roundedcornr_bottom">
					<t:div></t:div>
				</t:div>
			</t:div>
		</t:div>
		-->

		<t:div id="TabPanelOpcoes">
			<rich:tabPanel width="100%" headerAlignment="left">

				<!-- Dados Pessoais -->
				<rich:tab label="#{msg.geral_curriculoDadosPessoais}">
					<c:import url="dadosPessoais.jsp"></c:import>
				</rich:tab>

				<!-- Formacao Academica  -->
				<rich:tab label="#{msg.geral_curriculoFormAcademicas}"
					id="tabFormacaoAcademica"
					action="#{alunoFormacaoAcademicaBean.inicializar}">
					<c:import url="formacaoAcademica.jsp"></c:import>
				</rich:tab>

				<!-- Experiencia Profissional -->
				<rich:tab label="#{msg.geral_curriculoExpProfs}"
					id="tbExperienciasProfissionais"
					action="#{alunoExperienciaProfissionalBean.inicializar}">
					<c:import url="experienciaProfissional.jsp"></c:import>
				</rich:tab>

				<!-- Formacao Complementar -->
				<rich:tab label="#{msg.geral_curriculoFormComps}"
					action="#{alunoFormacaoComplementarBean.inicializar}">
					<c:import url="formacaoComplementar.jsp"></c:import>
				</rich:tab>

				<!-- Tab Idiomas -->
				<rich:tab label="#{msg.geral_curriculoIdiomas}"
					action="#{alunoIdiomasBean.inicializar}">
					<c:import url="idiomas.jsp"></c:import>
				</rich:tab>

				<!-- Tab Visualizar Curriculo -->
				<rich:tab label="#{msg.geral_curriculoExibicao}"
					action="#{curriculoBean.inicializar}">
					<t:div rendered="#{curriculoBean.exibeCurriculo}">
						<c:import url="visualizaCurriculo.jsp"></c:import>
					</t:div>
				</rich:tab>

			</rich:tabPanel>
		</t:div>

	</h:panelGroup>
</f:subview>

