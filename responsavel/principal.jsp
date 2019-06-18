<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ taglib uri="http://richfaces.org/rich" prefix="rich"%>
<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j"%>
<%@ taglib uri="http://jsftutorials.net/htmLib" prefix="htm"%>
<%@ taglib uri="http://myfaces.apache.org/tomahawk" prefix="t"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
<head>
<title>Oportuni</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<link href="${pageContext.request.contextPath}/css/estiloBase.css"
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
	<t:div styleClass="fundoCabecalho">
		<t:div styleClass="main">
			<!-- header -->
			<t:div styleClass="cabecalho">
				<t:div styleClass="linha1">
					<t:div styleClass="logoOportuni">
						<h:graphicImage url="/images/logo.png"
							title="#{msg.geral_Oportuni}" />
					</t:div>
					<t:div styleClass="login">
						<t:panelGrid columns="3">
							<!-- Contato -->
							<h:form>
								<a onclick="Richfaces.showModalPanel('mpContato');"> <t:graphicImage
									url="/images/contato16.png" title="#{msg.geral_contato}">
								</t:graphicImage> </a>
							</h:form>
							<c:import url="contato.jsp"></c:import>

							<!-- Ajuda -->
							<h:form>
								<h:outputLink
									value="http://150.164.2.29/oportuni/tutorial/OportuniTutorialResponsavel.pdf" target="_blank">
									<t:graphicImage url="/images/ajuda16.png"
										title="#{msg.geral_ajuda}"></t:graphicImage>
								</h:outputLink>
							</h:form>
						</t:panelGrid>
					</t:div>
				</t:div>

				<t:div styleClass="linha2">
					<t:panelGrid columns="3" width="100%">

						<!-- Mensagem com o login do usuario -->
						<t:div id="logoutMensagem" styleClass="logoutMensagem">
							<h:outputText value="#{msg.geral_ola}"></h:outputText>
							<h:outputText value="#{loginBean.responsavel.login}"></h:outputText>
							<h:outputText value="! "></h:outputText>
						</t:div>
						<!-- Fim da mensagem -->

						<!-- Botao de logout -->
						<t:div id="logout" styleClass="logout">
							<h:form>
								<h:commandLink id="sair" action="#{loginBean.sair}">
									<t:graphicImage url="/images/logout48.png" styleClass="icone"
										title="#{msg.geral_sair}"></t:graphicImage>
								</h:commandLink>
							</h:form>
						</t:div>
						<!-- -->
					</t:panelGrid>

				</t:div>

			</t:div>
			<!-- content -->
			<a4j:region>
				<t:div styleClass="corpo">
					<t:div styleClass="wrapper">
						<t:div styleClass="menu">

							<!-- Opcao Oportunidades -->
							<t:div styleClass="item">
								<t:div styleClass="logo">
									<h:graphicImage url="/images/logoOpt25.png"></h:graphicImage>
								</t:div>
								<t:div styleClass="texto">
									<a4j:form>
										<h2><a4j:commandLink
											value="#{msg.responsavel_linkOportunidades}"
											actionListener="#{responsavelNavegacaoBean.renderizaOportunidades}"
											action="#{responsavelOportunidadesBean.selecionaOportunidadesResp}"
											reRender="conteudoResponsavel"></a4j:commandLink></h2>
									</a4j:form>
								</t:div>
							</t:div>
							<!-- Fim da opcao Oportunidades -->

							<!-- Opcao Meus Dados -->
							<t:div styleClass="item">
								<t:div styleClass="logo">
									<h:graphicImage url="/images/perfil25.png"></h:graphicImage>
								</t:div>
								<t:div styleClass="texto">
									<a4j:form>
										<h2><a4j:commandLink
											value="#{msg.responsavel_linkMeusDados}"
											actionListener="#{responsavelNavegacaoBean.renderizaMeusDados}"
											reRender="conteudoResponsavel"></a4j:commandLink></h2>
									</a4j:form>
								</t:div>
							</t:div>
							<!-- Fim da opcao Minhas Oportunidades -->

							<!-- Opcao X -->

							<!-- Fim da opcao X -->
						</t:div>
						<t:div styleClass="conteudo" id="conteudoResponsavel">
							<c:import url="oportunidades.jsp"></c:import>
							<c:import url="candidatos.jsp"></c:import>
							<c:import url="meusDados.jsp"></c:import>
							<c:import url="editarOportunidade.jsp"></c:import>
							<c:import url="visualizaCurriculo.jsp"></c:import>
							<c:import url="novaOportunidade.jsp"></c:import>
							<c:import url="exibirOportunidade.jsp"></c:import>
							<c:import url="enviarMensagem.jsp"></c:import>
						</t:div>
					</t:div>
				</t:div>
			</a4j:region>
		</t:div>
	</t:div>
</f:view>
</body>
</html>

