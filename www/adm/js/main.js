﻿ var openedNodes=[];//=["node_1", "node_112"];
 var saveTree="jstree_open";
 var saveSelect="jstree_select";
 var selectNode=[];
 var uhash = document.location.toString().split('#', 2)[1];
 if (uhash !==undefined){
     var nodePath = uhash.split(';', 2)[0];
     var nodeTab = uhash.split(';', 2)[1];
     $.each(nodePath.split('.'),function(k,v){
         selectNode='node_'+v;
         openedNodes[k]='node_'+v;
         saveTree=false;
         saveSelect=false;
     });
 }  
  
 
$(function() {
    
        // автоматическая отправка
        $('form.ajax-form').live('submit', function()
        {
            var form = $(this);
            var hideForm = function()
            {
                showHide(form, 'hide');
            }
            
            var cleanForm = function()
            {
                form.trigger( 'reset' );
            }
    
            //отключение кнопки отправки на время получения данных от сервера
            form.find("input[type='submit']").prop('disabled', true);
   
            $(form).ajaxSubmit(
            {
                semantic: true,
                dataType: 'json',
                success: function(data)
                {
                    if (data.error == true)
                    {
                        
                        if (data.errormsg !== undefined){
                            
                            // вывод набора ошибок
                            showValidateErrors(data.errormsg);
                            
                        }else{
                            
                            // вывод простого сообщения если нет набора ошибок
                            nNoteShow('#flash-msg-nNote', 'nFailure', data.msg);
                            
                        }
                        
                    }
                    else
                    {
                        
                            // вызов очистки формы
                        if (data.clean !== undefined){
                        
                            if(data.clean == true)
                            cleanForm();
                            
                        }else {
                            
                            hideForm();
                             
                        }
                        
                           //вывод сообщения
                        nNoteShow('#flash-msg-nNote', 'nSuccess', data.msg);
                  
                        if (data.redirect !== undefined){
                            
                             setTimeout(function(){location.href = data.redirect},2000);
                                                       
                        }
                    }
                    
                          // вызов коллбека
                    if(typeof(data.callback) == "string"){
                            
                             eval(data.callback); 
                            
                             callback();             
                             
                    }
                    
                        //включение кнопки отправки
                    form.find("input[type='submit']").prop('disabled', false); 
                   
                 }
            }, "json");
            return false;
        })
    
    	$('.submitForm').live('click', function() {
			if ($('#my-form-builder').length) {
				$('#my-form-builder').remove();
				$('form, .tab_content input').hide();
			}
		});
        
		$('.type_delete').live('click', function() {
			var typeName = $(this).attr('rel');
			if (confirm($(this).attr('title'))) {
				$.get('/admin/typesmanager/delete/name/' + typeName, function(data) {
					if (data == 'OK') {
						$('.type_row[rel="' + typeName + '"]').remove();
					} else {
						alert('Не удалось удалить тип!');
					}
				});
			}
		});
             
		$('#users-table-wrapper').ajaxLeaf();
        
		$('#roles-table-wrapper').ajaxLeaf({
			loadUrl: '/admin/aclrole/load/',
			itemsContainer: '#acl-roles',
			"renderItems": function(items) {
				var itemsHtml = [];
				$.each(items, function(id, role) {
					itemsHtml.push('<tr id="role-row-' + id + '"><td>' + role.name + '</td><td>' + role.role_acl_key + '</td><td parentid="' + role.parentid + '" >' + role.parentname + '</td><td>' + role.rule_count + '</td><td><img class="table-btn" src="/adm/img/userRemove.png" onclick="delRole(\'' + id + '\')" title="Удалить" alt="Удалить" /><img src="/adm/img/formbuilder/edit.png" class="table-btn" onclick="editRole(\'' + id + '\')" title="Редактировать" alt="Редактировать" />    <img class="table-btn" src="/adm/img/formbuilder/edit2.png" onclick="showRoleRules(\'' + id + '\')" title="Редактировать доступы" alt="Редактировать доступы" /></td></tr>');
				});
				return itemsHtml;
			}
		});
 		$('.close-link').live('click', function() {
			showHide($(this).parent(), 'hide');
			return false;
		})
		$('#acl-reload-button').tipsy({
			gravity: "w"
		});
        
     	$('.datepicker').live('click', function() {
			$(this).datetimepicker({
    	            
             firstDay:1,
             autoSize: true,
             dateFormat: 'yy-mm-dd',
             monthNames: ['января', 'февраля', 'марта', 'апреля', 'мая', 'июня', 'июля', 'августа', 'сентября', 'октября', 'ноября', 'декабря'],
             dayNamesMin: ["Вс", "Пн", "Вт", "Ср", "Чт", "Пт", "Сб" ]        
                    
 			}).focus();
		});
        
       	$('.datepickerl').live('click', function() {
			$(this).datetimepicker({
			 
             firstDay:1,
             autoSize: true,
             dateFormat: 'yy-mm-dd',
             monthNames: ['января', 'февраля', 'марта', 'апреля', 'мая', 'июня', 'июля', 'августа', 'сентября', 'октября', 'ноября', 'декабря'],
             dayNamesMin: ["Вс", "Пн", "Вт", "Ср", "Чт", "Пт", "Сб" ]
             
             
    		}).focus();
		});

});

	$(function() {
       selectNode = [ selectNode ];
		$("#tree").jstree({
			// List of active plugins
			"plugins": ["themes", "json_data", "ui", "crrm", "cookies","types", "dnd",  "contextmenu"],
			// I usually configure the plugin that handles the data first
			// This example uses JSON as it is most common
              
            "themes" : {
			"theme" : "classic",
			"dots" : false
		     },
            "cookies":{
              "save_opened":saveTree,
              "save_selected":saveSelect
             },
            
            "ui":{
              "initially_select" : selectNode,
              "select_limit":1  
             },
             
			"json_data": {
				// This tree is ajax enabled - as this is most common, and maybe a bit more complex
				// All the options are almost the same as jQuery's AJAX (read the docs)
				"ajax": {
					// the URL to fetch the data
					"url": function(n) {
						// the result is fed to the AJAX request `data` option
						return "/admin/tree/get/pid/" + (n.attr ? n.attr("id").replace("node_", "") : 0);
					},
					// the `data` function is executed in the instance's scope
					// the parameter is the node being loaded 
					// (may be -1, 0, or undefined when loading the root nodes)
					"data": function(n) {
						// the result is fed to the AJAX request `data` option
						return "";
					}
				}
			},
            "types" : {
                  "max_depth" : -2,
                  "max_children" : -2,
                  "use_data" : true,
                                
                  	'types' : {
        				// the default type
        				"default" : {
        					"max_children"	: -2,
        					"max_depth"		: -2,
        					"valid_children": "all"
        					// Bound functions - you can bind any other function here (using boolean or function)
        					//"select_node"	: true
        				    },
        			      
                         "disable_n" : {
        					"max_children"	: -2,
        					"max_depth"		: -2,
        					"valid_children": "none",
                                "start_drag"    : false,
                                "move_node"     : false,
                        		"create_node"	: false,
                        		"delete_node"	: false,
                                "remove"        : false,
                                "context_menu"       : false
        				         
        				    }
                    }  
                },
            "core" : {
	            // just open those two nodes up
	            // as this is an AJAX enabled tree, both will be downloaded from the server
            "initially_open" : openedNodes
             }    
   			// Using types - most of the time this is an overkill
			// read the docs carefully to decide whether you need types
		}).bind("remove.jstree", function(e, data) {
			data.rslt.obj.each(function() {
				$.ajax({
					async: false,
					type: 'get',
					url: "/admin/tree/remove/id/"+this.id.replace("node_", ""),
                    dataType:'json',
					success: function(r) {
						if (!r.status) {
						 alert('Ошибка при удалении или у вас нет прав на удаление');
						$.jstree.rollback(data.rlbk);
						}
					}
				});
			});
		}).bind("move_node.jstree", function(e, data) {
			data.rslt.o.each(function(i) {
			 
                 var position;
                 var pos;
         
  				$.ajax({
					async: false,
					type: 'POST',
					url: "/admin/tree/move/",
                    dataType:'json',
					data: {
						"key": $(this).attr("id").replace("node_", ""),
						"base_key": data.rslt.r.attr("id").replace("node_", ""),
						"position":  data.rslt.p,
                        "copy" : data.rslt.cy ? 1 : 0,
                        "parent_key" : data.rslt.cr === -1 ? 1 : data.rslt.np.attr("id").replace("node_","")
    				},
					success: function(r) {
						if (!r.status) {
							$.jstree.rollback(data.rlbk);
						} 
                        else if((data.rslt.cy)){
                           $(data.rslt.oc).attr("id", "node_" + r.id).attr("rel", r.id);
                           $.jstree._reference('#tree').set_text($("#node_" + r.id),r.title); 
                           $.jstree._reference('#tree').refresh($("#node_" + r.id));
                        }
   					}
				});
			});
		}).bind("select_node.jstree", function (e, nodeData) {
		    var nodeId=  $(nodeData.rslt.obj).attr("id").replace("node_", ""); 
             loadTabs(nodeId);
          });
	});
    
    function loadTabs(nodeId){
      
        disableTree();
        $.get('/admin/gui/load/key/' + nodeId, function(data) {
              enableTree();
        				$('#ajax_load_place_tab_container').html(data);
        				$('#ajax_load_place_tabs').html($('#ajax_load_place_tab_container .tabs').html());
        				$('#ajax_load_place_tab_container .tabs').remove();
        				$(".b-main-tabs").simpleTabs();
                    if(nodeTab !==undefined ){
                      $("ul.tabs li:"+nodeTab).click();
                       nodeTab=undefined;// работаe только первый раз
                    }
                    	else if (clickedTab) {
                    	   
                           
                 			$('ul.tabs li').eq(clickedTab).click();
        				}
        })   
                       
    }
    
    /*
	function selectedNodeReload(id,newNodeId) {
	// $.jstree._reference('#tree').create({ attributes : { 'class' : 'cc' }, data: { title : 'ID and ICON', icon : '../media/images/ok.png' } },$('#tree .jstree-clicked'));
     
        $.waterfall(
            function() {
             $.jstree._reference('#tree').refresh(id);;
            })
            	.fail(function() {
                console.log('error');
                 })
                .done(function() {
                alert(newNodeId);  
                    
                $(newNodeId).click();
                console.log('success');
                 });*/
              
     /* $.when($.jstree._reference('#tree').refresh(id)).then(function(){
        alert($(newNodeId).length);
        $(newNodeId).click()}); 
    //$('#tree').jstree.refresh(id); 
 	}*/

	function selectLoad(a, selId, params, checkOpt, cb) {
		var items = [];
		$(selId).empty();
		$.post('/admin/form/loadChilds', 'field=' + params + '&treeid=' + $(a).find(':selected').attr('treeid'), function(data) {
			items.push('<option>Выбор</option>');
			$.each(data, function(k, v) {
				var cheked = '';
				if (v.value == checkOpt) {
					cheked = 'selected=\"selected\"';
				}
				items.push('<option treeid=\"' + k + '\" value=\"' + v.value + '\" ' + cheked + ' > ' + v.title + '</option>');
			});
			$(selId).html(items.join(''));
		}, 'json');
        return cb();
	}

	function openOnLoadTreeNode(data, lastItem) {
		if (!lastItem) lastItem = 0;
		//alert(lastItem);
		$('.toggler[id="' + data[lastItem] + '"]').click();
		lastItem++;
		if (data[lastItem] != null) {
			setTimeout(function() {
				openOnLoadTreeNode(data, lastItem)
			}, 500);
		}
	}
