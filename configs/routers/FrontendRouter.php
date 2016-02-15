<?php 

/**
 * Forum Module router
 * /forum/[short-controller-action]/fixed-params
 */

class FrontendRouter implements K_Request_Irouter {
	public function assemble( $url = null ) {
                        
		if ( empty($url) ) {
			$url = $_SERVER['REQUEST_URI'];
		}

		$matches = array();
		$pattern = '/\/[a-z0-9\/_-]*/';
		                		
		if ( preg_match( $pattern, $url, $matches ) && (strpos($url, '/forms') !== 0 && strpos($url, '/admin') !== 0))
		{
            
            
			if (strpos($url, '/ajax') !== 0)
			{
			
			/*
				if (strpos($url, '/_p/') !== false)
				{
					$urlData = explode('/_p/', $url);
					$url = $urlData[0].'/';
					$page = $urlData[1];
					
					$_GET['page'] = $page;
				}
			*/
				$result = array(
					'module'     => 'site',
					'controller' => 'index',
					'action'     =>	'page',
					'params'     =>	array($url)
				);
			}
			else
			{
				$result = array(
					'module'     => 'ajax',
					'controller' => 'index',
					'action'     =>	'index',
					'params'     =>	explode('/', $url),
				);
			}
			
			return $result;
		}

		return FALSE;
	}
}

?>