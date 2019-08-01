<!DOCTYPE html>
<html lang="en">
<head>
	<title>Audit</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
<!-- 	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/> -->
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/alfresco/css/vendor/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/alfresco/css/vendor/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/alfresco/css/vendor/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/alfresco/css/vendor/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/alfresco/css/vendor/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/alfresco/css/vendor/jquery-ui.min.css">
	<link rel="stylesheet" type="text/css" href="/alfresco/css/vendor/jquery-ui.theme.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/alfresco/css/audit-util.css">
	<link rel="stylesheet" type="text/css" href="/alfresco/css/audit-main.css">
<!--===============================================================================================-->

</head>
<body>
	<div class="limiter">
		<div class="container-table100 filter">
			<div class="wrap-table100">
				<form id="form-Reporte" name="form-Reporte" method="get" accept-charset="utf-8">
					<div class="table">
						<div class="row">
							<div class="hide-this">
								<label>Usuario</label>
							</div>
							<div class="cell" data-title="Usuario">
								<input id="user" class="form-control" name="user" type="Text" value='${(args.user)!""}' style="width: 100%; background-color: #e9ecef;" />
							</div>
						</div>
						<div class="row">
							<div class="hide-this">
								<label>Acción</label>
							</div>
							<div class="cell" data-title="Acción">
								<input id="action" class="form-control" name="action" type="Text" value='${(args.action)!""}' style="width: 100%; background-color: #e9ecef;" />
							</div>
						</div>
						<div class="row">
							<div class="hide-this">
								<label>Documento</label>
							</div>
							<div class="cell" data-title="Documento">
								<input id="document" class="form-control" name="document" type="Text" value='${(args.document)!""}' style="width: 100%; background-color: #e9ecef;" />
							</div>
						</div>
						<div class="row">
							<div class="hide-this">
								<label>Fecha Inicial</label>
							</div>
							<div class="cell" data-title="Fecha Inicial">
								<input id="datepickerIni" class="form-control" name="dateIni" readonly="readonly" type="text" value='${(args.dateIni)!""}' />
							</div>
						</div>
						<div class="row">
							<div class="hide-this ht-last">
								<label>Fecha Final</label>
							</div>
							<div class="cell" data-title="Fecha Final">
								<input id="datepickerFin" class="form-control" name="dateFin" readonly="readonly" type="text" value='${(args.dateFin)!""}' />
							</div>
						</div>
						<!-- <div class="row">
							<div class="cell">
								<button type="submit" class="btn btn-primary">Buscar</button>
							</div>
						</div> -->
					</div>
				</form>
			</div>
		</div>
		<div class="container-table100">
			<div class="wrap-table100">
				<div id="data-table" class="table">

					<div class="row header">
						<div class="cell">
							Usuario
						</div>
						<div class="cell">
							Acción
						</div>
						<div class="cell">
							Documento
						</div>
						<div class="cell">
							Timestamp
						</div>
					</div>
					<#if result??>
						<#list result as doc>
							<div class="row">
								<div class="cell" data-title="Usuario">
									${doc.user}
								</div>
								<div class="cell" data-title="Acción">
									${doc.action}
								</div>
								<div class="cell" data-title="Documento">
									${doc.document}
								</div>
								<div class="cell" data-title="Timestamp">
									${doc.date?string["dd-MM-yyyy, HH:mm:ss"]}
								</div>
							</div>
						</#list>
					</#if>
				</div>
			</div>
		</div>
	</div>

<!--===============================================================================================-->	
	<script src="/alfresco/scripts/vendor/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="/alfresco/scripts/vendor/popper.js"></script>
	<script src="/alfresco/scripts/vendor/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="/alfresco/scripts/vendor/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="/alfresco/scripts/vendor/jquery-ui.min.js"></script>
<!--===============================================================================================-->
	<script src="/alfresco/scripts/vendor/pagination.min.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript">
		$(document).ready(function() {
			$("#datepickerIni").datepicker({
				dateFormat: "dd-mm-yy"
			});
		    $("#datepickerFin").datepicker({
				dateFormat: "dd-mm-yy"
			});
		} );
		$('#myTable').DataTable();
	</script>
	
</body>
</html>