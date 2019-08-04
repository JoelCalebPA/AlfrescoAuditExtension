<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Audit</title>

    <link rel="stylesheet" href="/alfresco/vendor/semantic.min.css">
    <link rel="stylesheet" href="/alfresco/vendor/dataTables.semanticui.min.css">
</head>
<body>

    <div id="audit-container" style="display: flexbox; margin: 30px auto; width: 1000px;">
        <div id="top" style="display: inline-flex; margin-bottom: 20px">
            <div id="filter" style="width: 500px">
                <div class="ui form segment">
                    <form id="form-Reporte" name="form-Reporte" method="get" accept-charset="utf-8" autocomplete="off">
                        <div class="field">
                            <label>Usuario</label>
                            <div class="ui input icon">
                                <input type="search" placeholder="admin" aria-controls="myTable" value='${(args.user)!""}'>
                                <i class="user outline icon"></i>
                            </div>
                        </div>
                        <div class="field">
                            <label>Acción</label>
                            <div class="ui search selection dropdown">
                                <input type="hidden" name="action" value='${(args.action)!""}'>
                                <div class="default text">${(args.action)!""}</div>
                                <i class="dropdown icon"></i>
                                <div class="menu transition hidden">
                                    <div class="item" data-value=""></div>
                                    <div class="item" data-value="read">READ</div>
                                    <div class="item" data-value="create">CREATE</div>
                                    <div class="item" data-value="update">UPDATE</div>
                                    <div class="item" data-value="delete">DELETE</div>
                                    <div class="item" data-value="copy">COPY</div>
                                    <div class="item" data-value="move">MOVE</div>
                                </div>
                            </div>
                        </div>
                        <div class="field">
                            <label>Documento / Carpeta</label>
                            <input type="text" name="document" value='${(args.document)!""}'>
                        </div>
                        <div class="two fields">
                            <div class="field">
                                <label>Fecha Inicial</label>
                                <div class="ui calendar" id="datepickerIni">
                                    <div class="ui input icon">
                                        <input type="text" name="dateIni" value='${(args.dateIni)!""}'>
                                        <i class="calendar icon"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="field">
                                <label>Fecha Final</label>
                                <div class="ui calendar" id="datepickerFin">
                                    <div class="ui input icon">
                                        <input type="text" name="dateFin" value='${(args.dateFin)!""}'>
                                        <i class="calendar icon"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <input class="ui blue submit button" type="submit" value="Buscar">
                    </form>
                </div>
            </div>
            <div id="logo" style="display: table-cell; width: 500px;">
                <img class="ui image" src="/alfresco/vendor/logo.png" height="362.98px" style="margin: auto; padding: 10px">
            </div>
        </div>
        <div id="content" style="width: 1000px">
            <table id="myTable" class="ui celled table" style="width:100%">
                <thead>
                    <tr>
                        <th>Usuario</th>
                        <th>Acción</th>
                        <th>Documento</th>
                        <th>Ruta</th>
                        <th>Timestamp</th>
                    </tr>
                </thead>
                <tbody>
					<#if result??>
						<#list result as doc>
						<tr>
							<td>${doc.user}</td>
							<td>${doc.action}</td>
							<td>${doc.document}</td>
							<td>${doc.path}</td>
							<td>${doc.date?string["dd-MM-yyyy, HH:mm:ss"]}</td>
						</tr>
						</#list>
					</#if>
                </tbody>
            </table>
        </div>
    </div>
	<script src="/alfresco/vendor/jquery-3.3.1.js"></script>
	<script src="/alfresco/vendor/jquery.dataTables.min.js"></script>
	<script src="/alfresco/vendor/semantic.min.js"></script>
	<script src="/alfresco/vendor/dataTables.semanticui.min.js"></script>
	<script>
        $(document).ready( function () {
            var table = $('#myTable').DataTable({
                'info': false,
                'searching': false,
                'language': {
                    'url': '/alfresco/vendor/Spanish.json'
                }
            });
            // $('#userFilter').on( 'keyup change', function () {
            //     table
            //         .column( 0 )
            //         .search( this.value )
            //         .draw();
            // } );
            // $('#docFilter').on( 'keyup change', function () {
            //     table
            //         .column( 2 )
            //         .search( this.value )
            //         .draw();
            // } );

            $('.ui.calendar').calendar({
                type: 'date',
                monthFirst: false,
                formatter: {
                    date: function (date, settings) {
                    if (!date) return '';
                    var day = date.getDate();
                    var month = date.getMonth() + 1;
                    var year = date.getFullYear();
                    return day + '-' + month + '-' + year;
                    }
                },
                text: {
                    days: ['D', 'L', 'M', 'M', 'J', 'V', 'S'],
                    months: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Setiembre', 'Octubre', 'Noviembre', 'Diciembre'],
                    monthsShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Set', 'Oct', 'Nov', 'Dic']
                }
            });
            $('.ui.search.selection.dropdown').dropdown();
        } );
    </script>
</body>
</html>