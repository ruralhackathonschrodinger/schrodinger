<?php

namespace App\Form;

use App\Entity\Evento;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\TextType;

class EventoType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    { 
        $builder
            ->add('nombre')
            ->add('fecha')
            ->add('foto')
            ->add('descripcion', TextareaType::class, array(
                'label' => 'Descripción',
                'attr' => array('class' => 'tinymce', 
                                'rows'=>'5')
                ))
            ->add('localizacion', TextType::class, array(
                'label' => 'Localización'
            ))
            ->add('save', SubmitType::class, array(
                'attr' => array('class' => 'btn float-right'),
                'label' => 'Guardar'
            ));
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Evento::class,
        ]);
    }
}
