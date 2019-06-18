<%@ taglib uri="http://richfaces.org/rich" prefix="rich"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ taglib uri="http://myfaces.apache.org/tomahawk" prefix="t"%>
<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j"%>
<%@ taglib uri="http://jsftutorials.net/htmLib" prefix="htm"%>
<%@ taglib uri="http://stella.caelum.com.br/faces" prefix="stella"%>


<f:subview id="curriculoCandidato">
	<f:loadBundle basename="mensagens" var="msg" />

	<h:panelGroup id="mp_globalCandidatos"
		rendered="#{responsavelNavegacaoBean.curriculo}">

		<!-- Cabecalho  -->
		<t:div styleClass="cabecalhoSubView">
			<t:div styleClass="tituloSubView">
				<h:graphicImage styleClass="imagemTituloSubView"
					url="/images/curriculo45.png" title="Curriculo" />
				<h:outputText value="#{msg.geral_curriculo}" />
			</t:div>
			<rich:separator height="3px"></rich:separator>
		</t:div>

		<!-- Menu -->
		<t:div id="barraMenuCurriculo">
			<t:div styleClass="roundedcornr_box">
				<t:div styleClass="roundedcornr_top">
					<t:div></t:div>
				</t:div>
				<t:div styleClass="roundedcornr_content">
					<a4j:form>
						<a4j:commandLink action="#{responsavelNavegacaoBean.voltar}"
							reRender="conteudoResponsavel">
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

		<!-- Nome Aluno -->
		<t:div styleClass="nomeAlunoCurriculoVisualizacao">
			<h:outputText value="#{curriculoBean.alunoSelecionado.nome}" />
		</t:div>

		<!-- Dados Pessoais -->
		<t:div styleClass="topicoCurriculo">
			<t:div styleClass="linhaDivisoriaTopicoCurriculo">
				<h:outputText value="#{msg.geral_curriculoDadosPessoais}" />
			</t:div>
		</t:div>

		<t:div styleClass="conteudoItemCurriculoVisualizacao">
			<t:div styleClass="conteudoItemCurriculo">
				<!-- Email -->
				<t:div styleClass="itemCurriculo">
					<h:outputText value="#{msg.geral_email}:" styleClass="labelItemCurriculo"></h:outputText>
					<h:outputLink
						value="mailto:#{curriculoBean.alunoSelecionado.email}">
						<h:outputText value="#{curriculoBean.alunoSelecionado.email}"
							styleClass="valorItemCurriculo" />
					</h:outputLink>
				</t:div>

				<!-- Telefone -->
				<t:div styleClass="itemCurriculo">
					<h:outputText value="#{msg.geral_alunoTelefone}:" styleClass="labelItemCurriculo"></h:outputText>
					<h:outputText value="#{curriculoBean.alunoSelecionado.telefone}"
						styleClass="valorItemCurriculo" />
				</t:div>
			</t:div>
		</t:div>


		<!-- Formação acadêmica atual -->
		<t:div styleClass="topicoCurriculo">
			<t:div styleClass="linhaDivisoriaTopicoCurriculo">
				<h:outputText value="#{msg.geral_curriculoFormAcademicaAtual}" />
			</t:div>
		</t:div>

		<t:div styleClass="conteudoItemCurriculoVisualizacao">
			<t:div styleClass="conteudoItemCurriculo">
				<!-- Curso -->
				<t:div styleClass="itemCurriculo">
					<h:outputText value="#{msg.geral_alunoCurso}:" styleClass="labelItemCurriculo"></h:outputText>
					<h:outputText value="#{curriculoBean.alunoSelecionado.curso.nome}"
						styleClass="valorItemCurriculo" />
				</t:div>

				<!-- Nível -->
				<t:div styleClass="itemCurriculo">
					<h:outputText value="#{msg.geral_nivel}:" styleClass="labelItemCurriculo"></h:outputText>
					<h:outputText value="#{curriculoBean.alunoSelecionado.curso.nivel}"
						styleClass="valorItemCurriculo" />
				</t:div>

				<!-- Período -->
				<t:div styleClass="itemCurriculo">
					<h:outputText value="#{msg.geral_alunoPeriodo}:" styleClass="labelItemCurriculo"></h:outputText>
					<h:outputText value="#{curriculoBean.alunoSelecionado.periodo}"
						styleClass="valorItemCurriculo" />
				</t:div>
			</t:div>
		</t:div>



		<!-- Formação acadêmica anterior -->
		<t:div styleClass="topicoCurriculo">
			<t:div styleClass="linhaDivisoriaTopicoCurriculo">
				<h:outputText value="#{msg.geral_curriculoFormAcademicaAnterior}" />
			</t:div>
		</t:div>

		<t:div id="listaFormacaoAcademicaAnterior">
			<rich:dataTable styleClass="dataTableItemCurriculo"
				rendered="#{not empty curriculoBean.formacaoAnterior}"
				value="#{curriculoBean.formacaoAnterior}" id="dtFormAnt"
				var="formAnt">

			
				<rich:column styleClass="conteudoItemCurriculo">
						<!-- Curso -->
						<t:div styleClass="itemCurriculo">
							<h:outputText value="#{msg.geral_alunoCurso}:" styleClass="labelItemCurriculo"></h:outputText>
							<h:outputText value="#{formAnt.curso.nome}"
								styleClass="valorItemCurriculo" />
						</t:div>

						<!-- Nivel -->
						<t:div styleClass="itemCurriculo">
							<h:outputText value="#{msg.geral_nivel}:" styleClass="labelItemCurriculo"></h:outputText>
							<h:outputText value="#{formAnt.curso.nivel}"
								styleClass="valorItemCurriculo" />
						</t:div>


						<t:div styleClass="itemCurriculo">
							<!-- Data Inicio -->
							<h:outputText value="#{msg.geral_curriculoFormAcademicaAnteriorAnoInicio}:" styleClass="labelItemCurriculo"></h:outputText>
							<h:outputText value="#{formAnt.anoinicio}"
								styleClass="valorItemCurriculo" />

							<!-- Data Fim -->
							<h:outputText value="#{msg.geral_curriculoFormAcademicaAnteriorAnoFim}:" styleClass="labelItemCurriculo"></h:outputText>
							<h:outputText value="#{formAnt.anofim}"
								styleClass="valorItemCurriculo" />
						</t:div>

						<!-- Universidade -->
						<t:div styleClass="itemCurriculo">
							<h:outputText value="#{msg.geral_curriculoFormAcademicaAnteriorUniversidade}:"
								styleClass="labelItemCurriculo"></h:outputText>
							<h:outputText value="#{formAnt.universidade}"
								styleClass="valorItemCurriculo" />
						</t:div>
				</rich:column>

			</rich:dataTable>

			<!-- Mensagem lista vazia -->
			<t:div styleClass="mensageListaVazia"
				rendered="#{empty curriculoBean.formacaoAnterior}">
				<t:graphicImage url="/images/aviso20.png" styleClass="imagem" />
				<h:outputText
					value="#{msg.geral_curriculoAvisoSemFormAcademicaAnterior}"></h:outputText>
			</t:div>
		</t:div>

		<!-- Formação Complementar -->
		<t:div styleClass="topicoCurriculo">
			<t:div styleClass="linhaDivisoriaTopicoCurriculo">
				<h:outputText value="#{msg.geral_curriculoFormComp}" />
			</t:div>
		</t:div>

		<t:div id="listaFormacaoComplementar">

			<rich:dataTable styleClass="dataTableItemCurriculo"
				rendered="#{not empty curriculoBean.formacaoComplementar}"
				value="#{curriculoBean.formacaoComplementar}" id="dtFormComp"
				var="formComp">

				<rich:column styleClass="conteudoItemCurriculo">
					<!-- Curso -->
					<t:div styleClass="itemCurriculo">
						<h:outputText value="#{msg.geral_curriculoFormCompCurso}:" styleClass="labelItemCurriculo" />
						<h:outputText value="#{formComp.nomecurso} "
							styleClass="valorItemCurriculo" />
					</t:div>


					<t:div styleClass="itemCurriculo">
						<!-- Ano Inicio -->
						<h:outputText value="#{msg.geral_curriculoFormCompAnoInicio}:" styleClass="labelItemCurriculo" />
						<h:outputText value="#{formComp.anoini}"
							styleClass="valorItemCurriculo" />

						<!-- Ano Fim -->
						<h:outputText value="#{msg.geral_curriculoFormCompAnoFim}:" styleClass="labelItemCurriculo" />
						<h:outputText value="#{formComp.anofim}"
							styleClass="valorItemCurriculo" />
					</t:div>

					<!-- Instituicao -->
					<t:div styleClass="itemCurriculo">
						<h:outputText value="#{msg.geral_curriculoFormCompInstituicao}:" styleClass="labelItemCurriculo" />
						<h:outputText value="#{formComp.instituicao}"
							styleClass="valorItemCurriculo" />
					</t:div>

					<!-- Carga Horaria -->
					<t:div styleClass="itemCurriculo">
						<h:outputText value="#{msg.geral_curriculoFormCompCargaHoraria}:"
							styleClass="labelItemCurriculo"></h:outputText>
						<h:outputText value="#{formComp.cargahoraria}"
							styleClass="valorItemCurriculo" />
					</t:div>
				</rich:column>

			</rich:dataTable>

			<!-- Mensagem lista vazia -->
			<t:div styleClass="mensageListaVazia"
				rendered="#{empty curriculoBean.formacaoComplementar}">
				<t:graphicImage url="/images/aviso20.png" styleClass="imagem" />
				<h:outputText value="#{msg.geral_curriculoAvisoSemFormComp}"></h:outputText>
			</t:div>
		</t:div>

		<!-- Experiências Profissionais -->
		<t:div styleClass="topicoCurriculo">
			<t:div styleClass="linhaDivisoriaTopicoCurriculo">
				<h:outputText value="#{msg.geral_curriculoExpProf}" />
			</t:div>
		</t:div>

		<t:div id="listaExperienciaProfissional">


			<rich:dataTable styleClass="dataTableItemCurriculo"
				rendered="#{not empty curriculoBean.experienciaProfissional}"
				value="#{curriculoBean.experienciaProfissional}" id="dtExpProf"
				var="expProf">

				<rich:column styleClass="conteudoItemCurriculo">
					<t:div styleClass="itemCurriculo">
						<!-- Data Inicio -->
						<h:outputText value="#{msg.geral_curriculoExpProfDataInicio}:" styleClass="labelItemCurriculo"></h:outputText>
						<h:outputText value="#{expProf.dataini}"
							styleClass="valorItemCurriculo" />

						<!-- Data Fim -->
						<h:outputText value="#{msg.geral_curriculoExpProfDataFim}:" styleClass="labelItemCurriculo"></h:outputText>
						<h:outputText value="#{expProf.datafim}"
							styleClass="valorItemCurriculo" />
					</t:div>

					<!-- Instituicao -->
					<t:div styleClass="itemCurriculo">
						<h:outputText value="#{msg.geral_curriculoExpProfInstituicao}:" styleClass="labelItemCurriculo"></h:outputText>
						<h:outputText value="#{expProf.instituicao}"
							styleClass="valorItemCurriculo" />
					</t:div>

					<!-- Atividades -->
					<t:div styleClass="itemCurriculo">
						<h:outputText value="#{msg.geral_curriculoExpProfAtividades}:" styleClass="labelItemCurriculo"></h:outputText>
					</t:div>

					<rich:editor value="#{expProf.atividades}" readonly="true"
						theme="advanced" width="670" height="300"></rich:editor>
					<f:param name="theme_advanced_buttons1" value="" />
					<f:param name="theme_advanced_buttons2" value="" />
					<f:param name="theme_advanced_buttons3" value="" />

					<rich:spacer height="5px"></rich:spacer>
				</rich:column>

			</rich:dataTable>

			<!-- Mensagem lista vazia -->
			<t:div styleClass="mensageListaVazia"
				rendered="#{empty curriculoBean.experienciaProfissional}">
				<t:graphicImage url="/images/aviso20.png" styleClass="imagem" />
				<h:outputText
					value="#{msg.geral_curriculoAvisoSemExpProf}"></h:outputText>
			</t:div>
		</t:div>

		<!-- Idiomas -->
		<t:div styleClass="topicoCurriculo">
			<t:div styleClass="linhaDivisoriaTopicoCurriculo">
				<h:outputText value="#{msg.geral_curriculoIdiomas}" />
			</t:div>
		</t:div>

		<t:div id="listaIdiomasAluno">
			<rich:dataTable styleClass="dataTableItemCurriculo"
				rendered="#{not empty curriculoBean.idioma}"
				value="#{curriculoBean.idioma}" id="dtIdiomasAluno" var="idioma">

				<rich:column styleClass="conteudoItemCurriculo">
					<!-- Idioma -->
					<t:div styleClass="cabecalhoItemCurriculo">
						<h:outputText value="#{msg.geral_curriculoIdioma}:"
							styleClass="labelCabecalhoItemCurriculo"></h:outputText>
						<h:outputText value="#{idioma.idioma.nome}"
							styleClass="valorCabecalhoItemCurriculo" />
					</t:div>

					<!-- Le -->
					<t:div styleClass="itemCurriculo">
						<h:outputText value="#{msg.geral_curriculoIdiomaLe}:" styleClass="labelItemCurriculo"></h:outputText>
						<h:outputText value="#{idioma.nivelLeitura}"
							styleClass="valorItemCurriculo" />
					</t:div>

					<!-- Fala -->
					<t:div styleClass="itemCurriculo">
						<h:outputText value="#{msg.geral_curriculoIdiomaFala}:" styleClass="labelItemCurriculo"></h:outputText>
						<h:outputText value="#{idioma.nivelConversacao} "
							styleClass="valorItemCurriculo" />
					</t:div>

					<!--Escreve -->
					<t:div styleClass="itemCurriculo">
						<h:outputText value="#{msg.geral_curriculoIdiomaEscreve}:" styleClass="labelItemCurriculo"></h:outputText>
						<h:outputText value="#{idioma.nivelEscrita} "
							styleClass="valorItemCurriculo" />
					</t:div>

					<!-- Compreende -->
					<t:div styleClass="itemCurriculo">
						<h:outputText value="#{msg.geral_curriculoIdiomaCompreende}:" styleClass="labelItemCurriculo"></h:outputText>
						<h:outputText value="#{idioma.nivelCompreensao}"
							styleClass="valorItemCurriculo" />
					</t:div>
				</rich:column>

			</rich:dataTable>

			<!-- Mensagem lista vazia -->
			<t:div styleClass="mensageListaVazia"
				rendered="#{empty curriculoBean.idioma}">
				<t:graphicImage url="/images/aviso20.png" styleClass="imagem" />
				<h:outputText value="#{msg.geral_curriculoAvisoSemIdioma}"></h:outputText>
			</t:div>
		</t:div>
	</h:panelGroup>

</f:subview>
