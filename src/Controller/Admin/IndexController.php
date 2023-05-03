<?php
namespace LinkedDataSets\Controller\Admin;

use Laminas\Mvc\Controller\AbstractActionController;

class IndexController extends AbstractActionController
{
    public function indexAction()
    {
        return $this->redirect()->toRoute('admin/linked-data-sets-template', []);
    }
}
