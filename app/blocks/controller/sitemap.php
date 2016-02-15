<?php defined('K_PATH') or die('DIRECT ACCESS IS NOT ALLOWED');

class Blocks_Controller_Sitemap extends Controller{

	public $helpers = array('editor');

	public function indexAction(){

		//кастомные страницы
		$staticPages = K_TreeQuery::crt("/pages/")->types('page')->go();

		$noInSitemap = array('baseblocks', '404', 'sitemap');

		foreach ($staticPages as $v){
			if (!in_array($v['tree_name'], $noInSitemap)){

				$v['tree_level'] = '1';

				$sitemArr[] = $v;

			}
		}
		$sitemArr = array_merge($sitemArr,


			K_TreeQuery::crt("/news/")->types('news')->go()

		);


		$sitemArr[] = array('tree_type' => 'page', 'tree_name' => 'service', 'title' => 'Услуги', 'tree_level' => '1');


		$sitemArr = array_merge($sitemArr,

			K_TreeQuery::crt("/service/")->types('service')->go()


		);


		$sitemArr[] = array('tree_type' => 'page', 'tree_name' => 'promo', 'title' => 'Акции', 'tree_level' => '1');

		$sitemArr = array_merge($sitemArr,

			K_TreeQuery::crt("/promo/")->types('promo')->go()

		);

		$sitemArr[] = array('tree_type' => 'page', 'tree_name' => 'portfolio', 'title' => 'Портфолио', 'tree_level' => '1');

		$sitemArr = array_merge($sitemArr,

			K_TreeQuery::crt("/portfolio/")->types('portfolio')->go()

		);
		$this->view->sitemap = $this->menuBuilder($sitemArr, 1);
	}

	private function menuBuilder($menu_arr, $levelMod = 0, $link){

		$menuHtml = '';
		$first_ol = true;
		$level_tmp = -1;
		$menu_html = '';
		$multi_item = false;
		$level_up = false;
		$multi_li = false;
		$length = count($menu_arr);

		$absolut_level = $levelMod;
		$start_tree_level = $menu_arr[0]['tree_level'];

		if ($menu_arr && count($menu_arr)){
			$linkArr = explode('/', trim($link, '/'));


			$linkRazdel = '';
			foreach ($linkArr as $v){
				if ($v){
					$linkIdsArr[] = trim($v);
					$linkRazdel = '/'.implode('/', $linkIdsArr).'/';
					$menulinks[] = $linkRazdel;
				}
			}


			for ($k = 0; $k < $length; $k++){

				$level_up = false;

				if ($menu_arr[$k]['tree_level'] > $level_tmp){ //углубляемся на 1 уровень
					$absolut_level++;

					if ($first_ol)
						$menu_html .= '<ul>';// первая категория
					else
						$menu_html .= '<ul '.$hided.'>';

					$first_ol = false;
					$level_tmp = $menu_arr[$k]['tree_level']; //сохроняем уровень в ктором находимся

				} else if ($menu_arr[$k]['tree_level'] < $level_tmp){ //подымаемся на n уровней

					$menu_html .= '</li>';
					$absolut_level -= $level_tmp - $menu_arr[$k]['tree_level'];
					$menu_html .= str_repeat('</ul></li>', $level_tmp - $menu_arr[$k]['tree_level']).'';
					$level_tmp = $menu_arr[$k]['tree_level'];

				} else{
					$menu_html .= '</li>';
				}

				$menulink = trim(implode('/', array_slice($link, 0, $start_tree_level + $absolut_level - $levelMod)).'/');
				// echo md5($menulink).'-'. md5($menu_arr[$k]['tree_link']).'<br>';

				/*if($menulink == $menu_arr[$k]['tree_link']){
					 echo"active";
				  }*/
				$menu_html .= '<li><a href="'.($menu_arr[$k]['tree_type'] == 'page' ? $menu_arr[$k]['tree_name'] : $menu_arr[$k]['tree_link']).'" class="link-'.$absolut_level.'-level '.(in_array($menu_arr[$k]['tree_link'], $menulinks) ? 'active' : '').'" >'.(empty($menu_arr[$k]['title']) ? $menu_arr[$k]['tree_title'] : $menu_arr[$k]['title']).'</a>';
				$level_save = $menu_arr[$k]['tree_level'] - $start_tree_level;
			}
			return $menu_html .= str_repeat('</li></ul>', $level_save + 1);
		}
	}


}