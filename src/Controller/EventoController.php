<?php

namespace App\Controller;

use App\Entity\Evento;
use App\Form\EventoType;
use App\Repository\EventoRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/evento")
 */
class EventoController extends AbstractController
{
    /**
     * @Route("/", name="evento_index", methods={"GET"})
     */
    public function index(EventoRepository $eventoRepository): Response
    {
        return $this->render('evento/index.html.twig', ['eventos' => $eventoRepository->findAll()]);
    }

    /**
     * @Route("/new", name="evento_new", methods={"GET","POST"})
     */
    public function new(Request $request): Response
    {
        $evento = new Evento();
        $form = $this->createForm(EventoType::class, $evento);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($evento);
            $entityManager->flush();

            return $this->redirectToRoute('evento_index');
        }

        return $this->render('evento/new.html.twig', [
            'evento' => $evento,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="evento_show", methods={"GET"})
     */
    public function show(Evento $evento): Response
    {
        return $this->render('evento/show.html.twig', ['evento' => $evento]);
    }

    /**
     * @Route("/{id}/edit", name="evento_edit", methods={"GET","POST"})
     */
    public function edit(Request $request, Evento $evento): Response
    {
        $form = $this->createForm(EventoType::class, $evento);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('evento_index', ['id' => $evento->getId()]);
        }

        return $this->render('evento/edit.html.twig', [
            'evento' => $evento,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="evento_delete", methods={"DELETE"})
     */
    public function delete(Request $request, Evento $evento): Response
    {
        if ($this->isCsrfTokenValid('delete'.$evento->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($evento);
            $entityManager->flush();
        }

        return $this->redirectToRoute('evento_index');
    }

    /** 
     * @Route("/json", name="json_evento")
     */
    public function jsonEvento()
    {
        $encoder = new JsonEncoder();
        $normalizer = new ObjectNormalizer();

        $callback = function ($dateTime) {
            return $dateTime instanceof \DateTime
                ? $dateTime->format('d-m-Y')
                : '';
        };

        $normalizer->setCallbacks(array('fecha' => $callback));

        $normalizer->setCircularReferenceLimit(0);
        $serializer = new Serializer(array($normalizer), array($encoder));

        $em = $this->getDoctrine()->getManager();
        $repo = $this->getDoctrine()->getRepository(Evento::class);
        $eventos = $repo->findAll();

        $jsonMensaje = $serializer->serialize($eventos, 'json');      
        $respuesta = new Response($jsonMensaje);   
        $respuesta->headers->set('Content-Type', 'application/json');
        $respuesta->headers->set('Access-Control-Allow-Origin', '*');    
        return $respuesta;
    }
}
