<?php

class Site_Controller_Index extends Controller{
	/* {public} */

	public $helpers = array('paginator', 'call', 'error', 'form', 'include', 'ru', 'prevnext');


	public $layout = 'layout';
	private $configs = array();
	private $staticPage;

	private $nodeItem = array(); // информация о единичной ноде к которой идёт запрос
	private $parentNodeItem = array(); // информация о родителе единичной ноды к которой идёт запрос

	public function onInit(){

	}

	public function pageAction(){

		// var_dump(K_File::rdir(ROOT_PATH.'/www/upload'));

		//  require_once('J:\home\premier.loc\application\api\news_transfer.php');
		// die;

		$link = '/pages';

		$this->paramLink = $this->getParam(0);

		//убираем гет строку
		$qpos = strpos($this->paramLink, '?');

		if ($qpos){

			$this->prezentGetParams = true;

			$this->paramLink = substr($this->paramLink, 0, strpos($this->paramLink, '?'));

		}

		if (strpos($this->paramLink, '/uk/') !== false){

			$this->paramLink = str_replace('/uk/', '', $this->paramLink);

			K_Crumbs::add(array('Головна', '/'));

			$regLang = 'uk';

			K_Registry::write('lang', $regLang);

			$addLangLink = 'uk/';

		} else{


			K_Crumbs::add(array('Главная', '/'));

			$regLang = 'ru';

			K_Registry::write('lang', $regLang);

		}
		switch (K_Url::get()->expPath[0]){
			case 'taxi-about-us':
				K_Crumbs::add(array('О компании', 'taxi-about-us'));
				break;
			case 'taxi-price':
				K_Crumbs::add(array('Услуги', 'taxi-price'));
				break;
			case 'taxi-contact-us':
				K_Crumbs::add(array('Контакты', 'taxi-contact-us'));
				break;
			case 'peregon-avto':
				K_Crumbs::add(array('Перегон авто', 'peregon-avto'));
				break;
			case 'skorost-i-bezopasnost':
				K_Crumbs::add(array('Скорость и безопасность', 'skorost-i-bezopasnost'));
				break;
			case 'luchshie-tsenyi':
				K_Crumbs::add(array('Лудшие цены', 'luchshie-tsenyi'));
				break;
			case 'perevozka-gruzov':
				K_Crumbs::add(array('Перевозка грузов', 'perevozka-gruzov'));
				break;
			case 'bonusi-i-skidki':
				K_Crumbs::add(array('Бонусы и скидки', 'bonusi-i-skidki'));
				break;
			case 'beznalichnii-raschet':
				K_Crumbs::add(array('Безналичный расчет', 'beznalichnii-raschet'));
				break;
		}

		$this->view->paramLink = $this->paramLink;


		$this->paramLink = trim($this->paramLink, '/');

		// если страница не найдена добавляем в хедер 404 ошибку
		if (empty($this->paramLink) || $this->paramLink == "/"){
			$pageIndex = 'index';
			$this->view->onMain = true;
		}

		if ($linkRouter = $this->preRouter("/".$this->paramLink."/")){
			$this->view->page = $page = $this->treePage($linkRouter);
		} else{
			$this->view->page = $page = $this->treePage('/pages/'.$addLangLink.$this->paramLink.$pageIndex.'/');
		}

		// строим страницу через treePage, если страница не найдена выводим 404 ошибку
		if (!$this->view->page){

			header("HTTP/1.0 404 Not Found");
			$this->treePage("/pages/404/");

		}

	}

	/** treePage  строит страницу из дерева типов или вовзвращяет false если страница на найденна
	 *
	 *
	 */

