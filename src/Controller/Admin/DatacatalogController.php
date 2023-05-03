<?php
namespace LinkedDataSets\Controller\Admin;

use Laminas\Mvc\Controller\AbstractActionController;
use Laminas\View\Model\ViewModel;

class DatacatalogController extends AbstractActionController
{

    private const DATACATALOG_LABEL = 'LDS Datacatalog';  # TODO naar ApiManagerHelper ?

    public function browseAction()
    {
        # TODO naar ApiManagerHelper ?

        $templates = $this->api()->search('resource_templates')->getContent();

        foreach ($templates as $template) {
            if ($template->label() === self::DATACATALOG_LABEL) {
                $catalogResourceTemplateId = $template->id();
                break;
            }
        }

        if (!$catalogResourceTemplateId) {
            throw new CatalogResourceTemplateDoesNotExists(
                'There\'s no resource template for LDS Datasets'
            );
        }

        $data = ['resource_template_id' => [$catalogResourceTemplateId]];

        $datacatalogs =  $this->api()
            ->search('items', $data)
            ->getContent();

        # TODO einde naar ApiManagerHelper ?

        # TODO hoe via LDS\UriHelper aan de goede URL te komen...
        #$baseUrl = $this->serviceLocator->get('LDS\UriHelper')->constructUri();
        $baseUrl="https://omeka.coret.org/data/files/datacatalogs/";

        $view = new ViewModel;
        $view->setVariable('datacatalogs', $datacatalogs);
        $view->setVariable('baseUrl', $baseUrl);
        return $view;
    }
}