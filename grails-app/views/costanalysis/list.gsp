
<%@ page import="hss.service.catalog.Costanalysis" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'costanalysis.label', default: 'Cost analysis')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
        <link rel="stylesheet" type="text/css" href="datatable.css">

        <script src="http://code.jquery.com/jquery-1.7.2.min.js" ></script>
        <script type="text/javascript" language="javascript" src="datatable.js"></script>
        <script type="text/javascript" charset="utf-8">
            /* Default class modification */
            $.extend( $.fn.dataTableExt.oStdClasses, {
                "sSortAsc": "header headerSortDown",
                "sSortDesc": "header headerSortUp",
                "sSortable": "header"
            } );

            /* API method to get paging information */
            $.fn.dataTableExt.oApi.fnPagingInfo = function ( oSettings )
            {
                return {
                    "iStart":         oSettings._iDisplayStart,
                    "iEnd":           oSettings.fnDisplayEnd(),
                    "iLength":        oSettings._iDisplayLength,
                    "iTotal":         oSettings.fnRecordsTotal(),
                    "iFilteredTotal": oSettings.fnRecordsDisplay(),
                    "iPage":          Math.ceil( oSettings._iDisplayStart / oSettings._iDisplayLength ),
                    "iTotalPages":    Math.ceil( oSettings.fnRecordsDisplay() / oSettings._iDisplayLength )
                };
            }

            /* Bootstrap style pagination control */
            $.extend( $.fn.dataTableExt.oPagination, {
                "bootstrap": {
                    "fnInit": function( oSettings, nPaging, fnDraw ) {
                        var oLang = oSettings.oLanguage.oPaginate;
                        var fnClickHandler = function ( e ) {
                            e.preventDefault();
                            if ( oSettings.oApi._fnPageChange(oSettings, e.data.action) ) {
                                fnDraw( oSettings );
                            }
                        };

                        $(nPaging).addClass('pagination').append(
                                '<ul>'+
                                        '<li class="prev disabled"><a href="#">&larr; '+oLang.sPrevious+'</a></li>'+
                                        '<li class="next disabled"><a href="#">'+oLang.sNext+' &rarr; </a></li>'+
                                        '</ul>'
                        );
                        var els = $('a', nPaging);
                        $(els[0]).bind( 'click.DT', { action: "previous" }, fnClickHandler );
                        $(els[1]).bind( 'click.DT', { action: "next" }, fnClickHandler );
                    },

                    "fnUpdate": function ( oSettings, fnDraw ) {
                        var iListLength = 5;
                        var oPaging = oSettings.oInstance.fnPagingInfo();
                        var an = oSettings.aanFeatures.p;
                        var i, j, sClass, iStart, iEnd, iHalf=Math.floor(iListLength/2);

                        if ( oPaging.iTotalPages < iListLength) {
                            iStart = 1;
                            iEnd = oPaging.iTotalPages;
                        }
                        else if ( oPaging.iPage <= iHalf ) {
                            iStart = 1;
                            iEnd = iListLength;
                        } else if ( oPaging.iPage >= (oPaging.iTotalPages-iHalf) ) {
                            iStart = oPaging.iTotalPages - iListLength + 1;
                            iEnd = oPaging.iTotalPages;
                        } else {
                            iStart = oPaging.iPage - iHalf + 1;
                            iEnd = iStart + iListLength - 1;
                        }

                        for ( i=0, iLen=an.length ; i<iLen ; i++ ) {
                            // Remove the middle elements
                            $('li:gt(0)', an[i]).filter(':not(:last)').remove();

                            // Add the new list items and their event handlers
                            for ( j=iStart ; j<=iEnd ; j++ ) {
                                sClass = (j==oPaging.iPage+1) ? 'class="active"' : '';
                                $('<li '+sClass+'><a href="#">'+j+'</a></li>')
                                        .insertBefore( $('li:last', an[i])[0] )
                                        .bind('click', function (e) {
                                            e.preventDefault();
                                            oSettings._iDisplayStart = (parseInt($('a', this).text(),10)-1) * oPaging.iLength;
                                            fnDraw( oSettings );
                                        } );
                            }

                            // Add / remove disabled classes from the static elements
                            if ( oPaging.iPage === 0 ) {
                                $('li:first', an[i]).addClass('disabled');
                            } else {
                                $('li:first', an[i]).removeClass('disabled');
                            }

                            if ( oPaging.iPage === oPaging.iTotalPages-1 || oPaging.iTotalPages === 0 ) {
                                $('li:last', an[i]).addClass('disabled');
                            } else {
                                $('li:last', an[i]).removeClass('disabled');
                            }
                        }
                    }
                }
            } );

            /* Table initialisation */
            $(document).ready(function() {
                $('#example').dataTable( {
                    "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
                    "sPaginationType": "bootstrap",
                    "oLanguage": {
                        "sLengthMenu": "_MENU_ records per page"
                    }
                } );
            } );
        </script>
	</head>
	<body>
    <div class="eso-inner">
        <div class="navbar" role="navigation">
            <ul class="nav">
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				</ul>
		</div>

		<div id="list-costanalysis" class="content scaffold-list" role="main">
            <div class="breadcrumb"><h3><g:message code="default.list.label" args="[entityName]" /></h3> </div>

			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>

            <section>
                <table id="example" class="eso-table table-striped">
				<thead>
					<tr>

                      %{--  <g:sortableColumn property="role" title="${message(code: 'costanalysis.role.label', default: 'Cost Role')}" />

                        <g:sortableColumn property="reason" title="${message(code: 'costanalysis.reason.label', default: 'Reason for this Cost')}" />

                        <g:sortableColumn property="cost" title="${message(code: 'costanalysis.cost.label', default: 'Cost in Hrs')}" />

                        <g:sortableColumn property="othercosts" title="${message(code: 'costanalysis.othercosts.label', default: 'Other costs')}" />

                        <g:sortableColumn property="servicename" title="${message(code: 'costanalysis.teamservice.servicename.label', default: 'Service Name')}" />

                        <g:sortableColumn property="teamname" title="${message(code: 'costanalysis.team.teamname.label', default: 'Team Name')}" />--}%
                        <th>Cost Role</th>
                        <th>Why this supplier</th>
                        <th>Cost in Hrs</th>
                        <th>Other costs</th>
                        <th>Service Name</th>
                        <th>Team name</th>
					</tr>

				</thead>
				<tbody>
				<g:each in="${costanalysisInstanceList}" status="i" var="costanalysisInstance">
					%{--<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">--}%

                        <td><g:link  controller="costanalysis" action="show" id="${costanalysisInstance.id}">${fieldValue(bean: costanalysisInstance, field: "role")}</g:link></td>

                        <td>${fieldValue(bean: costanalysisInstance, field: "reason")}</td>

                        <td>${fieldValue(bean: costanalysisInstance, field: "cost")}</td>

                        <td>${fieldValue(bean: costanalysisInstance, field: "othercosts")}</td>

                        <td>${fieldValue(bean: costanalysisInstance.teamservices, field: "servicename")}</td>

                        <td>${fieldValue(bean: costanalysisInstance.teamservices.team, field: "teamname")}</td>

					
					</tr>
				</g:each>
				</tbody>
			</table>
            </div>
			<div class="pagination">
				<g:paginate total="${costanalysisInstanceTotal}" />
            </div>

        </div>
	</body>
</html>

