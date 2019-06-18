<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ taglib uri="http://richfaces.org/rich" prefix="rich"%>
<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j"%>
<%@ taglib uri="http://jsftutorials.net/htmLib" prefix="htm"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib uri="http://myfaces.apache.org/tomahawk" prefix="t"%>

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
<head>
<title>Oportuni</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<link href="${pageContext.request.contextPath}/css/estiloBase.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/estiloPrincipal.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/estiloComum.css"
	rel="stylesheet" type="text/css" />
<link rel="shortcut icon"
	href="http://localhost:8080/OportuniFonte/images/icone.png" />

<!-- Google Analytics -->	
<script type="text/javascript">
 var _gaq = _gaq || [];
 _gaq.push(['_setAccount', 'UA-16643576-1']);
 _gaq.push(['_trackPageview']);

 (function() {
   var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
   ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
   var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
 })();
</script>

</head>
<body>
<!--[if IE]>
	<link href="${pageContext.request.contextPath}/css/estiloIE.css" rel="stylesheet" type="text/css" />
<![endif]-->
<script>
    window.history.forward(1);
</Script>
<f:view>
	<f:loadBundle basename="mensagens" var="msg" />
	<t:div styleClass="tail-top">
		<a4j:region>
			<t:div styleClass="main">
				<!-- header -->
				<t:div styleClass="header">
					<t:div styleClass="row-1">
						<t:div styleClass="logoOportuni">
							<a4j:form>
								<a4j:commandLink
									action="#{apresentacaoNavegacaoBean.renderizarPrincipal}"
									reRender="conteudoPrincipal, mensagemWelcome, row2, conteudoOpcoes">
									<h:graphicImage value="/images/logo.png"
										title="#{msg.geral_Oportuni}"></h:graphicImage>
								</a4j:commandLink>
							</a4j:form>
						</t:div>
						<t:div styleClass="login">
							<a4j:form>
								<t:div>
									<h:outputText value="#{msg.principal_login}"></h:outputText>
									<h:inputText required="true" id="idLogin"
										value="#{loginBean.usuario.loginUsuario}"
										requiredMessage="Digite o seu login." size="12"></h:inputText>
									<h:outputText value="#{msg.principal_senha}"
										styleClass="opcaoLogin"></h:outputText>
									<h:inputSecret required="true" id="idSenha"
										value="#{loginBean.usuario.senhaUsuario}"
										requiredMessage="Digite a sua senha." size="12"></h:inputSecret>
									<h:outputText styleClass="opcaoLogin"></h:outputText>
									<a4j:commandButton id="entrar"
										action="#{loginBean.verificaLogin}"
										value="#{msg.principal_btEntrar}" reRender="msgErroLogin">

									</a4j:commandButton>
								</t:div>
							</a4j:form>

							<t:div>
								<htm:table>
									<htm:tr>
										<htm:td width="180px" height="10px">
											<t:div id="msgErroLogin">
												<rich:messages layout="table" styleClass="estiloMensagemRed">
													<f:facet name="errorMarker">
														<h:graphicImage url="/images/exclamacao16.png"
															styleClass="iconeMenu" />
													</f:facet>
												</rich:messages>
											</t:div>
										</htm:td>
										<htm:td>
											<t:panelGrid>
												<!-- Criar caixa de mensagem para explicar como acessar -->
												<h:form>
													<t:div styleClass="comoAcessar">
														<a onclick="Richfaces.showModalPanel('pmComoAcessar');"
															href="#"><h:outputText
															value="#{msg.principal_linkComoAcessar}"></h:outputText></a>
													</t:div>
												</h:form>
												<rich:modalPanel id="pmComoAcessar" width="300" height="120">
													<f:facet name="header">
														<h:outputText
															value="#{msg.principal_tituloModalPanelComoAcessar}"></h:outputText>
													</f:facet>
													<t:div styleClass="textoMPComoAcessar">
														<h:outputText
															value="#{msg.pricipal_textoModalPanelComoAcessar}"></h:outputText>
													</t:div>
													<h:form>
														<t:commandButton value="#{msg.geral_fechar}"
															styleClass="botaoFecharMPComoAcessar"
															onclick="Richfaces.hideModalPanel('pmComoAcessar');"></t:commandButton>
													</h:form>
												</rich:modalPanel>

												<!--  -->
											</t:panelGrid>
										</htm:td>
									</htm:tr>
								</htm:table>
							</t:div>
						</t:div>
					</t:div>
					<t:div styleClass="row-2" id="row2"
						rendered="#{apresentacaoNavegacaoBean.principal}"></t:div>
					<t:div styleClass="messagem-welcome" id="mensagemWelcome"
						rendered="#{apresentacaoNavegacaoBean.principal}">
						<t:div styleClass="col-1Msg">
							<t:div styleClass="titulo">
								<h:outputText value="#{msg.principal_bemVindo}"></h:outputText>
							</t:div>

							<t:div styleClass="texto">
								<h:outputText value="#{msg.principal_oportuniSlogan}"></h:outputText>
							</t:div>

							<t:div styleClass="botaoMsg">
								<a4j:form>
									<h2><a4j:commandLink
										action="#{apresentacaoNavegacaoBean.renderizarOQueEhOportuni}"
										reRender="conteudoPrincipal, mensagemWelcome, row2, conteudoOpcoes">
										<h:graphicImage value="/images/btSaibaMais.png"
											title="#{msg.principal_saibaMais}"></h:graphicImage>
									</a4j:commandLink></h2>
								</a4j:form>

							</t:div>
						</t:div>

					</t:div>
				</t:div>

				<t:div styleClass="messagem-welcomeCol2"
					rendered="#{apresentacaoNavegacaoBean.principal}"></t:div>

				<!-- content -->
				<t:div styleClass="content" id="conteudoPrincipal"
					rendered="#{apresentacaoNavegacaoBean.principal}">
					<t:div styleClass="wrapper">
						<t:div styleClass="col-1">
							<t:div styleClass="section">
								<t:div styleClass="itemMenu">
									<t:div styleClass="logoItMenu">
										<h:graphicImage url="/images/oqueOportuni.png"
											title="#{msg.principal_linkOportuni}"></h:graphicImage>
									</t:div>
									<t:div styleClass="textoItMenu">
										<a4j:form>
											<h4><a4j:commandLink
												action="#{apresentacaoNavegacaoBean.renderizarOQueEhOportuni}"
												value="#{msg.principal_linkOportuni}"
												reRender="conteudoPrincipal, mensagemWelcome, row2, conteudoOpcoes" /><br />
											</h4>
										</a4j:form>
										<t:div styleClass="corpoTextoItMenu">
											<h:outputText value="#{msg.principal_textoLinkOportuni}"></h:outputText>
										</t:div>
									</t:div>
								</t:div>
								<t:div styleClass="itemMenu">
									<t:div styleClass="logoItMenu">
										<h:graphicImage url="/images/link65.png"
											title="#{msg.principal_linksRelacionados}"></h:graphicImage>
									</t:div>
									<t:div styleClass="textoItMenu">
										<a4j:form>
											<h4><a4j:commandLink
												action="#{apresentacaoNavegacaoBean.renderizarLinksRelacionados}"
												value="#{msg.principal_linksRelacionados}"
												reRender="conteudoPrincipal, mensagemWelcome, row2, conteudoOpcoes" /><br />
											</h4>
										</a4j:form>
										<t:div styleClass="corpoTextoItMenu">
											<h:outputText value="#{msg.principal_textoLinksRelacionados}"></h:outputText>
										</t:div>
									</t:div>
								</t:div>
							</t:div>
						</t:div>
						<t:div styleClass="col-2"></t:div>
						<t:div styleClass="col-3">
							<t:div styleClass="section">
								<t:div styleClass="itemMenu">
									<t:div styleClass="logoItMenu">
										<h:graphicImage url="/images/atividadesAcademicas.png"
											title="#{msg.principal_linkAtividadesAcademicas}"></h:graphicImage>
									</t:div>
									<t:div styleClass="textoItMenu">
										<a4j:form>
											<h4><a4j:commandLink
												action="#{apresentacaoNavegacaoBean.renderizarAtividadesAcademicas}"
												value="#{msg.principal_linkAtividadesAcademicas}"
												reRender="conteudoPrincipal, mensagemWelcome, row2, conteudoOpcoes" /><br />
											</h4>
										</a4j:form>
										<t:div styleClass="corpoTextoItMenu">
											<h:outputText
												value="#{msg.principal_textoLinkAtividadesAcademicas}"></h:outputText>
										</t:div>
									</t:div>
								</t:div>
								<t:div styleClass="itemMenu">
									<t:div styleClass="logoItMenu">
										<h:graphicImage url="/images/contato.png"
											title="#{msg.principal_linkContato}"></h:graphicImage>
									</t:div>
									<t:div styleClass="textoItMenu">
										<a4j:form>
											<h4><a4j:commandLink
												action="#{apresentacaoNavegacaoBean.renderizarContato}"
												value="#{msg.principal_linkContato}"
												reRender="conteudoPrincipal, mensagemWelcome, row2, conteudoOpcoes" /><br />
											</h4>
										</a4j:form>
										<t:div styleClass="corpoTextoItMenu">
											<h:outputText value="#{msg.principal_textoLinkContato}"></h:outputText>
										</t:div>
									</t:div>
								</t:div>
							</t:div>
						</t:div>
					</t:div>

				</t:div>
				<t:div styleClass="contentExterno" id="conteudoOpcoes">
					<t:div styleClass="wrapper"
						rendered="#{not apresentacaoNavegacaoBean.principal}">
						<t:div styleClass="menuExterno">
							<a4j:form>
								<t:panelGrid columns="5">
									<a4j:commandLink
										action="#{apresentacaoNavegacaoBean.renderizarPrincipal}"
										reRender="conteudoPrincipal, mensagemWelcome, row2, conteudoOpcoes">
										<h:graphicImage value="/images/logoOportuni3D25.png"
											styleClass="iconeMenu" title="#{msg.geral_Oportuni}"></h:graphicImage>
									</a4j:commandLink>
									<a4j:commandLink
										action="#{apresentacaoNavegacaoBean.renderizarOQueEhOportuni}"
										reRender="conteudoOpcoes">
										<h:graphicImage url="/images/oqueOportuni25.png"
											styleClass="iconeMenu" title="#{msg.principal_linkOportuni}"></h:graphicImage>
									</a4j:commandLink>
									<a4j:commandLink
										action="#{apresentacaoNavegacaoBean.renderizarAtividadesAcademicas}"
										reRender="conteudoOpcoes">
										<h:graphicImage url="/images/atividadesAcademicas25.png"
											styleClass="iconeMenu"
											title="#{msg.principal_linkAtividadesAcademicas}"></h:graphicImage>
									</a4j:commandLink>
									<a4j:commandLink
										action="#{apresentacaoNavegacaoBean.renderizarLinksRelacionados}"
										reRender="conteudoOpcoes">
										<h:graphicImage url="/images/link25.png"
											styleClass="iconeMenu"
											title="#{msg.principal_linksRelacionados}"></h:graphicImage>
									</a4j:commandLink>
									<a4j:commandLink
										action="#{apresentacaoNavegacaoBean.renderizarContato}"
										reRender="conteudoPrincipal, mensagemWelcome, row2, conteudoOpcoes">
										<h:graphicImage url="/images/contato25.png"
											styleClass="iconeMenu" title="#{msg.principal_linkContato}"></h:graphicImage>
									</a4j:commandLink>
								</t:panelGrid>
							</a4j:form>
						</t:div>
						<c:import url="contato.jsp"></c:import>
						<c:import url="atividadesAcademicas.jsp"></c:import>
						<c:import url="oQueEhOportuni.jsp"></c:import>
						<c:import url="linksRelacionados.jsp"></c:import>
					</t:div>
				</t:div>
				<t:div styleClass="tail-bottom"
					rendered="#{apresentacaoNavegacaoBean.principal}">
					<!-- footer -->
					<t:div styleClass="footer">

						<t:div styleClass="indent">
							<h:form>

								<a onclick="Richfaces.showModalPanel('pmCreditos');" href="#"><h:outputText
									value="#{msg.principal_creditos}" styleClass="texto"></h:outputText></a>

							</h:form>
							<rich:modalPanel id="pmCreditos" width="300" height="270">

								<f:facet name="header">
									<h:outputText value="#{msg.principal_creditos}"></h:outputText>
								</f:facet>

								<t:div styleClass="creditos">

									<t:div styleClass="textoInicial">
										<h:outputText value="#{msg.principal_creditosTextoInicial}"></h:outputText>
									</t:div>

									<t:div styleClass="titulo">
										<h:outputText value="#{msg.principal_creditosParticipantes}"></h:outputText>
									</t:div>

									<t:div styleClass="nome">
										<h:outputText value="#{msg.principal_creditosAluno1}"></h:outputText>
									</t:div>
									<t:div styleClass="nome">
										<h:outputText value="#{msg.principal_creditosAluno2}"></h:outputText>
									</t:div>
									<t:div styleClass="nome">
										<h:outputText value="#{msg.principal_creditosAluno3}"></h:outputText>
									</t:div>


									<t:div styleClass="titulo">
										<h:outputText value="#{msg.principal_creditosOrientador}"></h:outputText>
									</t:div>
									<t:div styleClass="nome">
										<h:outputText value="#{msg.principal_creditosOrientadorNome}"></h:outputText>
									</t:div>
									<h:form>

										<t:commandButton value="#{msg.geral_fechar}"
											styleClass="botaoFechar"
											onclick="Richfaces.hideModalPanel('pmCreditos');"></t:commandButton>
									</h:form>
								</t:div>
							</rich:modalPanel>
						</t:div>
						<t:div styleClass="logo">
							<t:graphicImage value="/images/logoFooter.png"
								title="#{msg.geral_Oportuni}"></t:graphicImage>
						</t:div>
					</t:div>
				</t:div>
			</t:div>
		</a4j:region>
	</t:div>
</f:view>
</body>
</html>

