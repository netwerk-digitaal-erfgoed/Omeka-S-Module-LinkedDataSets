<?php
namespace LinkedDataSets\Controller\Admin;

use Laminas\Mvc\Controller\AbstractActionController;
use Laminas\View\Model\ViewModel;
use Log\Stdlib\PsrMessage;
use Omeka\Form\ConfirmForm;
use LinkedDataSets\Application\Job\DataDumpJob;

class DistributionTemplateController extends AbstractActionController
{

    public function browseAction()
    {
        # TODO: id van de LDS Distribution resource class / of resource template opzoeken ipv harcoded 1604

        $ldsDistributions = $this->api()->search('items', ['resource_class_id'=>1604,'sort_by' => 'modified', 'sort_order' => 'desc'])->getContent();

        
        $formCrawlSelected = $this->getForm(ConfirmForm::class);
        $formCrawlSelected
            ->setAttribute('action', $this->url()->fromRoute('admin/linked-data-sets-template', ['action' => 'crawl-distribution-selected'], true))
            ->setAttribute('id', 'confirm-crawl-selected');
        $formCrawlSelected
            ->setButtonLabel('Confirm crawl'); // @translate

        $formCrawlAll= $this->getForm(ConfirmForm::class);
        $formCrawlAll
            ->setAttribute('action', $this->url()->fromRoute('admin/linked-data-sets-template', ['action' => 'crawl-distribution-all'], true))
            ->setAttribute('id', 'confirm-crawl-all')
            ->get('submit')->setAttribute('disabled', true);
        $formCrawlAll
            ->setButtonLabel('Confirm crawl'); // @translate

        $view = new ViewModel;
        $view->setVariable('ldsDistributions', $ldsDistributions);
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
