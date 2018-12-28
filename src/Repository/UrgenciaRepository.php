<?php

namespace App\Repository;

use App\Entity\Urgencia;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Symfony\Bridge\Doctrine\RegistryInterface;

/**
 * @method Urgencia|null find($id, $lockMode = null, $lockVersion = null)
 * @method Urgencia|null findOneBy(array $criteria, array $orderBy = null)
 * @method Urgencia[]    findAll()
 * @method Urgencia[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class UrgenciaRepository extends ServiceEntityRepository
{
    public function __construct(RegistryInterface $registry)
    {
        parent::__construct($registry, Urgencia::class);
    }

    // /**
    //  * @return Urgencia[] Returns an array of Urgencia objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('u')
            ->andWhere('u.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('u.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?Urgencia
    {
        return $this->createQueryBuilder('u')
            ->andWhere('u.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