	private function treePage($link){

		$nodes = K_TreeQuery::crt($link)->go(array('aliases' => true));

		$metaParams['pageArgs'] = $this->pageArgs;

		$metaParams['link'] = $this->paramLink;

		// var_dump($link); Ссылка поиска страницы к дереву типов

		$this->meta = $metaParams;

		// echo $link;
		// echo '<br/>';

		$this->staticPage = $nodes[0];

		// проверка на страницу к кторой идёт запрос

		// var_dump($nodes);

		$this->view->leftMenu = $this->genLeftMenu();// takeoff - генерируем меню

		if (!$nodes[0] || $nodes[0]['tree_type'] != 'page'){ //понимаем что запрос к странице по типу

			//echo $this->paramLink;

			//echo $this->paramLink;
			$TQnode = K_TreeQuery::crt($this->paramLink);

			$nodeMeta = $TQnode->getUseNode();

			// запрашиваем блоки для этой ноды, в /page_types/, в зависимости от типа вывода, списка или одного итема
			// если тип ноды папка, то ищим не по типу а по названию.

			if ($nodeMeta['tree_type'] == "folder" || $nodeMeta['tree_type'] == "list"){

				$typeP = $nodeMeta['tree_name'];
				$this->howShow = 'list';

			} else{

				$typeP = $nodeMeta['tree_type'];

			}

			$TQnode = K_TreeQuery::crt('/page_types/'.$typeP.'/'.$howShow.'/');

			if ($TQnode->getUseNode()){

				$nodeItem = $TQnode->go(array('aliases' => true));

			} else{

				$this->howShow = $this->howShow == 'list' ? 'item' : 'list';

				$TQnode = K_TreeQuery::crt('/page_types/'.$typeP.'/'.$this->howShow.'/');

				$nodeItem = $TQnode->go(array('aliases' => true));
			}

			//  echo '/page_types/'.$typeP.'/'.$howShow.'/' ;
			//запрашиваем ноду по линку запроса

			if ($this->howShow == 'list' || $nodeMeta['tree_type'] == "folder" || $nodeMeta['tree_type'] == "list"){

				if ($nodeItem[0]['tree_type'] == 'filter'){

					$filterArr = $nodeItem[0];
				}

				$offset = $this->pageArgs['num'] * $this->pageArgs['count'] - $this->pageArgs['count'];

				if ($filterArr){

					$filterTypes = array_map('trim', explode(',', $filterArr['types']));

					$ordered = json_decode(stripcslashes($filterArr['group']), true);

					$treeObj = K_TreeQuery::crt($this->paramLink)->types($filterArr['types'])->order($ordered)->limit($this->pageArgs['count'], $offset);

					if ($filterArr['condition']){

						$treeObj->condit(array($filterArr['types'] => ' '.$filterArr['condition']));

					}

					list($paramNode, $metaParams['count']) = $treeObj->go(array('test' => true, 'count' => true, 'orderby' => array('DESC', 'DESC')));

				} else{

					list($paramNode, $metaParams['count']) = K_TreeQuery::crt($this->paramLink)->limit($this->pageArgs['count'], $offset)->go(array('aliases' => true, 'childs' => true, 'test' => true, 'count' => true));

				}

				$this->howShow = 'list';

			} else{

				$nodesR = K_TreeQuery::gNodes($this->paramLink, 1);
				$paramNode = $nodesR [0];

			}
			//var_dump($this->paramLink);

			// K_debug::get()->addMessage('link '.'/page_types/'.$paramNode['tree_type'].'/');
			// K_debug::get()->dump($nodeItem);
			// запрашиваем информацию для этой ноды
			// $paramNode= cTree::gNodes($this->paramLink,1);
			// K_debug::get()->dump($paramNode);

			$this->view->prevNextActive = false;

			// var_dump($paramNode);
			// var_dump($nodeItem[0]);


			if ($nodeItem[0] && $paramNode){ // страница итема

				K_JsParams::add('nowShow', $this->howShow);

				$this->view->title = $nodeMeta['title'];
				$this->view->mkeys = $nodeMeta['mkeys'];
				$this->view->mdesc = $nodeMeta['mdesc'];
				$this->view->activeMenu = $nodeMeta['activemenu'];

				$this->view->node = $this->nodeItem = &$paramNode;


				$metaParams['link'] = $this->paramLink;


				$this->meta = $metaParams;


				//строим блоки и станицу итема

				$blocks = $this->getBlocks($nodeItem);

				$this->view->breadcrumbs = K_breadcrumbs::get();

				// echo  $typeP.' - '.$howShow;

				$blocks['middle'][] = K_Request::call(array('module' => 'typebloks', 'controller' => $typeP, 'action' => $this->howShow, 'params' => array('node' => $paramNode, 'meta' => $metaParams)));

				$this->view->content = $blocks;

			} else{

				return false;

			}

		} else{ // кастомная страница


			// $this->view->title = $nodes[0]['title'];

			//  $this->view->mkeys = $nodes[0]['mkeys'];

			// $this->view->mdesc = $nodes[0]['mdesc'];

			K_Seo::set($nodes[0]);

			//$this->view->currentMenuItem = $this->paramLink;

			//строим блоки и кастомную страницу
			$this->view->content = $this->getBlocks($nodes);
			$this->view->breadcrumbs = K_breadcrumbs::get();

			// K_debug::get()->addMessage('node  '.$nodes[0]['tree_type']);
			// K_debug::get()->dump($nodes);
		}

		$this->view->title = K_Seo::$title;

		$this->view->mkeys = K_Seo::$keywords;

		$this->view->mdesc = K_Seo::$description;

		$this->view->canonical = K_Seo::$canonical;


		//  $this->view->menuItems = K_TreeQuery::crt($this->view->node['menu'])->type('link')->go(array('childs'=>true));

		$this->view->jsGlobalOptions = K_JsParams::output();

		return trim($link, '/');

	}


