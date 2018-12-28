<?php

namespace App\Form;

use App\Entity\Servicio;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;

class ServicioType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('nombre')
            ->add('telefono', TextType::class, array(
                'label' => 'Teléfono'
            ))
            ->add('direccion', TextType::class, array(
                'label' => 'Dirección'
            ))
            ->add('web')
            ->add('email')
            ->add('logo')
            ->add('save', SubmitType::class, array(
                'attr' => array('class' => 'btn float-right'),
                'label' => 'Guardar'
            ));
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Servicio::class,
        ]);
    }
}
