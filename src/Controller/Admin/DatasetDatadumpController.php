<?php
namespace LinkedDataSets\Controller\Admin;

use Laminas\Mvc\Controller\AbstractActionController;
use Laminas\View\Model\ViewModel;
use Log\Stdlib\PsrMessage;
use Omeka\Form\ConfirmForm;
use LinkedDataSets\Application\Job\DataDumpJob;

class DatasetDatadumpController extends AbstractActionController
{

    private const DATASET_LABEL = 'LDS Dataset';  # TODO naar ApiManagerHelper ?

    public function browseAction()
    {
        # TODO naar ApiManagerHelper ?

        $templates = $this->api()->search('resource_templates')->getContent();

        foreach ($templates as $template) {
            if ($template->label() === self::DATASET_LABEL) {
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

        # TODO - nu overzicht van alle datasets, maar moet een overzicht worden van datasets die een schema:isBasedOn (itemset) hebben
        #        en gedefinieerde distributie in ondersteund formaat
        $datasets =  $this->api()
            ->search('items', $data)
            ->getContent();

        # TODO einde naar ApiManagerHelper ?

        $formCrawlSelected = $this->getForm(ConfirmForm::class);
        $formCrawlSelected
            ->setAttribute('action', $this->url()->fromRoute('admin/linked-data-sets', ['action' => 'crawl-distribution-selected'], true))
            ->setAttribute('id', 'confirm-crawl-selected');
        $formCrawlSelected
            ->setButtonLabel('Confirm crawl'); // @translate

        $formCrawlAll= $this->getForm(ConfirmForm::class);
        $formCrawlAll
            ->setAttribute('action', $this->url()->fromRoute('admin/linked-data-sets', ['action' => 'crawl-distribution-all'], true))
            ->setAttribute('id', 'confirm-crawl-all')
            ->get('submit')->setAttribute('disabled', true);
        $formCrawlAll
            ->setButtonLabel('Confirm crawl'); // @translate

        $view = new ViewModel;
        $view->setVariable('datasets', $datasets);
        $view->setVariable('formCrawlAll', $formCrawlAll);
        $view->setVariable('formCrawlSelected', $formCrawlSelected);
        return $view;
    }

    public function crawlDistributionSelectedAction()
    {
        if (!$this->getRequest()->isPost()) {
            return $this->redirect()->toRoute(null, ['action' => 'browse'], true);
        }

        $resourceIds = $this->params()->fromPost('resource_ids', []);
        if (!$resourceIds) {
            $this->messenger()->addError('You must select at least one log to batch delete.'); // @translate
            return $this->redirect()->toRoute(null, ['action' => 'browse'], true);
        }

        $form = $this->getForm(ConfirmForm::class);
        $form->setData($this->getRequest()->getPost());
        if ($form->isValid()) {
            
            foreach($resourceIds as $resourceId) {
                $job = $this->jobDispatcher()->dispatch(DataDumpJob::class, [ 'id' => $resourceId ]);
                $jobid=$job->getId();

                $message = new PsrMessage(
                    'Making datadump for distribution {resourceId} in the background (<a href="{job_url}">job #{job_id}</a>). This may take a while.', // @translate
                    [
                        'resourceId' => $resourceId,
                        'job_url' => htmlspecialchars($this->url()->fromRoute('admin/id', ['controller' => 'job', 'id' => $jobid])),
                        'job_id' => $jobid,
                    ]
                );
                $message->setEscapeHtml(false);
                $this->messenger()->addSuccess($message);
            }
            
        } else {
            $this->messenger()->addFormErrors($form);
        }
        return $this->redirect()->toRoute(null, ['action' => 'browse'], true);
    }   
    
    public function crawlDistributionAllAction()
    {
        # TODO, implement (no resourceIds in post...)
        return $this->crawlDistributioncrawlDistributionSelectedActionAllAction();
    }   
}