	/*
	   private function getItemBlocks($node, $paramNode,$howShow,$nodeMeta,$typeP) {
			//$typeBlocks=cTree::getTypeBlocks($nodeItem[0]['tree_type']);

		   $this->nodeItem = $paramNode[0];
		   $blocks = $this->getBlocks($node);

		   var_dump($this->nodeItem);

		   $blocks['middle'][] = K_Request::call(array(
									 'module'     => 'typebloks',
									 'controller' => $typeP,
									 'action'     => $howShow == 'list' ? 'list' : 'item',
									 'params'     => array('node' =>$paramNode)
									 )
								   );

		   // $this->bd_simpleTypeBlock($paramNode[0]);

		   return $blocks;
	   }
   */


	/** listRouter  обработчик списка вывода и пагинации
	 *
	 *
	 */

	private function listRouter($paramLink){


		$paramArr = explode('.', $paramLink);

		// var_dump($paramArr);
		//
		$paramLink = $paramArr[0];

		// на всякий случай определимся как мы будем показывать тип
		$this->howShow = $paramArr[1] == 'list' ? 'list' : 'item';

		if ((int)$paramArr[1]){//если вторым элементом идёт число, то сразу можно определить список
			$this->howShow = 'list';
			$argnum = 1;
		} else{
			$argnum = 2;
		}

		$this->pageArgs['num'] = $paramArr[$argnum] ? $paramArr[$argnum] : 1;

		if (!empty($paramArr[$argnum + 1]) && (int)($paramArr[$argnum + 1])){
			$this->pageArgs['count'] = $paramArr[$argnum + 1] > 100 ? 100 : $paramArr[$argnum + 1];//должно браться из настроек
		} else $this->pageArgs['count'] = 10;


		return $paramLink;
	}

	/** preRouter дополнительный роутинг который проверяет ссылки первого уровня
	 */

