<?php defined('K_PATH') or die('DIRECT ACCESS IS NOT ALLOWED');

class Type_Controller_News extends Controller {

	/* {public} */
	public $layout = 'layout';
	public static $allowedChildren = array();
	public static $allowedParents = array();
	public static $fields = array('0', '1', '2', '3', '4', '5', '6');

	/* {private} */
	private $typeNewsTable;

	public function onInit()
	{
		$this->typeNewsTable = new Type_Model_News();

	}

	/* {actions} */
	public function indexAction()
	{
		$this->showAction();
	}

	public function showAction()
	{
		if ($this->getParam('link'))
		{
			$result = $this->typeNewsTable->select()->where('`tree_link` = '.$this->getParam('link'))->fetchRow()->toArray();
			$this->render('type_news_item');
		}
		else
		{
			$result = $this->typeNewsTable->select()->fetchArray();
			$this->render('type_news');
		}
	}

	public function createAction()
	{
		$valuesToAdd = array();
		if (isset($_POST) && !empty($_POST))
		{
			foreach ($_POST as $key => $value)
			{
				if (in_array($key, $this->fields))
				{
					$valuesToAdd[$key] = $value;
				}
			}

			$insertId = $this->typeNewsTable->save($valuesToAdd);
	    }
      
	}

	public function updateAction()
	{
		$valuesToUpdate = array();
		if (isset($_POST) && !empty($_POST) && $this->getParam(0))
		{
			foreach ($_POST as $key => $value)
			{
				if (in_array($key, $this->fields))
				{
				$valuesToUpdate[$key] = $value;
				}
			}

			$insertId = $this->typeNewsTable->update($valuesToUpdate, '`tree_id`= '.$this->getParam(0).'');
		}
	}

	public function deleteAction()
	{
		if ($this->getParam(0))
		{
			$this->typeNewsTable->select()->where('`tree_id` = '.$this->getParam(0))->remove();
		}
	}
    
   	public static function onDelete($data)
	{
	 $commentModel = new Admin_Model_Comment;
     $commentModel->remove(K_Db_Select::create()->where(array('comment_new'=>$data['tree_id'])));
	}
    
}