/*
 * Function: addRowJQueryTable
 * 	Inputs:  tdArray - массив со значениями ячеек таблицы
 *   Return: иденификатор строки.       
 */

	function addRowJQueryTable(tabeID, tdArray) {
		var a = $(tabeID).dataTable().fnAddData(tdArray);
		return $(tabeID).dataTable().fnSettings().aoData[a[0]].nTr;
	}
	
	function addUser() {
		var saveFrom = $('#add-user');
		$('#add-user-title').html('Добавление нового пользователя');
		if (saveFrom.is(':visible')) {
			showHide(saveFrom, 'hide');
			if ($('#save_type').val() == 'add') return;
		}
		clearUserForm();
		saveFrom.removeClass();
		saveFrom.addClass('acl-save-form-add');
		showHide(saveFrom, 'show');
	}

	function clearUserForm() {
		clearAllRoles();
		$('#user_name').val('');
		$('#user_login').val('');
		$('#user_password').val('');
		$('#user_email').val('');
		$('#save_type').val('add');
		$('#user_id').val('');
	}
	//acl users : start

	function delUser(userID) {
		if (confirm('Вы подтверждаете удаление?')) {
			$.post('/admin/acluser/del.php', 'delusrid=' + userID, function(data) {
				if (!data.error) {
					$('#user-row-' + userID).animate({
						opacity: 'hide',
						height: 'hide'
					}, 'slow');
					$('#user-row-' + userID).remove();
					if (userID == $('#user_id').val()) {
						$('#add-user').animate({
							opacity: 'hide',
							height: 'hide'
						}, 'slow');
					}
					nNoteShow('#flash-msg-nNote', 'nSuccess', data.msg);
				} else {
					showValidateErrors(data.msg);
				}
			}, "json")
		}
	};
    
	// серелезуем пользователя и отправляем на контроллер 

	function userInfoSubmit() {
		var str = '';
		$('#user-info-form input').each(

		function(n, element) {
			if ($(element).attr('type') != 'button') {
				str = str + $(element).attr('name') + '=' + $(element).val() + '&';
			}
		})
		$('#user_roles div').each(

		function(n, element) {
			str = str + 'roles[]' + '=' + $(element).attr('id').replace(/role-/, '') + '&';
		})
		$.post('/admin/acluser/save.php', str, function(data) {
			if (data.error == true) {
				showValidateErrors(data.msg);
			} else {
				clearAllRoles();
				var userRoles = [];
				for (var key in data.user.roles) {
					var val = data.user.roles[key];
					userRoles[key] = $('#add-roles option[value="' + val + '"]').text();
				}
				var adduser = '<td>' + data.user.name + '</td><td>' + data.user.login + '</td><td>' + data.user.email + '</td><td>' + userRoles.join(', ') + '</td><td><img class="table-btn" src="/adm/img/userRemove.png" onclick="delUser(\'' + data.user.id + '\')" title="Удалить" alt="Удалить" /><img src="/adm/img/formbuilder/edit.png" class="table-btn" onclick="editUser(\'' + data.user.id + '\')" title="Редактировать" alt="Редактировать" /></td>';
				if (data.user.type == 'add') {
/* var tdArray=[];
             tdArray.push(data.user.name);
             tdArray.push(data.user.login);
             tdArray.push(data.user.email);
             tdArray.push(userRoles.join(', '));
             tdArray.push('<img class="table-btn" src="/adm/img/userRemove.png" onclick="delUser(\'' + data.user.id + '\')" title="Удалить" alt="Удалить" /><img src="/adm/img/formbuilder/edit.png" class="table-btn" onclick="editUser(\'' + data.user.id + '\')" title="Редактировать" alt="Редактировать" />');
              var newRow = addRowJQueryTable('#acl-users',tdArray);
              $(newRow).attr('id','user-row-' + data.user.id);*/
					adduser = '<tr id="user-row-' + data.user.id + '">' + adduser + '</tr>';
					$('#acl-users tbody').prepend(adduser);
					$('#user-row-' + data.user.id).hide();
					$('#user-row-' + data.user.id).animate({
						opacity: 'show',
						height: 'show'
					}, 'slow');
				} else {
					$('#user-row-' + data.user.id).html(adduser);
					$('#add-user').animate({
						opacity: 'hide',
						height: 'hide'
					}, 'slow');
				}
				nNoteShow('#flash-msg-nNote', 'nSuccess', data.msg);
				clearUserForm();
			}
		}, "json");
	}

	function editUser(userId) {
		var saveFrom = $('#add-user');
		var userRow;
		var userRoles;
		var rolesSrt;
		var userName;
		$('#user-row-' + userId + ' td').each(function(n, element) {
			switch (n) {
			case 0:
				userName = $.trim($(element).text());
				$('#user_name').val(userName);
				break;
			case 1:
				$('#user_login').val($.trim($(element).text()));
				break;
			case 2:
				$('#user_email').val($.trim($(element).text()));
				break;
			case 3:
				rolesSrt = $.trim($(element).text());
				break;
			default:
			}
		})
		clearAllRoles();
		if (rolesSrt.length > 0) {
			userRoles = rolesSrt.split(', ');
			for (i = 0; i < userRoles.length; i++) {
				userAddRole('#role-' + userRoles[i], true);
			}
		}
		$('#save_type').val('update');
		$('#user_id').val(userId);
		if (saveFrom.is(':visible')) {
			saveFrom.animate({
				opacity: 'hide',
				height: 'hide'
			}, 'slow');
		}
		saveFrom.removeClass();
		saveFrom.addClass('acl-save-form-update');
		$('#add-user-title').html('Редактирование пользователя:<b> ' + userName + '</b>');
		$('#add-user').animate({
			opacity: 'show',
			height: 'show'
		}, 'slow');
	}

	function userAddRole(a, direct) {
		var roleOption;
		// прямой доступ к оптиону с данными роли 
		if (direct != undefined && direct != false) {
			roleOption = $(a);
		} else {
			roleOption = $(a).find(':selected');
		}
		var roleID = roleOption.val();
		var role = roleOption.text();
		if (role != '0') {
			var box = '<div id="role-' + roleID + '" title="' + role + '" class="rolebox">';
			box += role + '<a onfocus="this.blur();" onclick="userRemoveRole(\'' + roleID + '\');" class="role-del" title="Удалить" href="javascript:;"></a>';
			box += '</div>';
			roleOption.remove();
			$('#user_roles').append(box);
		}
	}

	function clearAllRoles() {
		$('#user_roles div').each(

		function(n, element) {
			roleID = $(element).attr('id').replace(/role-/, '');
			userRemoveRole(roleID);
		})
	}

	function userRemoveRole(roleID) {
		var roleBox = $('#role-' + roleID);
		$('#add-roles').append('<option id="role-' + roleBox.attr('title') + '" value="' + roleID + '">' + roleBox.attr('title') + '</option>');
		roleBox.remove();
	}
	//acl users : end
	//acl roles: Start
	var aclReloadAttentionTrig = false;

	function aclReloadAttention() {
		if (!aclReloadAttentionTrig) {
			aclReloadAttentionTrig = true; //перезагружать ACL перед выходом со страницы
			var aclReloadButton = $('#acl-reload-button')
			aclReloadButton.addClass('attention');
			aclReloadButton.delay(2000);
			aclReloadButton.mouseenter();
		}
	};
	$(window).unload(function() {
		if (aclReloadAttentionTrig) {
			if (confirm('Изменения вступят в силу только после перегрузки ACL, перезагрузить ACL сейчас?')) {
				aclReload();
			}
		}
	});

	function addRole() {
		var saveFrom = $('#add-role');
		showHide('#rule-role', 'hide');
		$('#add-role-title').html('Добавление новой роли');
		if (saveFrom.is(':visible')) {
			showHide(saveFrom, 'hide');
			if ($('#save_type').val() == 'add') return;
		}
		$('#save_type').val('add');
		clearRoleForm();
		saveFrom.removeClass();
		saveFrom.addClass('acl-save-form-add');
		showHide(saveFrom, 'show');
	}

	function delRole(roleID) {
		if (confirm('Вы подтверждаете удаление?')) {
			$.post('/admin/aclrole/del.php', 'delroleid=' + roleID, function(data) {
				if (!data.error) {
					$('#role-parent option[value="' + roleID + '"]').remove();
					showHide('#role-row-' + roleID, 'hide');
					$('#role-row-' + roleID).remove();
					if (roleID == $('#role_id').val()) {
						showHide('#add-role', 'hide')
						clearRulesTbl('hide');
					}
					if (roleID == $('#role_id').val()) {
						showHide('#add-role', 'hide')
						clearRulesTbl('hide');
					}
					nNoteShow('#flash-msg-nNote', 'nSuccess', data.msg);
				} else {
					showValidateErrors(data.msg);
				}
			}, 'json')
		}
	};

	function editRole(roleId) {
		var saveForm = $('#add-role');
		var roleName;
		$('#role-row-' + roleId + ' td').each(function(n, element) {
			switch (n) {
			case 0:
				roleName = $.trim($(element).text());
				$('#role_name').val(roleName);
				break;
			case 1:
				$('#role_acl').val($.trim($(element).text()));
				break;
			case 2:
				$('#role_parent option[value="' + $(element).attr('parentid') + '"]').attr('selected', true);
				break;
			default:
			}
		})
		$('#save_type').val('update');
		$('#role_id').val(roleId);
		if (saveForm.is(':visible')) {
			showHide(saveForm, 'hide');
		}
		showHide('#rule-role', 'hide');
		saveForm.removeClass();
		saveForm.addClass('acl-save-form-update');
		$('#add-role-title').html('Редактирование роли:<b> ' + roleName + '</b>');
		showHide(saveForm, 'show');
	}
	// серилизуем роль и отправляем на контроллер 

	function roleInfoSubmit() {
		var str = '';
		str = $('#role-info-form').serialize();
		$.post('/admin/aclrole/save.php', str, function(data) {
			if (data.error == true) {
				showValidateErrors(data.msg);
			} else {
				var roleRowHtml = '<td>' + data.role.name + '</td><td>' + data.role.role_acl_key + '</td><td parentid="' + data.role.parentid + '" >' + data.role.parentname + '</td><td>0</td><td><img class="table-btn" src="/adm/img/userRemove.png" onclick="delRole(\'' + data.role.id + '\')" title="Удалить" alt="Удалить" /><img src="/adm/img/formbuilder/edit.png" class="table-btn" onclick="editRole(\'' + data.role.id + '\')" title="Редактировать" alt="Редактировать" /><img class="table-btn" src="/adm/img/formbuilder/edit2.png" onclick="showRoleRules(\'' + data.role.id + '\')" title="Редактировать доступы" alt="Редактировать доступы" /></td>';
				showHide('#add-role', 'hide');
				if (data.role.type == 'add') {
					roleRowHtml = '<tr class="role-row" id="role-row-' + data.role.id + '">' + roleRowHtml + '</tr>';
/*   var tdArray=[];
             
             tdArray.push(data.role.name);
             tdArray.push(data.role.role_acl_key);
             tdArray.push(data.role.parentname);
             tdArray.push(0);
             tdArray.push('<img class="table-btn" src="/adm/img/userRemove.png" onclick="delRole(\'' + data.role.id + '\')" title="Удалить" alt="Удалить" /><img src="/adm/img/formbuilder/edit.png" class="table-btn" onclick="editRole(\'' + data.role.id + '\')" title="Редактировать" alt="Редактировать" />    <img class="table-btn" src="/adm/img/formbuilder/edit.png" onclick="showRoleRules(\'' + data.role.id + '\')" title="Редактировать доступы" alt="Редактировать доступы" />');
        
             var newRow = addRowJQueryTable('#acl-roles', tdArray);
              var jNewRow =$(newRow);
              jNewRow.attr('id','role-row-' + data.role.id);
              jNewRow.children('td').eq(2).attr('parentid',data.role.parentid);*/
					$('#acl-roles tbody').prepend(roleRowHtml);
					$('#role-row-' + data.role.id).hide();
					showHide('#role-row-' + data.role.id, 'show');
					$('#rule-role-title b').text(data.role.name);
					clearRulesTbl();
					// rule-role - добавления правил для роли 
					showHide('#rule-role', 'show');
					//устанавливаем скрытое поле с id роли для которой будут устанавливаться правила
					$('#rule_role_id').val(data.role.id);
					// добовляем новую роль в селектор выбора родительской роли
					var newRole;
					newRole = '<optons value=' + data.role.id + '>' + data.role.name + '</options>';
					$('#role_parent').append(newRole);
				} else {
					$('#role-row-' + data.role.id).html(roleRowHtml);
					$('#role_parent option[value=' + data.role.id + ']').text(data.role.name);
				}
				nNoteShow('#flash-msg-nNote', 'nSuccess', data.msg);
				clearRoleForm();
			}
		}, "json");
	}

	function clearRoleForm() {
		$('#role_name').val('');
		$('#role_acl').val('');
		$('#role_parent').val('');
	}
	// Получаем и строим правила для роли.

	function showRoleRules(roleId) {
		clearRulesTbl()
		clearRoleForm();
		$('#rule-role-title b').text($('#role-row-' + roleId + ' td:first').text());
		showHide('#add-role', "hide");
		showHide('#rule-role', 'show');
		$.getJSON('/admin/aclrole/getrules/roleid/' + roleId, function(data) {
			var items = [];
			$.each(data.rules, function(id, rule) {
				items.push('<tr  id="rule-row-' + id + '" class="rule-row"><td resourceid="' + rule.rid + '">' + rule.resource + '</td><td privilegeid="' + rule.pid + '">' + rule.privilege + '</td><td typeid="' + rule.typeid + '">' + rule.type + '</td><td><img class="table-btn" src="/adm/img/userRemove.png" onclick="delRoleRule(\'' + id + '\')" title="Удалить" alt="Удалить" /><img class="table-btn" src="/adm/img/formbuilder/edit.png" onclick="editRoleRule(\'' + id + '\')" title="Редактировать" alt="Редактировать" /></td>');
			});
			$('#acl-rules tbody tr:first').after(items.join(''));
		}, "json");
		$('#rule_role_id').val(roleId);
	};
	// очищяет таблицу правил для роли
	function clearRulesTbl(action) {
		//убираем все правила от продыдущей роли
		$('#acl-rules tbody .rule-row').remove();
		//прячим селекторы для редактирования правил
		$('#rule-selectors').hide();
		dropRuleSelectors();
		if (action != undefined && action == 'hide') {
			showHide('#acl-rules', 'hide');
		}
	}
	// $('#rule-row-'+ruleId).hide();
	// $('#rule-selectors').show();
	//showHide('#rule-selectors', 'show');
	// add rules start

	function addRoleRule() {
		// показываем все правила если они есть
		$('#acl-rules tbody .rule-row').show();
		//сбрасывем селекторы
		dropRuleSelectors();
		//перемещяем селекторы в начало таблицы;
		$("#acl-rules tbody").prepend($('#rule-selectors'));
		showHide('#rule-selectors', 'show');
		//устанавливаем спрятанные поля
		$('#rule-id').val('');
		$('#save-type').val('add');
	}
    
	// сбрасывает силекторы роли

	function dropRuleSelectors() {
		$('#rule-resurse option:selected').each(function() {
			this.selected = false;
		});
		$('#rule-privilege option:selected').each(function() {
			this.selected = false;
		});
		$('#rule-type option:selected').each(function() {
			this.selected = false;
		});
	}

	function editRoleRule(ruleId) {
		$('#rule-selectors').hide();
		$('#acl-rules tbody .rule-row').show();
		$('#rule-row-' + ruleId).before($('#rule-selectors'));
		dropRuleSelectors();
		$('#rule-row-' + ruleId + ' td').each(function(n, element) {
			switch (n) {
			case 0:
				$('#rule-resurse option[value="' + $(element).attr('resourceid') + '"]').attr('selected', true);
				break;
			case 1:
				$('#rule-privilege option[value="' + $(element).attr('privilegeid') + '"]').attr('selected', true);
				break;
			case 2:
				$('#rule-type option[value="' + $(element).attr('typeid') + '"]').attr('selected', true);
				break;
			default:
			}
		})
		$('#rule-row-' + ruleId).hide();
		$('#rule-selectors').show();
		//устанавливаем спрятанные поля
		$('#rule-id').val(ruleId);
		$('#save-type').val('update');
	}

	function cancelRoleRule() {
		$('#rule-selectors').hide();
		$('#acl-rules tbody .rule-row').show();
	}

	function delRoleRule(ruleId) {
		if (confirm('Вы подтверждаете удаление?')) {
			$.post('/admin/aclrole/delrule', 'delruleid=' + ruleId, function(data) {
				if (!data.error) {
					showHide('#rule-row-' + ruleId, 'hide');
					$('#rule-row-' + ruleId).remove();
					nNoteShow('#flash-msg-nNote', 'nSuccess', data.msg);
					aclReloadAttention();
				} else {
					showValidateErrors(data.msg);
				}
			}, "json")
		}
	};
	// серелизуем правило и отправляем на контроллер 

	function saveRoleRule() {
		var str = '';
		str = $('#rule-info-form').serialize();
		$.post('/admin/aclrole/saverule', str, function(data) {
			// получаем ответ, добовляем или обновляем правило в зависимости от типа сохранения
			if (data.error == true) {
				showValidateErrors(data.msg);
			} else {
				aclReloadAttention();
				var ruleRowHtml = '<td resourceid=' + data.rule.resource_id + '>' + $('#rule-resurse option[value=' + data.rule.resource_id + ']').text() + '</td><td privilegeid=' + data.rule.privilege_id + '>' + $('#rule-privilege option[value=' + data.rule.privilege_id + ']').text() + '</td><td typeid=' + data.rule.type + '>' + $('#rule-type option[value=' + data.rule.type + ']').text() + '</td><td><img class="table-btn" src="/adm/img/userRemove.png" onclick="delRoleRule(\'' + data.rule.id + '\')" title="Удалить" alt="Удалить" /><img class="table-btn" src="/adm/img/formbuilder/edit.png" onclick="editRoleRule(\'' + data.rule.id + '\')" title="Редактировать" alt="Редактировать" /></td>';
				$('#rule-selectors').hide();
				if (data.save_type == 'add') {
					ruleRowHtml = '<tr class="rule-row" id="rule-row-' + data.rule.id + '">' + ruleRowHtml + '</tr>';
					$('#acl-rules tbody tr:first').after(ruleRowHtml);
					$('#rule-row-' + data.rule.id).hide();
				} else {
					$("#rule-selectors").hide();
					$('#rule-row-' + data.rule.id).html(ruleRowHtml);
				}
				$('#acl-rules tbody .rule-row').show();
				nNoteShow('#flash-msg-nNote', 'nSuccess', data.msg);
			}
		}, "json");
	}

	function sleep(milliseconds) {
		var start = new Date().getTime();
		for (var i = 0; i < 1e7; i++) {
			if ((new Date().getTime() - start) > milliseconds) {
				break;
			}
		}
	}
    
    /*************************** typemanager *******************/
    
   	function sleep(milliseconds) {
   	    
        
        

	}
    
    /*************************** typemanager-end *******************/
 
	function delCompletedForm(Id) {
		if (confirm('Вы подтверждаете удаление?')) {
			$.post('/admin/clientform/delcompleted', 'delid=' + Id, function(data) {
				if (!data.error) {
					showHide('#completed-from-row-' + Id, 'hide');
					$('#completed-form-row-' + Id).remove();
					nNoteShow('#flash-msg-nNote', 'nSuccess', data.msg);
				} else {
					showValidateErrors(data.msg);
				}
			}, 'json')
		}
	};
	//Показываем заполненную форму полностью

	function seeCompletedForm(id) {
		showHide('#completed-form-warapp', 'show');
		$.get('/admin/clientform/completedform/key/' + id, function(data) {
			$('#completed-form-full').html(data);
		}, 'html');
		$("#completed-form-head b").text($('#completed-form-row-' + id + ' td:first').text());
	};
	//Перезагружаем ACL после изменения ролей и правил

	function aclReload() {
		aclReloadAttentionTrig = false;
		$('#acl-reload-button').removeClass('attention');
		$.get('/admin/acl/reload/', function(data) {
			nNoteShow('#flash-msg-nNote', 'nSuccess', data.msg);
		}, 'json');
	};

	function count_prs(obj) {
		var count = 0;
		for (var prs in obj) {
			if (this.win.hasOwnProperty(prs)) count++;
		}
		return count;
	}

	function showRoleRules(roleId) {
		clearRulesTbl()
		clearRoleForm();
		$('#rule-role-title b').text($('#role-row-' + roleId + ' td:first').text());
		showHide('#add-role', "hide");
		showHide('#rule-role', 'show');
		$.getJSON('/admin/aclrole/getrules/roleid/' + roleId, function(data) {
			var items = [];
			$.each(data.rules, function(id, rule) {
				items.push('<tr  id="rule-row-' + id + '" class="rule-row"><td resourceid="' + rule.rid + '">' + rule.resource + '</td><td privilegeid="' + rule.pid + '">' + rule.privilege + '</td><td typeid="' + rule.typeid + '">' + rule.type + '</td><td><img class="table-btn" src="/adm/img/userRemove.png" onclick="delRoleRule(\'' + id + '\')" title="Удалить" alt="Удалить" /><img class="table-btn" src="/adm/img/formbuilder/edit.png" onclick="editRoleRule(\'' + id + '\')" title="Редактировать" alt="Редактировать" /></td>');
			});
			$('#acl-rules tbody tr:first').after(items.join(''));
		}, "json");
		$('#rule_role_id').val(roleId);
	};
    
    
