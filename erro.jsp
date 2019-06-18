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
<!--[if lt IE 7]>
	<link href="${pageContext.request.contextPath}/css/estiloIE.css" rel="stylesheet" type="text/css" />
<![endif]-->
</head>
<body>
<script>
    window.history.forward(1);
</Script>
<f:view>
	<f:loadBundle basename="mensagens" var="msg" />
	<t:div styleClass="tail-top">
		<a4j:region>
			<t:div styleClass="mainErro">
				<!-- header -->
				<t:div styleClass="header">

					<t:div styleClass="row-1">
						<t:div styleClass="logoOportuni">
							<h:graphicImage url="/images/logo.png"
								title="#{msg.geral_Oportuni}" />
						</t:div>
					</t:div>

					<t:div styleClass="row-2"></t:div>

				</t:div>
				<!-- content -->
				<t:div styleClass="content">
					<t:div styleClass="wrapper">
						<t:div styleClass="mensagemErro">
							<h:graphicImage url="/images/exclamacao16.png"
								styleClass="iconeMenu" />
							<h:outputText value="Ocorreu um erro inesperado no sistema."></h:outputText>
							<a4j:form>
								<a4j:commandLink action="principal">
									<t:graphicImage url="/images/voltar20.png"
										styleClass="iconeMenu" title="#{msg.geral_voltar}"></t:graphicImage>
								</a4j:commandLink>
							</a4j:form>
							<rich:spacer height="250px"></rich:spacer>
						</t:div>
					</t:div>
				</t:div>
			</t:div>
		</a4j:region>
	</t:div>
</f:view>
</body>
</html>