	private function preRouter($link){
//		Новость
		$oneNode = K_TreeQuery::gOne('/news'.$link, 'news');

		if (!empty($oneNode)){
			K_Registry::write('one', $oneNode);
			K_Seo::set($oneNode);
			return $link = '/system-pages/one/';
		}

//		Вакансия
		$oneNode = K_TreeQuery::gOne('/vacancies'.$link, 'vacancy');

		if (!empty($oneNode)){
			K_Registry::write('one', $oneNode);
			K_Seo::set($oneNode);
			return $link = '/system-pages/onevacancy/';
		}

		//********************  Статья отдельно.
		$articleNode = K_TreeQuery::gOne('/articles'.$link, 'articles');

		if (!empty($articleNode)){

			// если есть статья с такой ссылкой переходим на неё
			K_Registry::write('articles', $articleNode);
			K_Seo::set($articleNode);

			return $link = '/system-pages/article/';

		}

		return false;
	}

	/** getBlocks загрузка и формирование блоков
	 *
	 * @param $nodes
	 * @return $rBlocks
	 *
	 */

	private function getBlocks($nodes){
		$parentNode = $nodes[0];
		$blocks = array();
		$rBlocks = array();

		$lastBlock = null;
		$lastBlockName = '';


		// загрузка базовых блоков
		$doNotLoadBaseBlock = array(
			'footer' => false
		);

		foreach ($nodes as $nodeKey => $node){
			if ($node['tree_pid'] == $parentNode['tree_id'] && ($node['tree_type'] == 'folder' || $node['tree_type'] == 'list')){
				if ($node['tree_name'] == 'left'){
					$lastBlock = $node['tree_id'];
					$lastBlockName = 'left';
					$doNotLoadBaseBlock['left'] = true;
				} elseif ($node['tree_name'] == 'right'){
					$lastBlock = $node['tree_id'];
					$lastBlockName = 'right';
					$doNotLoadBaseBlock['right'] = true;
				} elseif ($node['tree_name'] == 'middle'){
					$lastBlock = $node['tree_id'];
					$lastBlockName = 'middle';
					$doNotLoadBaseBlock['middle'] = true;
				} elseif ($node['tree_name'] == 'widgets'){
					$lastBlock = $node['tree_id'];
					$lastBlockName = 'widgets';
					$doNotLoadBaseBlock['widgets'] = true;
				} elseif ($node['tree_name'] == 'content'){

					$lastBlock = $node['tree_id'];
					$lastBlockName = 'content';
					// $doNotLoadBaseBlock['content'] = true;
				} elseif ($node['tree_name'] == 'footer'){
					$lastBlock = $node['tree_id'];
					$lastBlockName = 'footer';
					$doNotLoadBaseBlock['footer'] = true;
				} else{
					$lastBlock = $node['tree_id'];
					$lastBlockName = 'middle';
					$doNotLoadBaseBlock['middle'] = true;
					$blocks[$lastBlockName][] = $node;
				}
			} else{

				if ($lastBlock && $lastBlockName && $node['tree_pid'] == $lastBlock){

					$blocks[$lastBlockName][] = $node;
				}
			}
		}


		$links = array();

		foreach ($doNotLoadBaseBlock as $blockType => $dontLoadBlocks){
			if (!$dontLoadBlocks){
				$links[] = $blockType;
			}
		}

		if (sizeof($links) > 0){
			$baseNodes = K_TreeQuery::crt('/pages/defoult/')->go(array('aliases' => true));

			foreach ($baseNodes as $nodeKey => $node){
				if ($node['tree_pid'] == $baseNodes[0]['tree_id'] && ($node['tree_type'] == 'folder' || $node['tree_type'] == 'list')){
					if (in_array($node['tree_name'], $links)){

						if ($node['tree_name'] == 'left'){
							$lastBlock = $node['tree_id'];
							$lastBlockName = 'left';
							$doNotLoadBaseBlock['left'] = false;
						}

						if ($node['tree_name'] == 'right'){
							$lastBlock = $node['tree_id'];
							$lastBlockName = 'right';
							$doNotLoadBaseBlock['right'] = false;
						}

						if ($node['tree_name'] == 'middle'){
							$lastBlock = $node['tree_id'];
							$lastBlockName = 'middle';
							$doNotLoadBaseBlock['middle'] = false;
						}

						if ($node['tree_name'] == 'widgets'){
							$lastBlock = $node['tree_id'];
							$lastBlockName = 'widgets';
							$doNotLoadBaseBlock['widgets'] = false;
						}

						if ($node['tree_name'] == 'content'){
							$lastBlock = $node['tree_id'];
							$lastBlockName = 'content';
							$doNotLoadBaseBlock['content'] = false;
						}

						if ($node['tree_name'] == 'footer'){
							$lastBlock = $node['tree_id'];
							$lastBlockName = 'footer';
							$doNotLoadBaseBlock['footer'] = false;
						}
					}
				} elseif ($lastBlock && $lastBlockName && !$doNotLoadBaseBlock[$lastBlockName] && $node['tree_pid'] == $lastBlock){
					$blocks[$lastBlockName][] = $node;
				}
			}
		}

		$noLoadBlockTypes = array('folder', 'page', 'list');
		///Загрузка блоков по модулям
		foreach ($blocks as $blockType => $typeBlocks){

			$countElements = sizeof($typeBlocks);

			for ($i = 0; $i < $countElements; $i++){

				if (!in_array($typeBlocks[$i]['tree_type'], $noLoadBlockTypes)){

					if ($typeBlocks[$i]['tree_type'] != 'block'){

						$block = $this->HMVCblock($typeBlocks[$i], $typeBlocks[$i]['tree_type']);

					} elseif (isset($typeBlocks[$i]['content']) && $typeBlocks[$i]['content']){


						if ($typeBlocks[$i]['template'] == 'Без шаблона'){/// @todo когда сделаю селекты, переделать на нормальный латинский токен

							$block = $this->loadBlock($typeBlocks[$i], false);

						} elseif (!$typeBlocks[$i]['template'] || $typeBlocks[$i]['template'] == 'Стандартный шаблон старшего модуля'){

							$block = $this->loadBlock($typeBlocks[$i], $blockType);


						} else{

							$block = $this->loadBlock($typeBlocks[$i], $typeBlocks[$i]['template']);

						}

					} elseif (!empty($typeBlocks[$i]['action'])){

						$block = $this->HMVCblock($this->nodeItem, $typeBlocks[$i]['action']);

					}

					// $this->{'b_' . self::blockActionToMethod($typeBlocks[$i]['action'])}($typeBlocks[$i]);
					$rBlocks[$blockType][$i] = $block;

				}
			}
		}


		///Дозагрузка блоков в контент
		if (!isset($rBlocks['content'])){

			foreach ($nodes as $nodeKey => $node){
				if ($node['tree_pid'] == $parentNode['tree_id'] && !in_array($node['tree_type'], $noLoadBlockTypes)){

					if ($node['tree_type'] != 'block'){

						$block = $this->HMVCblock($node, $node['tree_type']);

					} elseif (isset($node['content']) && $node['content']){


						if ($node['template'] == 'Без шаблона'){/// @todo когда сделаю селекты, переделать на нормальный латинский токен

							$block = $this->loadBlock($node, false);

						} elseif (!$node['template'] || $node['template'] == 'Стандартный шаблон старшего модуля'){

							$block = $this->loadBlock($node, $blockType);


						} else{

							$block = $this->loadBlock($node, $node['template']);

						}

					} elseif (!empty($node['action'])){

						$block = $this->HMVCblock($this->nodeItem, $node['action']);

					}

					//$this->{'b_' . self::blockActionToMethod($node['action'])}($node);
					$rBlocks['content'][] = $block;

				}
			}
		}

		return $rBlocks;
	}


