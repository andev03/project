package com.hoangan.securityproject.repository;

import com.hoangan.securityproject.pojos.Cards;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CardsRepository extends CrudRepository<Cards, String> {

    List<Cards> findByCustomerId(long customerId);

}
