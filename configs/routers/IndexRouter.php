<?php 

/**
 * Forum Module router
 * /forum/[short-controller-action]/fixed-params
 */

class IndexRouter implements K_Request_Irouter {
	public function assemble( $url = null ) {
                        
		if ( empty($url) ) {
			$url = $_SERVER['REQUEST_URI'];
		}

		$matches = array();
		$pattern = '#^(\/)$#is';
                		
		if ( preg_match( $pattern, $url, $matches ) )
		{
			$params = array();
		
			if ( !empty($matches['params']) ) {
				$p = explode( '/', $matches['params'] );
				if ( count($p)) {
					for ($i=0; $i<count($p); $i++) {
						$params[] = isset( $p[$i] )? $p[$i] : null;
					}
				}
			}

			if (isset($matches['page'])) $params['page'] = $matches['page'];
			if (isset($matches['controller']) && $matches['controller'] == 'categories') $matches['action'] = 'showCategories';
                        
			$result = array(
				'module'     => 'site',
				'controller' => 'index',
				'action'     =>	'index',
				'params'     =>	$params
			);
			
			return $result;
		}

		return FALSE;
	}
}

?>