	/** Загружает HMVCblock у которого есть свой шаблон и контроллер
	 *
	 * @param $node нода блока
	 * @param $template шаблон блока который надо подключить
	 * @return
	 *
	 */

	private function HMVCblock($node, $block = false){

		return K_Request::call(array(

			'module' => 'blocks', 'controller' => $block ? $block : $node['action'], 'action' => 'index', 'params' => array('node' => $node, 'own' => $this->nodeItem, 'meta' => $this->meta)));

	}

	/** Загружает блоки и цепляет шаблоны для них
	 *
	 * @param $node надо блока
	 * @param $template шаблон блока который надо подключить
	 * @return поключенный отрендеренный шаблон блока
	 *
	 * Конвенции $node['content'] - сюда рендериться пользователький шаблон
	 *
	 */

	private function loadBlock($node, $template = false){

		// шаблонизатор в шаблоне, параметры беруться из страницы

		if (isset($node['templater_on']) && $node['templater_on'] == "Да"){ ///@todo отрефакторить, когда сделаю нормальные селекты на on/off

			/// шаблонизатор http://webew.ru/articles/3609.webew

			$templater = new Templater; ///@todo phalcon integration: сделать возможность менять шаблонизатор на phalcon volt

			foreach ($this->staticPage as $k => $v){

				/// выбираем все поля с префиксом templater_
				if (preg_match('/templater_/', $k)){

					$data[str_replace('templater_', '', $k)] = $v;

				}

			}

			$node['content'] = $templater->parse($data, $node['content'], false, false);
		};

		if (!$template){

			$result = $node['content'];

		} else{


			$result = '';

			ob_start();

			if (!$template){

				include(APP_PATH.'/blocks/_simple/block.phtml');

			} else{

				include(APP_PATH.'/blocks/_simple/block-'.$template.'.phtml');

			}

			$result = ob_get_contents();

			ob_end_clean();

		}

		return $result;
	}

