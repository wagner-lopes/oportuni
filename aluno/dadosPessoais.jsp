<%@ taglib uri="http://richfaces.org/rich" prefix="rich"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ taglib uri="http://myfaces.apache.org/tomahawk" prefix="t"%>
<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j"%>
<%@ taglib uri="http://jsftutorials.net/htmLib" prefix="htm"%>
<%@ taglib uri="http://stella.caelum.com.br/faces" prefix="stella"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>



<f:subview id="curriculoDadosPessoais">
	<f:loadBundle basename="mensagens" var="msg" />

	<t:panelGroup id="pGroupDadosPessoais">
		<a4j:form>
			<a4j:loadScript src="../resources/jquerymask.js" />

			<!-- Menu Dados Pessoais-->
			<t:div styleClass="roundedcornr_box">
				<t:div styleClass="roundedcornr_top">
					<t:div></t:div>
				</t:div>
				<t:div styleClass="roundedcornr_content">
					<a4j:commandLink reRender="pGroupDadosPessoais"
						action="#{alunoDadosPessoaisBean.atualizarDadosPessoais}">
						<h:graphicImage url="/images/salvar20.png"
							title="#{msg.geral_Salvar}" />
					</a4j:commandLink>
				</t:div>
				<t:div styleClass="roundedcornr_bottom">
					<t:div></t:div>
				</t:div>
			</t:div>

			<!-- Box Mensagens -->
			<c:import url="../mensagens/mensagensBox.jsp"></c:import>

			<!-- Dados Pessoais -->

			<!-- Dados Principais -->
			<t:div styleClass="topicoCurriculo">
				<h:outputText value="#{msg.aluno_curriculoDadosPessoaisDadosPrincipais}"></h:outputText>
			</t:div>

			<t:div styleClass="dadosPessoais">
				<htm:table styleClass="table">

					<!-- Nome -->
					<htm:tr>
						<htm:td styleClass="tdLabel">
							<h:outputText styleClass="label1" value="#{msg.geral_alunoNome}"></h:outputText>
						</htm:td>
						<htm:td styleClass="tdConteudo">
							<h:inputText styleClass="texto2" size="40"
								value="#{alunoDadosPessoaisBean.loginAluno.aluno.nome}">
							</h:inputText>
						</htm:td>
					</htm:tr>

					<!-- Sexo -->
					<htm:tr>
						<htm:td styleClass="tdLabel">
							<h:outputText styleClass="label1" value="#{msg.geral_alunoSexo}"></h:outputText>
						</htm:td>
						<htm:td styleClass="tdConteudo">
							<h:selectOneRadio styleClass="texto2"
								value="#{alunoDadosPessoaisBean.loginAluno.aluno.sexo}">
								<f:selectItems value="#{alunoDadosPessoaisBean.opcaoSexoAluno}" />
							</h:selectOneRadio>

						</htm:td>
					</htm:tr>

					<!-- Nacionalidade -->
					<htm:tr>
						<htm:td styleClass="tdLabel">
							<h:outputText styleClass="label1" value="#{msg.geral_alunoNacionalidade}"></h:outputText>
						</htm:td>
						<htm:td styleClass="tdConteudo">
							<h:selectOneRadio styleClass="texto2"
								value="#{alunoDadosPessoaisBean.loginAluno.aluno.nacionalidade}">
								<f:selectItems
									value="#{alunoDadosPessoaisBean.opcaoNacionalidade}" />
							</h:selectOneRadio>
						</htm:td>
					</htm:tr>

					<!-- Naturalidade -->
					<htm:tr>
						<htm:td styleClass="tdLabel">
							<h:outputText styleClass="label1" value="#{msg.geral_alunoNaturalidade}"></h:outputText>
						</htm:td>
						<htm:td styleClass="tdConteudo">
							<h:inputText maxlength="50" styleClass="texto2" size="30"
								value="#{alunoDadosPessoaisBean.loginAluno.aluno.naturalidade}">
							</h:inputText>
						</htm:td>
					</htm:tr>

				</htm:table>
				<rich:spacer height="10px"></rich:spacer>


				<!-- Dados de Contato -->
				<t:div styleClass="topicoCurriculo">
					<h:outputText value="#{msg.aluno_curriculoDadosPessoaisDadosContato}"></h:outputText>
				</t:div>

				<htm:table styleClass="table">

					<!-- Telefone -->
					<htm:tr>
						<htm:td styleClass="tdLabel">
							<h:outputText styleClass="label1" value="#{msg.geral_alunoTelefone}"></h:outputText>
						</htm:td>
						<htm:td styleClass="tdConteudo">
							<h:inputText styleClass="texto2" id="telefoneAluno" size="10"
								maxlength="10"
								value="#{alunoDadosPessoaisBean.loginAluno.aluno.telefone}">
								<rich:jQuery selector="#telefoneAluno"
									query="mask('(99)9999-9999')" timing="onload"></rich:jQuery>
							</h:inputText>
							<rich:toolTip for="telefoneAluno" value="#{msg.geral_digiteApenasNumeros}"></rich:toolTip>
						</htm:td>
					</htm:tr>

					<!-- Email -->
					<htm:tr>
						<htm:td styleClass="tdLabel">
							<h:outputText styleClass="label1" value="#{msg.geral_alunoEmail}"></h:outputText>
						</htm:td>
						<htm:td styleClass="tdConteudo">
							<h:inputText id="emailAluno" maxlength="50" styleClass="texto2"
								size="30"
								value="#{alunoDadosPessoaisBean.loginAluno.aluno.email}">

							</h:inputText>
							<h:message id="emailError" for="emailAluno" />
						</htm:td>
					</htm:tr>

					<!-- Rua -->
					<htm:tr>
						<htm:td styleClass="tdLabel">
							<h:outputText styleClass="label1" value="#{msg.geral_alunoEndereco}"></h:outputText>
						</htm:td>
						<htm:td styleClass="tdConteudo">
							<h:inputText maxlength="50" styleClass="texto2" size="70"
								value="#{alunoDadosPessoaisBean.loginAluno.aluno.rua}">
							</h:inputText>
						</htm:td>
					</htm:tr>

					<!-- Numero -->
					<htm:tr>
						<htm:td styleClass="tdLabel">
							<h:outputText styleClass="label1" value="#{msg.geral_alunoEnderecoNumero}"></h:outputText>
						</htm:td>
						<htm:td styleClass="tdConteudo">
							<h:inputText id="numeroEnderecoAluno" maxlength="10" size="5"
								styleClass="texto2"
								value="#{alunoDadosPessoaisBean.loginAluno.aluno.numero}"
								onkeypress="if (event.keyCode < 48 || event.keyCode > 57) event.returnValue = false;">
								<rich:ajaxValidator event="onkeyup"></rich:ajaxValidator>
							</h:inputText>
							<rich:toolTip for="numeroEnderecoAluno"
								value="#{msg.geral_digiteApenasNumeros}"></rich:toolTip>

							<rich:message showSummary="false" showDetail="false"
								for="numeroEnderecoAluno">
								<f:facet name="errorMarker">
									<h:outputText styleClass="estiloMensagemRed"
										value="  *#{msg.geral_digiteApenasNumeros}">
									</h:outputText>
								</f:facet>
							</rich:message>
						</htm:td>
					</htm:tr>

					<!-- Complemento -->
					<htm:tr>
						<htm:td styleClass="tdLabel">
							<h:outputText styleClass="label1" value="#{msg.geral_alunoEnderecoComplemento}"></h:outputText>
						</htm:td>
						<htm:td styleClass="tdConteudo">
							<h:inputText styleClass="texto2" size="10"
								value="#{alunoDadosPessoaisBean.loginAluno.aluno.complemento}">
							</h:inputText>
						</htm:td>
					</htm:tr>

					<!-- CEP -->
					<htm:tr>
						<htm:td styleClass="tdLabel">
							<h:outputText styleClass="label1" value="#{msg.geral_alunoCEP}"></h:outputText>
						</htm:td>
						<htm:td styleClass="tdConteudo">
							<h:inputText styleClass="texto2" id="cepAluno" size="6"
								onkeypress="cep(this)"
								value="#{alunoDadosPessoaisBean.loginAluno.aluno.cep}">
								<rich:jQuery selector="#cepAluno" query="mask('99999-999')"
									timing="onload"></rich:jQuery>
							</h:inputText>
							<rich:toolTip for="cepAluno"
								value="#{msg.geral_digiteApenasNumeros}"></rich:toolTip>
						</htm:td>
					</htm:tr>

					<!-- Bairro -->
					<htm:tr>
						<htm:td styleClass="tdLabel">
							<h:outputText styleClass="label1" value="#{msg.geral_alunoBairro}"></h:outputText>
						</htm:td>
						<htm:td styleClass="tdConteudo">
							<h:inputText styleClass="texto2" size="30"
								value="#{alunoDadosPessoaisBean.loginAluno.aluno.bairro}">
							</h:inputText>
						</htm:td>
					</htm:tr>

					<!-- Cidade -->
					<htm:tr>
						<htm:td styleClass="tdLabel">
							<h:outputText styleClass="label1" value="#{msg.geral_alunoCidade}"></h:outputText>
						</htm:td>
						<htm:td styleClass="tdConteudo">
							<h:inputText styleClass="texto2" size="30"
								value="#{alunoDadosPessoaisBean.loginAluno.aluno.cidade}">
							</h:inputText>
						</htm:td>
					</htm:tr>

					<!-- Estado -->
					<htm:tr>
						<htm:td styleClass="tdLabel">
							<h:outputText styleClass="label1" value="#{msg.geral_alunoEstado}"></h:outputText>
						</htm:td>
						<htm:td styleClass="tdConteudo">
							<h:selectOneMenu styleClass="texto2"
								value="#{alunoDadosPessoaisBean.loginAluno.aluno.estado}">
								<f:selectItems value="#{alunoDadosPessoaisBean.opcaoUF}" />
							</h:selectOneMenu>
						</htm:td>
					</htm:tr>

				</htm:table>
			</t:div>
			<rich:spacer height="5px"></rich:spacer>
		</a4j:form>
	</t:panelGroup>

</f:subview>