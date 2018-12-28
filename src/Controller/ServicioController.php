<?php

namespace App\Controller;

use App\Entity\Servicio;
use App\Form\ServicioType;
use App\Repository\ServicioRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/servicio")
 */
class ServicioController extends AbstractController
{
    /**
     * @Route("/", name="servicio_index", methods={"GET"})
     */
    public function index(ServicioRepository $servicioRepository): Response
    {
        return $this->render('servicio/index.html.twig', ['servicios' => $servicioRepository->findAll()]);
    }

    /**
     * @Route("/new", name="servicio_new", methods={"GET","POST"})
     */
    public function new(Request $request): Response
    {
        $servicio = new Servicio();
        $form = $this->createForm(ServicioType::class, $servicio);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($servicio);
            $entityManager->flush();

            return $this->redirectToRoute('servicio_index');
        }

        return $this->render('servicio/new.html.twig', [
            'servicio' => $servicio,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="servicio_show", methods={"GET"})
     */
    public function show(Servicio $servicio): Response
    {
        return $this->render('servicio/show.html.twig', ['servicio' => $servicio]);
    }

    /**
     * @Route("/{id}/edit", name="servicio_edit", methods={"GET","POST"})
     */
    public function edit(Request $request, Servicio $servicio): Response
    {
        $form = $this->createForm(ServicioType::class, $servicio);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('servicio_index', ['id' => $servicio->getId()]);
        }

        return $this->render('servicio/edit.html.twig', [
            'servicio' => $servicio,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="servicio_delete", methods={"DELETE"})
     */
    public function delete(Request $request, Servicio $servicio): Response
    {
        if ($this->isCsrfTokenValid('delete'.$servicio->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($servicio);
            $entityManager->flush();
        }

        return $this->redirectToRoute('servicio_index');
    }

    /** 
     * @Route("/json", name="json_servicio")
     */
    public function jsonServicio()
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
        $repo = $this->getDoctrine()->getRepository(Servicio::class);
        $servicios = $repo->findAll();

        $jsonMensaje = $serializer->serialize($servicios, 'json');      
        $respuesta = new Response($jsonMensaje);   
        $respuesta->headers->set('Content-Type', 'application/json');
        $respuesta->headers->set('Access-Control-Allow-Origin', '*');    
        return $respuesta;
    }
}
