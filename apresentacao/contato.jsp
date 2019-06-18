<%@ taglib uri="http://richfaces.org/rich" prefix="rich"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ taglib uri="http://myfaces.apache.org/tomahawk" prefix="t"%>
<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j"%>
<%@ taglib uri="http://jsftutorials.net/htmLib" prefix="htm"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>


<f:subview id="contato">
	<f:loadBundle basename="mensagens" var="msg" />

	<h:panelGroup rendered="#{apresentacaoNavegacaoBean.contato}">
		<t:div styleClass="cabecalhoSubView">
			<t:div styleClass="tituloSubView">
				<h:graphicImage styleClass="imagemTituloSubView"
					url="/images/contato.png" title="#{msg.geral_contato}" />
				<h:outputText value="#{msg.principal_linkContato}" />
			</t:div>
			<rich:separator height="3px"></rich:separator>
		</t:div>
		<rich:spacer height="5"></rich:spacer>

		<!-- Texto cabecalho -->
		<t:div styleClass="textoInicialContatoExterno">
			<t:outputText value="#{msg.geral_contatoTextoInicial}"></t:outputText>
		</t:div>

		<!-- Box Mensagens -->
		<t:div id="msgContato" styleClass="estiloMensagemRed">

			<t:div styleClass="roundedcornr_box_sBorderGreen"
				rendered="#{apresentacaoContatoBean.mostraMsgSucesso}">
				<t:div styleClass="roundedcornr_top_sBorderGreen">
					<t:div></t:div>
				</t:div>
				<t:div styleClass="roundedcornr_content_sBorderGreen">
					<h:graphicImage url="/images/sucesso16.png" styleClass="iconeMenu"
						rendered="#{apresentacaoContatoBean.mostraMsgSucesso}" />
					<h:outputText value="#{apresentacaoContatoBean.msgErroSucesso}" styleClass="estiloMensagemGreen"
						rendered="#{apresentacaoContatoBean.mostraMsgSucesso}">
					</h:outputText>
				</t:div>
				<t:div styleClass="roundedcornr_bottom_sBorderGreen">
					<t:div></t:div>
				</t:div>
			</t:div>

			<t:div styleClass="roundedcornr_box_sBorderRed"
				rendered="#{apresentacaoContatoBean.mostrarErros}">
				<t:div styleClass="roundedcornr_top_sBorderRed">
					<t:div></t:div>
				</t:div>
				<t:div styleClass="roundedcornr_content_sBorderRed">
					<h:graphicImage url="/images/exclamacao16.png"
						styleClass="iconeMenu"
						rendered="#{apresentacaoContatoBean.mostraMsgErroNome}">
					</h:graphicImage>
					<h:outputText value="#{apresentacaoContatoBean.msgErroNome}"
						rendered="#{apresentacaoContatoBean.mostraMsgErroNome}">
					</h:outputText>
					<htm:br rendered="#{apresentacaoContatoBean.mostraMsgErroNome}" />

					<h:graphicImage url="/images/exclamacao16.png"
						styleClass="iconeMenu"
						rendered="#{apresentacaoContatoBean.mostraMsgErroEmail}" />
					<h:outputText value="#{apresentacaoContatoBean.msgErroEmail}"
						rendered="#{apresentacaoContatoBean.mostraMsgErroEmail}">
					</h:outputText>
					<htm:br rendered="#{apresentacaoContatoBean.mostraMsgErroEmail}" />

					<h:graphicImage url="/images/exclamacao16.png"
						styleClass="iconeMenu"
						rendered="#{apresentacaoContatoBean.mostraMsgErroEmailInvalido}" />
					<h:outputText
						value="#{apresentacaoContatoBean.msgErroEmailInvalido}"
						rendered="#{apresentacaoContatoBean.mostraMsgErroEmailInvalido}"></h:outputText>
					<htm:br
						rendered="#{apresentacaoContatoBean.mostraMsgErroEmailInvalido}" />

					<h:graphicImage url="/images/exclamacao16.png"
						styleClass="iconeMenu"
						rendered="#{apresentacaoContatoBean.mostraMsgErroAssunto}" />
					<h:outputText value="#{apresentacaoContatoBean.msgErroAssunto}"
						rendered="#{apresentacaoContatoBean.mostraMsgErroAssunto}">
					</h:outputText>
					<htm:br rendered="#{apresentacaoContatoBean.mostraMsgErroAssunto}" />

					<h:graphicImage url="/images/exclamacao16.png"
						styleClass="iconeMenu"
						rendered="#{apresentacaoContatoBean.mostraMsgErroMensagem}" />
					<h:outputText value="#{apresentacaoContatoBean.msgErroMensagem}"
						rendered="#{apresentacaoContatoBean.mostraMsgErroMensagem}">
					</h:outputText>
					<htm:br rendered="#{apresentacaoContatoBean.mostraMsgErroMensagem}" />


					<h:graphicImage url="/images/exclamacao16.png"
						styleClass="iconeMenu"
						rendered="#{apresentacaoContatoBean.mostraMsgErroFatal}" />
					<h:outputText value="#{apresentacaoContatoBean.msgErroFatal}"
						rendered="#{apresentacaoContatoBean.mostraMsgErroFatal}">
					</h:outputText>
					<htm:br rendered="#{apresentacaoContatoBean.mostraMsgErroFatal}" />

				</t:div>
				<t:div styleClass="roundedcornr_bottom_sBorderRed">
					<t:div></t:div>
				</t:div>
			</t:div>

		</t:div>

		<a4j:form>
			<htm:table styleClass="contatoExterno">

				<!-- Nome -->
				<htm:tr styleClass="item">
					<htm:td styleClass="label">
						<t:outputText value="#{msg.geral_contatoNome} *"></t:outputText>
					</htm:td>
					<htm:td>
						<h:inputText id="campoNome"
							value="#{apresentacaoContatoBean.nome}" maxlength="50" size="50"></h:inputText>
					</htm:td>
				</htm:tr>

				<!-- Email -->
				<htm:tr styleClass="item">
					<htm:td styleClass="label">
						<t:outputText value="#{msg.geral_contatoEmail} *"></t:outputText>
					</htm:td>
					<htm:td>
						<h:inputText id="campoEmail"
							value="#{apresentacaoContatoBean.email}" maxlength="40" size="40"></h:inputText>
					</htm:td>
				</htm:tr>

				<!-- Assunto -->
				<htm:tr styleClass="item">
					<htm:td styleClass="label">
						<t:outputText value="#{msg.geral_contatoAssunto} *"></t:outputText>
					</htm:td>
					<htm:td>
						<h:inputText id="campoAssunto"
							value="#{apresentacaoContatoBean.assunto}" maxlength="84"
							size="84"></h:inputText>
					</htm:td>
				</htm:tr>

				<!-- Mensagem -->
				<htm:tr styleClass="item">
					<htm:td styleClass="label">
						<t:outputText value="#{msg.geral_contatoTexto} *"></t:outputText>
					</htm:td>
					<htm:td>
						<h:inputTextarea id="campoMsg" cols="86" rows="15"
							value="#{apresentacaoContatoBean.mensagem}"></h:inputTextarea>
					</htm:td>
				</htm:tr>
			</htm:table>

			<!-- Opcoes  -->
			<t:div styleClass="menuContatoExterno">
				<t:div styleClass="item">
					<a4j:commandButton value="#{msg.geral_enviar}"
						action="#{apresentacaoContatoBean.enviarEmail}"
						reRender="msgContato">
					</a4j:commandButton>
				</t:div>

			</t:div>
		</a4j:form>
		<rich:spacer height="500px"></rich:spacer>
	</h:panelGroup>

</f:subview>