	/** Методы блоков
	 *  подключает html шаблоны блоков
	 *
	 *
	 */

	private function bd_simpleTypeBlock($node){

		$result = '';

		if (is_dir(APP_PATH.'/blocks/'.$node['tree_type'])){
			include(APP_PATH.'/blocks/'.$node['tree_type'].'/item.phtml');
		}

		return K_Request::call(array('module' => 'typebloks', 'controller' => $node['tree_type'], 'action' => 'item', 'params' => array('node' => $node)));
	}

	/** Згружает блок с клиентской формой
	 *
	 */
	private function blockForm($params = array()){
		$result = '';

		$this->view->type = $_GET;
		$this->view->loadFormTemplate(array('formStart' => '<div class="mainForm"><div style="display: none;" class="nNote nSuccess hideit" id="flash-msg-nNote"><p></p></div>', 'formEnd' => '</div>', 'row' => '<div class="rowElem noborder user-form-row"><label>{{label}}:</label><div class="formRight">{{element}}</div><div class="fix"></div></div>', 'row_submit' => '{{element}}', 'row_reset' => '{{element}}', 'row_file' => '<div class="rowElem noborder user-form-row"><label>{{label}}:</label><div class="formRight" >{{element}}</div><div class="fix"></div></div>', 'row_select' => '<div class="rowElem noborder user-form-row"><label>{{label}}:</label><div class="formRight" >{{element}}</div><div class="fix"></div></div>', 'checkbox' => '<div class="rowElem noborder user-form-row"><label>{{label}}:</label><div class="formRight" >{{element}}</div><div class="fix"></div></div>', 'radio' => '<div class="rowElem noborder user-form-row"><label>{{label}}:</label><div class="formRight" >{{element}}</div><div class="fix"></div></div>', 'row_formbuilder' => '{{element}}'));

		ob_start();

		include(APP_PATH.'/blocks/client_form.phtml');

		$result = ob_get_contents();
		ob_end_clean();

		return $result;
	}

	/// шаблонизатор рендеринга блока
	private function templateRender($data, $template){

		/// шаблонизатор http://webew.ru/articles/3609.webew
		$templater = new Templater;

		return $templater->parse($data, $template, false, false);
	}

	private function genLeftMenu(){

		$menu_arr = K_CupTree::rootPath(K_TreeQuery::crt('/leftmenu/')->types(array('menulink'))->go(), '/leftmenu/');


		return K_Menu::buildTreeMenu($menu_arr, 0, $this->meta['link']);

	}

}