$(function(){
    
   $('#types-table-wrapper').ajaxLeaf({
    
			loadUrl:'/admin/typesmanager/loadtypes/',
			itemsContainer: '#acl-users',
            
            collectInfo:function(wrap) {
                     var addInfo = '&name='+wrap.find('#type-name').val();
                         addInfo+= '&desc='+wrap.find('#type-desc').val();
               	     return addInfo;
				},
                
            dropFiltres:function(wrap) {
                     wrap.find('#type-type').val('');
                     wrap.find('#type-desc').val('');
             	},    
                 
            dropFiltresButtonInd: '.drop_filtres',   
            srchButtonInd: '.srchbutton',
   			"renderItems": function(items) {
    				var itemsHtml = [];
    				$.each(items, function(id, v) {
    				itemsHtml.push('<tr class="type_row" id="type-row-' + v.type_id + '" rel="' + v.name + '" ><td>' + v.name + '</td><td>' + v.desc + '</td><td><a href="/admin/typesmanager/edit/id/' + v.type_id + '" class="type_edit"></a><a title="Вы действительно хотите удалить данный тип?" href="javascript:void(0);" class="type_delete" rel="' + v.name + '"></a><a onclick="return !window.open(\'/admin/typesmanager/exporttype/typeid/' + v.type_id + '/\')" title="Экспортировать тип" href="/admin/typesmanager/exporttype/typeid/' + v.type_id + '/" class="type_export" rel="' + v.type_id + '"></a></td></tr>');
                    });
                    
    				return itemsHtml;
			}
   }); 
 



  /*
  $("#tree_title").syncTranslit({
    destination: "tree_name",
    urlSeparator: "-"
  });*/
  
});
    
     // добавление модели в панели разработчика 
    function addModel(){
        
        $.get('/admin/devtools/addmodel/', function(data){
            
             flyboxOpen(800+44,450, 'Добавить', '<div style="padding:0 10px;width:800px;height:450px;overflow-x:auto">'+data+'</div>');
           
        },'html');
        
    }
        
     // добавление контроллера в панели разработчика 
    function addController(){
        
        $.get('/admin/devtools/addcontroller/', function(data){
            
             flyboxOpen(800+44,450, 'Добавить', '<div style="padding:0 10px;width:800px;height:450px;overflow-x:auto">'+data+'</div>');
           
        },'html');
        
    }
    
    // добавление HMVC модуля в панели разработчика 
    function addHMVCblock(){
        
        $.get('/admin/devtools/addHMVC/', function(data){
            
             flyboxOpen(800+44,450, 'Добавить', '<div style="padding:0 10px;width:800px;height:450px;overflow-x:auto">'+data+'</div>');
           
        },'html');
        
    }
  
    
  
    