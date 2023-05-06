<?php
namespace LinkedDataSets\Controller\Admin;

use Laminas\Mvc\Controller\AbstractActionController;
use Laminas\View\Model\ViewModel;
use LinkedDataSets\Infrastructure\Exception\CatalogResourceTemplateDoesNotExists;
use LinkedDataSets\Infrastructure\Helpers\UriHelper;

class DatacatalogController extends AbstractActionController
{

    protected UriHelper $uriHelper;
    public function __construct(UriHelper $uriHelper)
    {
        $this->uriHelper = $uriHelper;
    }

    private const DATACATALOG_LABEL = 'LDS Datacatalog';  # TODO naar ApiManagerHelper ?

    public function browseAction()
    {
        # TODO naar ApiManagerHelper ?
        $template = $this->api()->searchOne('resource_templates', ['label' => self::DATACATALOG_LABEL])->getContent();

        if (!$template) {
            throw new CatalogResourceTemplateDoesNotExists(
                'There\'s no resource template for LDS Datasets'
            );
        }

        $datacatalogs = $this->api()
            ->search('items', ['resource_template_id' => $template->id()])
            ->getContent();

        # TODO einde naar ApiManagerHelper ?

        # TODO hoe via LDS\UriHelper aan de goede URL te komen...
        $baseUrl = $this->uriHelper->constructUri() . '/files/datacatalogs/';

        $view = new ViewModel;
        $view->setVariable('datacatalogs', $datacatalogs);
        $view->setVariable('baseUrl', $baseUrl);
        return $view;
    }
}