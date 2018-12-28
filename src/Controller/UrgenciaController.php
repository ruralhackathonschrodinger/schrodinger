<?php

namespace App\Controller;

use App\Entity\Urgencia;
use App\Form\UrgenciaType;
use App\Repository\UrgenciaRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/urgencia")
 */
class UrgenciaController extends AbstractController
{
    /**
     * @Route("/", name="urgencia_index", methods={"GET"})
     */
    public function index(UrgenciaRepository $urgenciaRepository): Response
    {
        return $this->render('urgencia/index.html.twig', ['urgencias' => $urgenciaRepository->findAll()]);
    }

    /**
     * @Route("/new", name="urgencia_new", methods={"GET","POST"})
     */
    public function new(Request $request): Response
    {
        $urgencium = new Urgencia();
        $form = $this->createForm(UrgenciaType::class, $urgencium);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($urgencium);
            $entityManager->flush();

            return $this->redirectToRoute('urgencia_index');
        }

        return $this->render('urgencia/new.html.twig', [
            'urgencium' => $urgencium,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="urgencia_show", methods={"GET"})
     */
    public function show(Urgencia $urgencium): Response
    {
        return $this->render('urgencia/show.html.twig', ['urgencium' => $urgencium]);
    }

    /**
     * @Route("/{id}/edit", name="urgencia_edit", methods={"GET","POST"})
     */
    public function edit(Request $request, Urgencia $urgencium): Response
    {
        $form = $this->createForm(UrgenciaType::class, $urgencium);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('urgencia_index', ['id' => $urgencium->getId()]);
        }

        return $this->render('urgencia/edit.html.twig', [
            'urgencium' => $urgencium,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="urgencia_delete", methods={"DELETE"})
     */
    public function delete(Request $request, Urgencia $urgencium): Response
    {
        if ($this->isCsrfTokenValid('delete'.$urgencium->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($urgencium);
            $entityManager->flush();
        }

        return $this->redirectToRoute('urgencia_index');
    }

    /** 
     * @Route("/json", name="json_urgencia")
     */
    public function jsonUrgencia()
    {
        $encoder = new JsonEncoder();
        $normalizer = new ObjectNormalizer();

        /*$callback = function ($dateTime) {
            return $dateTime instanceof \DateTime
                ? $dateTime->format('d-m-Y')
                : '';
        };

        $normalizer->setCallbacks(array('fecha' => $callback));*/

        $normalizer->setCircularReferenceLimit(0);
        $serializer = new Serializer(array($normalizer), array($encoder));

        $em = $this->getDoctrine()->getManager();
        $repo = $this->getDoctrine()->getRepository(Urgencia::class);
        $urgencias = $repo->findAll();

        $jsonMensaje = $serializer->serialize($urgencias, 'json');      
        $respuesta = new Response($jsonMensaje);   
        $respuesta->headers->set('Content-Type', 'application/json');
        $respuesta->headers->set('Access-Control-Allow-Origin', '*');    
        return $respuesta;
    }
}
